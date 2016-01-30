helpers do
  def markdown(text)
    return "" unless text
    RDiscount.new(text).to_html.html_safe
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/volunteer_home_page' do
  @patients =  Patient.all
  @volunteers =  Volunteer.all
  erb :volunteer_home_page
end


get '/volunteer_patient_page/:id' do
  @patients = Patient.find params[:id]
  @volunteers =  Volunteer.all
  erb :volunteer_patient_page
end


get '/enduser'  do
  @patients = Patient.all
  erb :enduser1
end

post '/enduser/patient' do
  
  erb :enduser2
end

# Nick's Test Suite
get '/model_features/?' do
  erb :'model_features/index'
end

get '/model_features/family' do
  erb :'model_features/family'
end

get '/model_features/interaction' do
  erb :'model_features/interaction'
end

get '/model_features/patient' do
  erb :'model_features/patient'
end

get '/model_features/position' do
  erb :'model_features/position'
end

get '/model_features/preference' do
  erb :'model_features/preference'
end

get '/model_features/staff' do
  erb :'model_features/staff'
end

get '/model_features/user' do
  erb :'model_features/user'
end

get '/model_features/volunteer' do
  erb :'model_features/volunteer'
end