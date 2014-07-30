module AgaBid
  class BidJobExecute
    def initialize(search_engine,elong_production)
      @search_engine = search_engine
      @elong_product = elong_production
      @exact_api_account = Hash.new
      @phrase_api_account = Hash.new
      env_config = Db::EnvConfig.new(search_engine,elong_production,"exact")
      @bid_job_class = Db::BidJob.config(env_config)
      @bid_history_class = Db::BidHistory.config(env_config)
      refresh_account_info
    end
    def refresh_account_info
      Db::Account.init({:se => @search_engine,:product => @elong_product,:match_type => "exact"}).all.each do |account|
        api_account = AgaApiFactory::Model::Account.new
        api_account.account_name = account.account_name
        api_account.password = account.password
        api_account.api_key = account.api_key
        api_account.search_engine = @search_engine
        @exact_api_account[account.id] = api_account 
      end
      Db::Account.init({:se => @search_engine,:product => "jiudian",:match_type => "exact"}).all.each do |account|
        api_account = AgaApiFactory::Model::Account.new
        api_account.account_name = account.account_name
        api_account.password = account.password
        api_account.api_key = account.api_key
        api_account.search_engine = @search_engine
        @exact_api_account[account.id + 1000] = api_account 
      end
      Db::Account.init({:se => @search_engine,:product => @elong_product,:match_type => "exact"}).all.each do |account|
        api_account = AgaApiFactory::Model::Account.new
        api_account.account_name = account.account_name
        api_account.password = account.password
        api_account.api_key = account.api_key
        api_account.search_engine = @search_engine
        @phrase_api_account[account.id] = api_account 
      end
      Db::Account.init({:se => @search_engine,:product => "jiudian",:match_type => "phrase"}).all.each do |account|
        api_account = AgaApiFactory::Model::Account.new
        api_account.account_name = account.account_name
        api_account.password = account.password
        api_account.api_key = account.api_key
        api_account.search_engine = @search_engine
        @phrase_api_account[account.id + 1000] = api_account 
      end
    end
    def get_top_1000_jobs
      db_bid_jobs = @bid_job_class.where("status in (?) and run_time < ?",[0,1,2],Time.now.utc).order("run_time").limit(300).to_a
      bid_jobs = Array.new
      db_bid_jobs.each do |job|
        bid_jobs << AgaBid::Model::BidJob.new(job)
      end
      bid_jobs
    end

    def bid(jobs)
      p jobs
      return if jobs.nil? || jobs.size <= 0
      updated_jobs = Array.new
      histories = Array.new
      threads = Array.new 
      begin
        1.times do 
          threads << Thread.new do 
            loop do 
              job = jobs.shift
              break if job.nil?
              histories << execute(job)
              if job.current_position == -1
                jobs.push(job)
                sleep 20
                next
              end
              updated_jobs << job.db_bid_job
              sleep 0.5
            end
            Thread.exit
          end
        end
        threads.each{|t|t.join}
      rescue Exception => ex 
        puts ex
      ensure
        updated_jobs.each{|job| job.save}
        histories.each{|history| history.save unless history.nil?}
      end
    end
    def bid_baidu(jobs)
      p jobs
      return if jobs.nil? || jobs.size <= 0
      jobs.each do |job| 
        begin
          history = execute(job)
          job.db_bid_job.save
          history.save unless history.nil?
          sleep 1 
        rescue Exception => ex
          puts ex
          next
        end
      end
    end

    def execute(job)
      if job.get_job_history.nil?
        job.init_job_history
      end
      rank = GetRank.get_rank(job.keyword_string,@search_engine,@elong_product)
      job.current_position = rank[:position]
      job.current_side = rank[:side]
      if job.current_position == 0
        job.no_rank
      end
      #if @search_engine == "qihu" && job.exact_keyword_uuid != rank[:uuid]
      #  job.be_covered_with_other_word
      #end
      history = build_history(job,rank[:uuid])
      job.add_job_history(history)
      case job.status
      when 0 then do_with_init_job(job)
      when 1 then do_with_reduce_job(job)
      when 2 then do_with_increase_job(job)
      when 11 then do_with_no_rank_job(job)
      #目前判定竞价词被其他词覆盖的逻辑已不可用
      #when 13 then do_with_be_covered_with_other_word(job)
      end
      history
    end

    def do_with_init_job(job)
      if job.current_price < job.min_price
        job.increase_price_to_min_price
        modify_price(job)
        job.finished
        return
      end
      if job.current_price > job.max_price
        job.reduce_price_to_max_price
        modify_price(job)
        job.finished
        return
      end
      if job.goal? #达到目标排名
        if job.current_price == job.min_price
          job.finished
        else 
          job.reduce_price
          modify_price(job)
          job.next_step
        end
      else
        if job.current_price == job.max_price
          job.reduce_target
        else
          job.increase_price
          modify_price(job)
          job.next_step
        end
      end
    end

    def do_with_reduce_job(job)
      if job.goal? #达到目标排名
        if job.current_price > job.min_price
          job.reduce_price
          modify_price(job)
          job.next_step
        else
          job.finished
        end
      else
        job.recover_price
        modify_price(job)
        job.finished
      end 
    end

    def do_with_increase_job(job)
      if job.goal? #达到目标排名
        job.finished
      else 
        if job.current_price < job.max_price
          job.increase_price
          modify_price(job)
          job.next_step
        else
          job.reduce_target
          modify_price(job)
        end
      end
    end

    def do_with_no_rank_job(job)
      if job.current_price < job.min_price
        job.increase_price_to_min_price
        modify_price(job)
        job.next_step
      end
    end
    def do_with_be_covered_with_other_word(job)
      if job.current_price < job.pre_price
        job.recover_price
        modify_price(job)
        job.finished
      end
    end

    def modify_price(job)
      begin
        if job.exact_keyword_se_id > 0
          sleep 0.5
          exact_service = AgaApiFactory::Service::KeywordService.new
          exact_service.set_account(@exact_api_account[job.exact_account_id])
          keyword = AgaApiFactory::Model::Keyword.new
          keyword.se_id = job.exact_keyword_se_id
          keyword.price = job.current_price
          keyword.status = 31
          exact_service.handle([keyword],"update")
        end
        return #暂时不修改对应的短语价格
        if job.phrase_keyword_se_id > 0
          phrase_service = AgaApiFactory::Service::KeywordService.new
          phrase_service.set_account(@phrase_api_account[job.phrase_account_id])
          phrase_keyword = AgaApiFactory::Model::Keyword.new
          phrase_keyword.se_id = job.phrase_keyword_se_id
          phrase_keyword.price = [job.current_price * 0.8,job.min_price].max
          phrase_keyword.status = 31
          phrase_service.handle([phrase_keyword],"update")
        end
      rescue Exception => ex 
        job.status = 12
        p job
        puts ex.to_s 
      end
    end

    def build_history(job,keyword_uuid = '')
      history = @bid_history_class.new
      history.job_id = job.id
      history.keyword_id = job.exact_keyword_id 
      history.keyword_string = job.keyword_string
      history.price = job.current_price * 1.0
      history.target_position = job.target_position
      history.position = job.current_position
      history.side = job.current_side
      if @search_engine == "qihu"
        history.keyword_uuid = job.exact_keyword_uuid
        history.keyword_uuid = keyword_uuid if !keyword_uuid.nil? &&keyword_uuid != ''
      end
      history.log_time = Time.now
      history
    end

  end
end
