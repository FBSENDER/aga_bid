require 'spec_helper'

describe AgaBid::BidJobExecute do 
	subject{AgaBid::BidJobExecute.new("qihu","hotel")}
	describe '#get_top_1000_jobs' do 
		it "this method will return a bid_job list" do 
			bid_job_list = subject.get_top_1000_jobs
			expect(bid_job_list).to have_at_most(1000).items
			expect(bid_job_list).to have_at_least(0).items
		end
	end

	describe '#do_with_init_job' do 

	end

	describe '#do_with_reduce_job' do 

	end

	describe '#do_with_increase_job' do 

	end

end