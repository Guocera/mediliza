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
  @volunteer =  Volunteer.first
  erb :volunteer_home_page
end

get '/volunteer_patient_page/:id' do
  @patients = Patient.find params[:id]
  @volunteers =  Volunteer.all
  erb :volunteer_patient_page
end

post '/volunteer_patient_page' do
   @volunteers =  Volunteer.all
   @patients = Patient.find params[:id]
   if params[:beverage]
     beverage = true
   else
    beverage = false 
   end
   @interaction = Interaction.create(
    observation:   params[:observation],
    beverage:    beverage
    )
   
  erb :volunteer_patient_page
end

get '/enduser'  do
  @patients = Patient.all
  erb :enduser1
end

get '/enduser2/:id' do 
  @chosen = Patient.find_by(id: params[:id])
  erb :enduser2
end

get '/volunteer_patient_page/search/?' do
  erb :search
end

get '/volunteer_patient_page/search/result' do
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

