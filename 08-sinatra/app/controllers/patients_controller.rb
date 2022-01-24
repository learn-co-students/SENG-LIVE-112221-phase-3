class PatientsController < ApplicationController
    get '/patients' do
        Patient.all.to_json({include: :clinic})
    end 

    get '/patients/:id' do
        Patient.find(params[:id]).to_json
    end 
    
    post '/patients' do
    end 


    
    
end 