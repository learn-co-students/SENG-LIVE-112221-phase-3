class Patient
    attr_accessor :name, :age, :owner, :phone
    attr_reader :species
    # attr_writer :name
    @@all = []
    def initialize(species, name, age, owner, phone)
         @name = name
         @species = species
         @age = age
         @owner = owner
         @phone = phone
         @@all << self
    end 

    def self.all
        @@all
    end 

    # def name
    #     @name
    # end 

    # def name=(new_name)
    #     @name = new_name 
    # end 
end 
