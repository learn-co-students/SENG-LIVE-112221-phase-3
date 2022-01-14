class PatientORM
    attr_accessor :name, :age, :owner, :number, :id
    attr_reader :species

    def initialize(attributes) 
        attributes.each do |key, value| 
            if self.respond_to?("#{key.to_s}=") 
                self.send("#{key.to_s}=", value) 
            end 
        end

    end

    def save
        binding.pry
        sql = <<-SQL
        INSERT INTO patients (species, name, age, owner, number) VALUES (?,?,?,?,?);        
        SQL
        #DB is defined in our environment.rb, it's the connection to our database
        DB.execute(sql, self.species, self.name, self.age, self.owner, self.number)
        @id = DB.last_insert_row_id
        self 
    end

    def self.create(args)
        patient = PatientORM.new(args)
        binding.pry
        patient.save
        patient
      end


    def self.all 
        resources = DB.execute("SELECT * FROM patients")
         mapped_resources = resources.map do |p|
           puts p
          self.new(p)
        end
        puts mapped_resources
        mapped_resources
    end

    def self.create_table 
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS patients (
            id INTEGER PRIMARY KEY,
            clinic_id INTEGER,
            species TEXT,
            name TEXT,
            age INTEGER,
            owner TEXT,
            number TEXT
        );
        SQL
        DB.execute(sql)
    end 


end 