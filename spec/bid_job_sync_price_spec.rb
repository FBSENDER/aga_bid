require 'spec_helper'

describe AgaBid::BidJobSyncPrice do 
	# describe '#baidu_jiudian_sync_price' do 
	# 	AgaBid::BidJobSyncPrice.new.baidu_jiudian_sync_price
	# end
	describe '#qihu_sync_price' do 
		AgaBid::BidJobSyncPrice.new.sync_price
	end
end