module AgaBid
  class BidJobGenerate
    def initialize(search_engine,elong_product)
      @search_engine = search_engine
      @elong_product = elong_product
      @job_class = Db::BidJob.config(Db::EnvConfig.new(search_engine,elong_product,"exact"))
    end
    def get_account_id_by_keyword_id(keyword_id,se,product,match_type)
      account_class = Db::Account.config(Db::EnvConfig.new(se,product,match_type))
      account = account_class.find_by_sql("
                                select  a.*
                                from    #{account_class.table_name} a
                                        join sem_#{se}_#{product}_#{match_type}_campaigns c on c.account_id = a.id
                                        join sem_#{se}_#{product}_#{match_type}_adgroups g on g.campaign_id = c.id
                                        join sem_#{se}_#{product}_#{match_type}_keywords k on k.adgroup_id = g.id
                                where   k.id = #{keyword_id}
                                ").first
      return 0 if account.nil?
      account.id
    end
    def qihu_generate_or_update(keyword_string,rank,max_price)
      # update keyword status + quality_score,do it outside this gem
      # check if exists in bid_job
      # update if exists 
      # generate unless exists
      bid_job = @job_class.where(:keyword_string => keyword_string).first
      unless bid_job.nil?
        bid_job.current_position = 0 
        bid_job.current_side = 0 
        bid_job.status = 0
        bid_job.max_price = max_price
        bid_job.init_target_position = rank
        bid_job.target_position = rank
        bid_job.save
        return
      end
      keyword_exact_class= Db::Keyword.config(Db::EnvConfig.new("qihu","hotel","exact"))
      keyword = keyword_exact_class.where(:keyword_string => keyword_string).first
      return if keyword.nil?
      bid_job = @job_class.new
      bid_job.keyword_string = keyword.keyword_string
      bid_job.init_target_position = rank
      bid_job.target_position = rank
      bid_job.exact_keyword_id = keyword.id
      bid_job.exact_keyword_se_id = keyword.se_id 
      bid_job.exact_account_id = get_account_id_by_keyword_id(keyword.id,"qihu","hotel","exact")
      return if bid_job.exact_account_id == 0
      bid_job.current_price = keyword.price 
      bid_job.pre_price = keyword.price 
      bid_job.max_price = max_price
      bid_job.min_price = 1
      keyword_phrase_class = Db::Keyword.config(Db::EnvConfig.new(@search_engine,@elong_product,"phrase"))
      keyword_phrase = keyword_phrase_class.where(:keyword_string => keyword_string).first
      unless keyword_phrase.nil?
        bid_job.phrase_keyword_id = keyword_phrase.id 
        bid_job.phrase_keyword_se_id = keyword_phrase.se_id 
        bid_job.phrase_account_id = get_account_id_by_keyword_id(keyword_phrase.id,"qihu","hotel","phrase")
      end
      bid_job.current_position = 0
      bid_job.current_side = 0
      bid_job.create_time = Time.now
      bid_job.update_time = Time.now
      bid_job.run_time = Time.now
      bid_job.save
    end
    def generate_by_keyword_string(keyword_string)
      keyword_class = Db::Keyword.config(Db::EnvConfig.new(@search_engine,@elong_product,"exact"))
      keyword = keyword_class.where(:keyword_string => keyword_string,:status => 0).first
      return if keyword.nil?
      bid_job = @job_class.new
      bid_job.keyword_string = keyword.keyword_string
      bid_job.exact_keyword_id = keyword.id
      bid_job.exact_keyword_se_id = keyword.se_id 
      bid_job.exact_account_id = 6
      bid_job.current_price = keyword.price 
      bid_job.pre_price = keyword.price 
      bid_job.max_price = 7
      bid_job.min_price = 1
      keyword_phrase_class = Db::Keyword.config(Db::EnvConfig.new(@search_engine,@elong_product,"phrase"))
      keyword_phrase = keyword_phrase_class.where(:keyword_string => keyword_string,:status => 1).first
      unless keyword_phrase.nil?
        bid_job.phrase_keyword_id = keyword_phrase.id 
        bid_job.phrase_keyword_se_id = keyword_phrase.se_id 
        bid_job.phrase_account_id = Db::Account.config(Db::EnvConfig.new(@search_engine,@elong_product,"phrase")).find_by_sql("
select a.*
from sem_#{@search_engine}_#{@elong_product}_phrase_accounts a
join sem_#{@search_engine}_#{@elong_product}_phrase_campaigns c on c.account_id = a.id
join sem_#{@search_engine}_#{@elong_product}_phrase_adgroups g on g.campaign_id = c.id
join sem_#{@search_engine}_#{@elong_product}_phrase_keywords k on g.id = k.adgroup_id
where k.id = #{keyword_phrase.id}
          ").first.id
      end
      bid_job.current_position = 0
      bid_job.current_side = 0
      bid_job.create_time = Time.now
      bid_job.update_time = Time.now
      bid_job.run_time = Time.now
      bid_job.save
    end
    def last_month_have_clicks_generate
      @transform_class.where("match_type = ? and sem_clicks > ?",1,0).limit(10).each do |transform|
        keyword_class = Db::Keyword.config(Db::EnvConfig.new("qihu","hotel","exact"))
        keyword = keyword_class.find(transform.keyword_id)
        next if keyword.nil?
        bid_job = Db::BidJob.new
        bid_job.keyword_string = keyword.keyword_string
        bid_job.exact_keyword_id = keyword.keyword_id
        bid_job.exact_keyword_se_id = keyword.se_id 
        bid_job.exact_account_id = transform.account_id
        bid_job.current_price = keyword.price 
        bid_job.pre_price = keyword.price 
        bid_job.max_price = 10
        keyword_phrase_class = Db::Keyword.config(Db::EnvConfig.new("qihu","hotel","phrase"))
        keyword_phrase = keyword_phrase_class.where(:keyword_string => keyword.keyword_string).first
        unless keyword_phrase
          bid_job.phrase_keyword_id = keyword_phrase.id 
          bid_job.phrase_keyword_se_id = keyword_phrase.se_id 
          bid_job.phrase_account_id = 0
        end
        bid_job.current_position = 0
        bid_job.current_side = 0
        bid_job.create_time = Time.now
        bid_job.update_time = Time.now
        bid_job.run_time = Time.now
      end
    end

    def baidu_jiudian_generate(keyword_string,max_cpc,target_position)
      keyword_class = Db::Keyword.config(Db::EnvConfig.new("baidu","jiudian","exact"))
      exact_keywords = keyword_class.where(:keyword_string => keyword_string,:status => [0,1])
      max_price = exact_keywords.map{|item| item.price}.max
      bid_exact_keyword = nil
      bid_phrase_keyword = nil
      exact_keywords.each do |keyword|
        if keyword.price == max_price && bid_exact_keyword.nil?
            bid_exact_keyword = keyword
        else 
          keyword.status = 21
          keyword.update_by = 'bid_generate'
          keyword.save
        end
      end
      keyword_class = Db::Keyword.config(Db::EnvConfig.new("baidu","jiudian","phrase"))
      phrase_keywords = keyword_class.where(:keyword_string => keyword_string,:status => [0,1])
      if phrase_keywords.size > 0
        max_price = phrase_keywords.map{|item| item.price}.max 
        phrase_keywords.each do |keyword|
          if keyword.price == max_price && bid_phrase_keyword.nil?
            bid_phrase_keyword = keyword 
          else
            keyword.status = 21
            keyword.update_by = 'bid_generate'
            keyword.save
          end
        end
      end
      raise "no exact and phrase keyword #{keyword_string}" if exact_keywords.size == 0 && phrase_keywords.size == 0
      bid_job = @job_class.new
      bid_job.keyword_string = keyword_string
      bid_job.target_position = target_position
      bid_job.exact_keyword_id = 0
      bid_job.exact_keyword_se_id = 0
      bid_job.exact_account_id = 0
      unless  bid_exact_keyword.nil?
        bid_job.current_price = bid_exact_keyword.price 
        bid_job.pre_price = bid_exact_keyword.price
        bid_job.exact_keyword_id = bid_exact_keyword.id
        bid_job.exact_keyword_se_id = bid_exact_keyword.se_id 
        bid_job.exact_account_id = Db::Account.config(Db::EnvConfig.new("baidu","jiudian","exact")).find_by_sql("
  select a.*
  from sem_baidu_jiudian_exact_accounts a
  join sem_baidu_jiudian_exact_campaigns c on c.account_id = a.id
  join sem_baidu_jiudian_exact_adgroups g on g.campaign_id = c.id
  join sem_baidu_jiudian_exact_keywords k on g.id = k.adgroup_id
  where k.id = #{bid_exact_keyword.id}
            ").first.id + 1000
      end
      unless  bid_phrase_keyword.nil?
        bid_job.current_price = bid_phrase_keyword.price 
        bid_job.pre_price = bid_phrase_keyword.price 
        bid_job.phrase_keyword_id = bid_phrase_keyword.id 
        bid_job.phrase_keyword_se_id = bid_phrase_keyword.se_id 
        bid_job.phrase_account_id = Db::Account.config(Db::EnvConfig.new("baidu","jiudian","phrase")).find_by_sql("
select a.*
from sem_baidu_jiudian_phrase_accounts a
join sem_baidu_jiudian_phrase_campaigns c on c.account_id = a.id
join sem_baidu_jiudian_phrase_adgroups g on g.campaign_id = c.id
join sem_baidu_jiudian_phrase_keywords k on g.id = k.adgroup_id
where k.id = #{bid_phrase_keyword.id}
          ").first.id + 1000
      end 
      if !bid_exact_keyword.nil? && !bid_phrase_keyword.nil?
        bid_job.current_price = [bid_exact_keyword.price,bid_phrase_keyword.price].max 
        bid_job.pre_price = [bid_exact_keyword.price,bid_phrase_keyword.price].max 
      end
      bid_job.max_price = max_cpc
      bid_job.min_price = 3
      bid_job.current_position = 0
      bid_job.current_side = 0
      bid_job.create_time = Time.now
      bid_job.update_time = Time.now
      bid_job.run_time = Time.now
      bid_job.save
    end

  end
end
