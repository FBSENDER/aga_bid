require 'db'
require 'query'
require 'aga_api_factory'
require 'aga_upload'
require "aga_bid/model"
require "aga_bid/bid_job_get_rank"
require "aga_bid/bid_job_execute"
require "aga_bid/bid_job_generate"
require "aga_bid/bid_job_sync_price"
require "aga_bid/version"
require "aga_bid/baidu_bid_job_generate"

module Query
  module Result
    class BaiduMobileApi
      def seo_ranks
        [{
          text: "xxx",
          href: "http://nil.com",
          host: "http://nil.com",
          rank: 1 
        }]      
      end
      def ads_right
        [{
          text: "xxx",
          href: "http://nil.com",
          host: "http://nil.com",
          rank: 1 
        }]      
      end
    end
  end
end
