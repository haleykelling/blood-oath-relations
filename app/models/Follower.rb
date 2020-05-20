class Follower
    attr_reader :name, :age, :life_motto

    @@all = []
 
    
    def initialize name, age, life_motto
        @name = name
        @age = age
        @life_motto = life_motto
        
        @@all << self
    end
    
    def self.all
        @@all
    end

    def blood_oaths
        BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
    end

    def cults
        blood_oaths.map(&:cult).uniq
    end

    def join_cult cult
        if self.age >= cult.minimum_age
            BloodOath.new cult, self
        else
            puts "I'm sorry, you are too young to join this cult."
        end
    end

    def my_cults_slogans
        cults.map(&:slogan)
    end

    def fellow_cult_members
        list_of_blood_oaths = cults.reduce([]) do |all_members, cult|
            blood_oaths_of_same_cults = BloodOath.all.select do |blood_oath|
                blood_oath.cult == cult
            end
            all_members.concat blood_oaths_of_same_cults
        end
        list_of_blood_oaths.map(&:follower).uniq
    end

    def self.of_a_certain_age required_age
        @@all.select { |follower| follower.age > required_age }
    end

    def self.number_of_cults_followed
        all.reduce([]) do |followers_with_cults, follower|
            new_hash = {
                follower: follower,
                number_of_cults: follower.cults.count
            }
            followers_with_cults << new_hash
        end
    end
    
    def self.most_active
        most_active = number_of_cults_followed.max_by do |follower|
            follower[:number_of_cults]
        end
        most_active[:follower]
    end

    def self.top_ten
        sorted_by_cult_count = number_of_cults_followed.sort_by do |follower|
            follower[:number_of_cults]
        end
        sorted_by_cult_count.slice(-10, 10).reverse
    end

end
