ENV["ELONG_ENV"] = 'production'
require 'db'
require 'query'

module Db
  class BidQihuHotel201402History < ActiveRecord::Base
    self.table_name = "bid_qihu_hotel_201402_histories"
  end
end

module AgaBid
  class BidHistoryGenerate
    def generate(se_production,elong_production,keyword_string)
      keyword_class = Db::Keyword.config(Db::EnvConfig.new(se_production,elong_production,"exact"))
      query_engine = get_query_engine(se_production)
      page = query_engine.query(keyword_string)
      p page.raw_ranks
    end
    def get_query_engine(se_production)
      query_engine = case se_production
              when "baidu" then Query::Engine::Baidu.new
              when "qihu" then Query::Engine::Qihu.new
              when "sogou" then Query::Engine::Sogou.new
              else nil
              end
      query_engine  
    end
  end
end

AgaBid::BidHistoryGenerate.new.generate("qihu","hotel","东方广场酒店预订")
