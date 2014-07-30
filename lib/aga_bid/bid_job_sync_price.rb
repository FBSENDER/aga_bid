module AgaBid
  class BidJobSyncPrice
    def sync_price
      arg_exact = Hash.new
      arg_phrase = Hash.new
      arg_exact["se_production"] = "qihu"
      arg_exact["elong_production"] = "hotel"
      arg_exact["match_type"] = "exact"
      arg_phrase["se_production"] = "qihu"
      arg_phrase["elong_production"] = "hotel"
      arg_phrase["match_type"] = "phrase"
      Db::BidJob.config(Db::EnvConfig.new("qihu","hotel","exact"))
      command = AgaUpload::Command.new
      index = 0
      Db::BidJob.where("status in (0)").each do |job|
        arg_exact["keyword_id"] = job.exact_keyword_id
        command.keyword_get_info(arg_exact)
        arg_phrase["keyword_id"] = job.phrase_keyword_id
        command.keyword_get_info(arg_phrase) if job.phrase_keyword_id > 0
        index += 1
        puts "index #{index}" if index % 100 == 0
      end
    end
    def baidu_jiudian_sync_price
      Db::BidJob.config(Db::EnvConfig.new("baidu","hotel","exact"))
      arg_exact = Hash.new
      arg_phrase = Hash.new
      arg_exact["se_production"] = "baidu"
      arg_exact["elong_production"] = "jiudian"
      arg_exact["match_type"] = "exact"
      arg_phrase["se_production"] = "baidu"
      arg_phrase["elong_production"] = "jiudian"
      arg_phrase["match_type"] = "phrase"
      command = AgaUpload::Command.new
      index = 0
      Db::BidJob.where("status in (10,11)").each do |job|
        arg_exact["keyword_id"] = job.exact_keyword_id
        p job.exact_keyword_id
        command.keyword_get_info(arg_exact)
        arg_phrase["keyword_id"] = job.phrase_keyword_id
        command.keyword_get_info(arg_phrase) if job.phrase_keyword_id > 0
        index += 1
        puts "index #{index}" if index % 100 == 0
      end
    end
  end
end
