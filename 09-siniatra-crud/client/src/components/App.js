import {useState, useEffect} from 'react'
import Card from './Card'
import CreateForm from './CreateForm'
import '../App.css';

function App() {
  const [patients, setPatients] = useState([])
  const [clinics, setClinics] = useState([])

  useEffect(()=> {
  //Gets patients and clinics
    //TODO write a fetch to 'patients'
    .then(setPatients)
    
    //TODO write a fetch to 'clinics'
    .then(setClinics)
  },[])

  //Creates a Patient 
  const postPatient = (patient) => {
    fetch(
      //TODO: Write a post

    )
    .then(res => res.json())
    .then(newPatient => {
      setPatients([newPatient,...patients])
    })
  }
//patches patient
  const patchPet = (patient) => {
    fetch(
      //TODO: Write a patch
    )
    .then(res => res.json())
    .then(data => {
      console.log(data)
      setPatients(patients.map(p => {
        if(patient.id === data.id){
          return data
        } else {
          return p
        }
      }))
    })
  } 
//Deletes patient
  const handleDelete = (id) => {
    fetch(
      //TODO:Write a delete
    )
    .then(res => res.json())
    .then(data => {
      setPatients(patients.filter(p => p.id !== id))
    })
  }
  return (
    <div className="App">

      <div>
      <CreateForm postPatient={postPatient} clinics={clinics}/>
      {patients.map(p => <Card patient={p} patchPet={patchPet} handleDelete={handleDelete} key={`${p.id}${p.name}`}/>)}
      </div> 
    </div> 
  );
}

export default App;
