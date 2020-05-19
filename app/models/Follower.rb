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
        blood_oaths.map(&:cult)
    end

    def join_cult cult
        BloodOath.new cult, self
    end

    def self.of_a_certain_age required_age
        @@all.select { |follower| follower.age > required_age }
    end

end
