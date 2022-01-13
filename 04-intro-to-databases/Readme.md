# Intro To Databases
## SWBAT
- [ ] Understand the benefits 
- [ ] Understand the Relationship between a database and API
- [ ] Implement a domain model
- [ ] Implement Mapping columns and rows to classes and instances 
- [ ] Implement Basic SQL queries
- [ ] Implement Primary keys
- [ ] Understand Foreign keys 

## The Project 
The Veterinary clinic that hired us has grown and has a bigger and has the budget to put towards their patent data management. Happy with the CLI we built for them, they will like us to create a database and API with GUI that's easy for their vets and vet techs to use. 
- React Front end (week 3)
- Database (SQL)
- ORM (ruby/active record/sinatra(week-3))
>Note: Database vs API
- Database holds data
- API is the interface that is the communicates between the server and client

## SQL (Structured Query Language)
- A language used to communicate with Databases 
- It allows us to create tables, insert data, update data, delete data, create simple and complex queries for data. 

![patient_diagram](./assets/patient_diagram2.png)

- Relationships through foreign key can help us avoid duplicate date.
- If one of our clinics needed to update data in the table bellow, we would have to find every row that contains the clinic and update the data in that row. How can we re-organize our data, so we'd only have to update our clinic data once?

![1:1](./assets/first_normal_form.png)
 <details>
      <summary>
        solution 
      </summary>
      <hr/>
        <img src="./assets/second_normal.png"
        alt="patient diagram"
        style="margin-right: 10px;" />
      <hr/>
     </details>
<br/>


```

CREATE TABLE clinics (
  id INTEGER PRIMARY KEY,
  name TEXT,
  address TEXT,
  phone INTEGER
);



CREATE TABLE patients(
    id INTEGER PRIMARY KEY,
    clinic_id INTEGER,
    species TEXT,
    name TEXT,
    age INTEGER,
    owner TEXT,
    number TEXT,
    FOREIGN KEY (clinic_id) REFERENCES clinics(id)
);




/* Add data */
INSERT INTO clinics (name, address, phone) VALUES ('Happy pets', '999 city zip state', 8888888888 );

INSERT INTO clinics (name, address, phone) VALUES ('Seattle pets clinic','999 city zip state',8888888888 );

INSERT INTO patients (clinic_id, species, name, age, owner, number) VALUES (1, 'cat', 'rose', 10, 'ix', 9999999999);
INSERT INTO patients (clinic_id, species, name, age, owner, number) VALUES (2, 'dog', 'bubbles', 2, 'Tom', 9999999999);
INSERT INTO patients (clinic_id, species, name, age, owner, number) VALUES (1, 'bird', 'picard', 2, 'jennie', 9999999999);

/* Query data */

SELECT * FROM patients;


SELECT * FROM patients
WHERE name='rose';

SELECT * FROM patients 
WHERE age<3;

/* Update data */

UPDATE patients
SET  age = 11
WHERE id = 1;

/* Delete data */

DELETE FROM patients
WHERE name='bubbles';


/* relational query */

SELECT patients.name, clinics.name AS clinic_name
FROM patients
INNER JOIN clinics ON patients.clinic_id = clinics.id;
```

## ORM (Object Relational Mapping)
- Uses object oriented programming with database
- Combines SQL and Ruby
- Maps classes and instances to tables
- ORM's solve repetition and organization problems
> Note: CAUTION: Do no mix the two up. While we mimick our Ruby objects as records in the database, they are not the same thing. Ruby object != database record

```
# Mass Assignment 
    def initialize(attributes) 
        attributes.each do |key, value| 
            if self.respond_to?("#{key.to_s}=") 
                self.send("#{key.to_s}=", value) 
            end 
        end
    end

# Create database 
    def self.create_table 
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS patients (
            id INTEGER,
            clinic_id INTEGER,
            species VARCHAR(30),
            name VARCHAR(50),
            age INTEGER,
            owner VARCHAR(50),
            number VARCHAR(15),
            PRIMARY KEY(id)
        );
        SQL
        DB.execute(sql)
    end 

# Add data

    def save
         sql = <<-SQL
         INSERT INTO patient (species, name, age, owner, number) VALUES (?,?,?,?,?);        
         SQL

        DB.execute(sql, self.species, self.name, self.age, self.owner, self.number)
        @id = DB.last_insert_row_id
        self 
    end

# Query data

    def self.all 
        resources = DB.execute("SELECT * FROM patients")
        resources.map do |hash|
          self.new(hash)
        end
    end


```
