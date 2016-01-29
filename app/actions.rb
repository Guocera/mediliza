# Homepage (Root path)
get '/' do
  erb :index
end


get '/volunteer_home_page' do
  erb :volunteer_home_page
end


get '/volunteer_patient_page' do
  erb :volunteer_patient_page
end