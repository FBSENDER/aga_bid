require 'spec_helper'

describe AgaBid::BidJobExecute do 

  describe '#baidu_get_rank' do 
    rank = AgaBid::GetRank.baidu_get_rank("北京酒店预订",1)
    p rank
  end


end
