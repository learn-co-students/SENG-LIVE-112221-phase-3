class Patient
    attr_accessor :name, :age, :owner, :number
    attr_reader :species
    @@all = []
    def initialize(name, species, age, owner,number)
        @species = species
        @name = name
        @age = age
        @owner = owner
        @number = number
        @@all << self
    end 
#Lets us call Patient.all, a class method
    def self.all
        @@all
    end 
    
#Lets us call instance.print_info a instance method
    def print_info
        puts "Name: #{@name}"
        puts "Species: #{@species}"
        puts "Age: #{@age}"
        puts "Owner: #{@owner}"
        puts "Phone number: #{@number}"
        puts "--------------------------------"
    end 

    def self.all_species
        @@all.map{|p| p.species}.uniq
    end

    def self.find_patient(name, owner)
        @@all.find{|p| p.name == name && p.owner == owner}
    end 

    def update_phone(new_number)
        self.number = new_number
    end 
    
    def delete 
        binding.pry
        @@all = @@all.filter{|p| p != self}
        puts "#{self.name} was removed form the system"
    end 
    


end 


class Cat < Patient

end 