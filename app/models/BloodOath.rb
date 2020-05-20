class BloodOath
    attr_reader :cult, :follower, :initiation_date
    
    @@all = []
    
    def initialize  cult, follower, initiation_date = Date.today.iso8601
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date
        
        @@all << self
    end
    
    def self.all
        @@all
    end

    def self.first_oath
        all.sort_by(&:initiation_date).first
    end

end 


