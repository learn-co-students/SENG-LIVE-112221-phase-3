class Vet < ActiveRecord::Base
   has_many :appointments
   has_many :patients, through: :appointments

   def find_old_patients
        binding.pry
        self.patients.where("age > 9")
   end 

   def oldest_pet_age
        self.patients.maximum(:age)
   end 

   def all_patient_names
    #Marci
	self.patients.pluck(:name)
   end

   def sort_pets_alphabetical
    #Lance, Mahdy
    self.patients.sort_by{|p| p.name}
   end 

   def self.vet_specialty
    #Johnny
    self.all.pluck(:specialty)
   end 

   def self.all_vet_names
        self.all.pluck(:vet_name)
   end 

   

end 