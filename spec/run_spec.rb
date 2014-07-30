require 'spec_helper'

#describe AgaBid::BidJobExecute do 
 # it "runs loop" do 
    bid_job_execute = AgaBid::BidJobExecute.new("qihu","hotel")
    round = 1
    loop do
      puts "round #{round}"
      t = Time.now 
      jobs = bid_job_execute.get_top_1000_jobs
      bid_job_execute.bid(jobs)
      puts "耗时 #{t - Time.now}"
      sleep 20
      round += 1
      bid_job_execute.refresh_account_info
    end
 # end
#end
