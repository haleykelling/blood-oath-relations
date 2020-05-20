class Cult 
    attr_reader :name, :location, :founding_year, :slogan
    attr_accessor :minimum_age
   
    @@all = []

    def initialize name, location, founding_year, slogan, minimum_age = 0
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimum_age = minimum_age

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
        if follower.age >= minimum_age
            BloodOath.new self, follower
        else
            puts "I'm sorry, you are too young to join this cult."
        end
    end
    
    def cult_population
        followers.length
    end

    def average_age
        (followers.sum(&:age).to_f / cult_population).round(2)
    end

    def my_followers_mottos
        followers.map(&:life_motto)
    end
    
    def self.find_by_name name
        all.find { |cult| cult.name == name }
    end

    def self.find_by_location location
        all.select { |cult| cult.location == location }
    end

    def self.find_by_founding_year founding_year
        all.select { |cult| cult.founding_year == founding_year }
    end

    def self.least_popular
        all.min_by(&:cult_population)
    end

    def self.number_of_cults_per_location
        locations = all.map(&:location)
        locations.reduce([]) do |counted_locations, location|
            location_exists = counted_locations.find do |hash|
                hash[:location] == location
            end
            if location_exists
                location_exists[:count] += 1
            else 
                new_location = {
                    location: location,
                    count: 1
                } 
                counted_locations << new_location
            end
            counted_locations
        end
    end

    def self.most_common_location
        most_common_location = number_of_cults_per_location.max_by(&:location)
        most_common_location[:location]
    end


end
