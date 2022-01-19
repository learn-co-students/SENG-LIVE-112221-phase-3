c1 = Clinic.create(clinic_name:'PuppersRus', address:'55555 6th Seattle Wa 9000', phone:'(999)123-4444')
c2 = Clinic.create(clinic_name:'Paw and Order', address:'55555 6th New York NY 9000', phone:'(999)123-4444')

p1 = Patient.create(species:'cat', name:'rose', age:10, owner:'ix', phone:'(999)999-9999', active:true, clinic_id:c1.id)
p2 = Patient.create(species:'cat', name:'bob', age:9, owner:'tom', phone:'999999999', active:true, clinic_id:c1.id)
p3 = Patient.create(species:'dog', name:'dan', age:2, owner:'max', phone:'999999999', active:true, clinic_id:c1.id)
p4 = Patient.create(species:'bird', name:'picard', age:2, owner:'oz', phone:'999999999', active:true, clinic_id:c2.id)
p5 = Patient.create(species:'rabit', name:'ted', age:1, owner:'zac', phone:'999999999', active:true, clinic_id:c2.id)
puts 'done'

v1 = Vet.create(vet_name: 'Anderson', specialty: 'cats and dogs')

Appointment.create(patient_id: p1.id, vet_id: v1.id)