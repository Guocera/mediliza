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
  erb :volunteer_home_page
end


get '/volunteer_patient_page' do
  erb :volunteer_patient_page
end


get '/enduser'  do
  @patients = Patient.all
  erb :enduser1
end

post '/enduser2/' do
  
  erb :enduser2
end

get '/volunteer_patient_page/search/?' do
  erb :search
end

post '/volunteer_patient_page/search' do
@patients = Patient.find_by(family_code: params[:family_code])
pp @patients
  if @patients
    @volunteers = Volunteer.all
    erb :volunteer_patient_page
  else
    @patients = Patient.new(family_code: params[:family_code])
    @patients.errors.add(:family_code, 'was incorrect.')
    erb :search
  end 
end