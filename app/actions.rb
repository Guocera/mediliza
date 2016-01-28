# Homepage (Root path)
get '/' do
  erb :index
end

get '/enduser'  do
  @patients = Volunteer.all
  erb :enduser1
end

post '/enduser/patient' do
  
  erb :enduser2
end