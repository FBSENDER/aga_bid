module AgaBid
  class BaiduBidJobGenerate
    def initialize
      @job_class = Db::BidJob.config(Db::EnvConfig.new("baidu","hotel","exact"))
    end

    def baidu_jiudian_generate(keyword_string,max_cpc,target_position)
      return if @job_class.exists?(:keyword_string => keyword_string)
      keyword_class = Db::Keyword.config(Db::EnvConfig.new("baidu","jiudian","exact"))
      exact_keywords = keyword_class.where(:keyword_string => keyword_string,:status => 1)
      max_quality_score = exact_keywords.map{|item| item.quality_score}.max
      max_price = exact_keywords.select{|item| item.quality_score == max_quality_score}.map{|item| item.price}.max
      bid_exact_keyword = exact_keywords.select{|item| item.quality_score == max_quality_score && item.price == max_price}.first
      bid_phrase_keyword = nil
      exact_keywords.each do |keyword|
        next if keyword.id == bid_exact_keyword.id
        keyword.status = 21
        keyword.update_by = 'bid_generate'
        keyword.save
      end
      keyword_class = Db::Keyword.config(Db::EnvConfig.new("baidu","jiudian","phrase"))
      phrase_keywords = keyword_class.where(:keyword_string => keyword_string,:status => 1)
      max_quality_score = phrase_keywords.map{|item| item.quality_score}.max
      max_price = phrase_keywords.select{|item| item.quality_score == max_quality_score}.map{|item| item.price}.max
      bid_phrase_keyword = phrase_keywords.select{|item| item.quality_score == max_quality_score && item.price == max_price}.first
      phrase_keywords.each do |keyword|
        next if keyword.id == bid_phrase_keyword.id
        keyword.status = 21
        keyword.update_by = 'bid_generate'
        keyword.save
      end
      raise "no exact and phrase keyword #{keyword_string}" if exact_keywords.size == 0 && phrase_keywords.size == 0
      bid_job = @job_class.new
      bid_job.keyword_string = keyword_string
      bid_job.target_position = target_position
      bid_job.init_target_position = target_position
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

    def update_keyword_info(keyword_string,match_type = "exact")
      @keyword_class = Db::Keyword.config(Db::EnvConfig.new("baidu","jiudian",match_type))
      keywords = @keyword_class.where(:keyword_string => keyword_string,:status => [0,1,2]).to_a
      return if keywords.size == 0      
      command = AgaUpload::Command.new
      args = Hash.new
      args["se_production"] = "baidu"
      args["elong_production"] = "jiudian"
      args["match_type"] = match_type
      keywords.each do |keyword|
        args["keyword_id"] = keyword.id
        command.keyword_get_status(args)
        command.keyword_get_info(args)
        p keyword
      end
    end

  end
end
