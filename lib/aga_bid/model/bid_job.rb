module AgaBid
  module Model
    class BidJob

      def db_bid_job
        @db_bid_job
      end

      def initialize(job)
        @db_bid_job = job
        @job_history = Array.new
      end
      
      [:id,:keyword_string,
        :exact_keyword_id,:exact_keyword_se_id,:exact_account_id,:exact_keyword_uuid,
        :phrase_keyword_id,:phrase_keyword_se_id,:phrase_account_id,
        :current_side,:current_position,:target_position,
        :current_price,:max_price,:min_price,:pre_price,
        :status,:update_time,:run_time,:save].each do |name|
        define_method(name) do 
          @db_bid_job.send(name)
        end
      end

      [:current_side=,:current_position=,:target_position=,:phrase_keyword_uuid,
        :current_price=,:max_price=,:min_price=,:pre_price=,
        :status=,:update_time=,:run_time=].each do |name|
        define_method(name) do |*args| 
          @db_bid_job.send(name,*args)
        end
      end

      def get_job_history
        @job_history
      end
      def add_job_history(history)
        @job_history << history
      end

      def goal?
        self.current_position > 0 && self.current_side == 1 && self.current_position <= self.target_position
      end

      def reduce_price
        self.pre_price = self.current_price
        if self.current_price > 5 
          self.current_price = [self.current_price - 1,self.min_price].max
        else
          self.current_price = [self.current_price - 0.5,self.min_price].max
        end
        self.status = 1
      end

      def increase_price
        self.pre_price = self.current_price
        if self.current_price > 5 
          self.current_price = [self.current_price + 1,self.max_price].min
        else
          self.current_price = [self.current_price + 0.5,self.max_price].min
        end
        self.status = 2
      end

      def reduce_price_to_max_price
        self.current_price = self.max_price
        self.status = 1
      end

      def increase_price_to_min_price
        self.current_price = self.min_price
        self.status = 2
      end

      def recover_price
        self.current_price = self.pre_price
        self.current_position = self.target_position
        self.current_side = 1
      end

      def next_step
        self.update_time = Time.now
        self.run_time = Time.now + (3 * 60)
        # self.save
      end

      def finished
        if self.status != 12
          self.status = 10
        end
        self.update_time = Time.now
        self.run_time = Time.now + (3 * 60)
        # self.save
      end

      def no_rank
        self.status = 11
        self.update_time = Time.now
        self.run_time = Time.now + (3 * 60)
        # self.save
      end

      def reduce_target
        if self.current_side == 1 && self.current_position <= 5
          self.target_position = self.current_position 
          self.current_price = self.get_job_history.select{|item| item.side == 1 && item.position == self.target_position}.map{|item| item.price}.push(self.current_price).min
          self.status = 1
        else
          self.status = 10
          self.current_price = self.min_price
        end
        self.update_time = Time.now
        self.run_time = Time.now + (3 * 60)
      end

      def be_covered_with_other_word
        self.status = 13
        self.update_time = Time.now
        self.run_time = Time.now + (3 * 60)
      end

    end
  end
end
