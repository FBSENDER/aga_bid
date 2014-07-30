# require 'spec_helper'

# describe AgaBid::Model::BidJob do
# 	it "Db::BidJob proxy works" do 
# 		db_job = Db::BidJob.take
# 		bid_job = AgaBid::Model::BidJob.new(db_job)
# 		expect(bid_job.id).to eql(db_job.id)
# 		expect(bid_job.keyword_string).to eql(db_job.keyword_string)
# 		bid_job.status = 0
# 		expect(bid_job.status).to eql(db_job.status)
# 	end
# end