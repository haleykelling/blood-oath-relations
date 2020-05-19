class Cult 
    attr_reader :name, :location, :founding_year, :slogan
   
    @@all = []

    def initialize name, location, founding_year, slogan
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan

        @@all << self
    end

    def self.all
        @@all
    end

    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
    end

    def followers
        blood_oaths.map(&:follower)
    end
    
    def recruit_follower follower 
        BloodOath.new self, follower
    end
    
    def cult_population
        followers.length
    end
    
    def self.find_by_name name
        @@all.find { |cult| cult.name == name }
    end

    def self.find_by_location location
        @@all.select { |cult| cult.location == location }
    end

    def self.find_by_founding_year founding_year
        @@all.select { |cult| cult.founding_year == founding_year }
    end


end
