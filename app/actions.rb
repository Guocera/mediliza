# Homepage (Root path)
get '/' do
  erb :index
end

get '/enduser'  do
  erb :enduser1
end

post '/enduser/patient' do
  erb :enduser2
end