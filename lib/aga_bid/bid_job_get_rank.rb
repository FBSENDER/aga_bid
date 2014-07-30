require 'baidu'
require 'query'
require 'base64'
require 'zlib'


module Baidu
  module SEM
    class RankService < Base
      # include Baidu::Rank
    end
  end
end

module AgaBid
  class GetRank
    def self.get_rank(keyword_string,search_engine,product)
      device = 0
      device = 1 if product == "mhotel"
      self.send(search_engine + "_get_rank",keyword_string,device)
    end

    def self.qihu_get_rank(keyword_string,device = 0)
      begin
        query_engine = Query::Engine::Qihu.new
        query_result = query_engine.query(keyword_string)
        return {:side => -1,:position => -1,:blocked_ip => query_result.blocked_ip} if query_result.blocked?
        rank = query_result.rank(/elong.com$/)  
        #raw_ranks = query_result.raw_ranks
        puts keyword_string
        p rank
        return {:side => 1,:position => rank[1]} unless rank[1].nil? #顶部广告排名 #,:uuid => get_keyword_uuid(raw_ranks["ads_top"][rank[1] - 1][:href])}
        return {:side => 2,:position => rank[2]} unless rank[2].nil? #右侧广告排名#,:uuid => get_keyword_uuid(raw_ranks["ads_right"][rank[2] - 1][:href])}
        {:side => 0,:position => 0} #无广告排名
      rescue Exception => ex 
        warn "get_rank_error: #{ex.to_s}"
        return {:side => 0,:position => 0}
      end
    end

    def self.get_keyword_uuid(href)
      semtcid = /semtcid=[a-zA-Z0-9\-]*/.match(href).to_s
      semtcid[8..(semtcid.size-1)]
    end

    def self.baidu_get_rank(keyword_string,device = 0,domain = 'elong.com')
      service = self.baidu_rank_service
      result = service.getPreview(:keyWords => [keyword_string],:device => device,:region => 4084,:page=>0,:display => 0)
      if result.body.nil?
        p result
        return {:side => -1,:position => -1,:blocked_ip => "query_result.blocked_ip"} 
      end
      info = result.body[:preview_infos]
      puts "info nil" if info.nil?
      data = info[:data]
      plain = Base64.decode64(data)
      gz = Zlib::GzipReader.new(StringIO.new(plain))    
      html_result = gz.read
      gz.close
      if device == 0
        rank = Query::Result::Baidu.new(html_result).rank(/#{domain}/)
      else
        rank = Query::Result::BaiduMobileApi.new(html_result).rank(/#{domain}/)
      end
      puts keyword_string
      p rank
      return {:side => 1,:position => rank[1]} unless rank[1].nil? #顶部广告排名
      return {:side => 2,:position => rank[2]} unless rank[2].nil? #右侧广告排名
      {:side => 0,:position => 0} #无广告排名
    end

    def self.baidu_rank_service
        #需要开通了实况查询接口的帐号
        auth = Baidu::Auth.new
        auth.username = ''
        auth.password = ''
        auth.token = ''
        Baidu::SEM::RankService.new(auth)
    end
  end
end


