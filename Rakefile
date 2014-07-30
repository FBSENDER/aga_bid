ENV["ELONG_ENV"] = "production"
require "bundler/gem_tasks"
require_relative "lib/aga_bid"
require "aga_upload"

task :run_qihu do
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
end

task :run_baidu do
  bid_job_execute = AgaBid::BidJobExecute.new("baidu","hotel")
  round = 1
  loop do
    puts "round #{round}"
    t = Time.now 
    jobs = bid_job_execute.get_top_1000_jobs
    bid_job_execute.bid_baidu(jobs)
    puts "耗时 #{t - Time.now}"
    sleep 20
    round += 1
    bid_job_execute.refresh_account_info
  end
end

task :run_baidu_global do
  bid_job_execute = AgaBid::BidJobExecute.new("baidu","global")
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
end

task :run_baidu_mhotel do
  bid_job_execute = AgaBid::BidJobExecute.new("baidu","mhotel")
  round = 1
  loop do
    puts "round #{round}"
    t = Time.now 
    jobs = bid_job_execute.get_top_1000_jobs
    bid_job_execute.bid_baidu(jobs)
    puts "耗时 #{t - Time.now}"
    sleep 20
    round += 1
  end
end
