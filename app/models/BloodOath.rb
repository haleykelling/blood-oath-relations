class BloodOath
    attr_reader :cult, :follower, :initiation_date
    
    @@all = []

    def self.all
        @@all
    end

    def initialize  cult, follower, initiation_date = Date.today.iso8601
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date

        @@all << self
    end

end 


