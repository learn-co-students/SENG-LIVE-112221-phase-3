class Veterinarian 
    attr_accessor :name
    attr_reader :certification

    @@all = []
    def initialize(name, id, certification)
        @name = name
        @certification = certification
        @id = id
        @@all << self
    end

    def self.all
        @@all
    end 

    def print_info
        puts @name
        puts @certification
        puts @id
    end 
end 
# bob = Veterinarian.new('bob', 1, 'xxxxxxxxx')
# bob.print_info