class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.integer :vet_id 
      t.integer :patient_id
    end
  end
end
