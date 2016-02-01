enable :sessions

helpers do
  def markdown(text)
    return "" unless text
    RDiscount.new(text).to_html.html_safe
  end
end

# Homepage (Root path)
get '/?' do
  session[:vid] ||= nil
  erb :index
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/volunteer_home_page/?' do
  session.clear
  @patients =  Patient.all
  @volunteer =  Volunteer.first
  session[:vid] = @volunteer.id
  session[:expires] = 1.week.from_now
  erb :volunteer_home_page
end

get '/volunteer_patient_page/:id' do
  @patient = Patient.find params[:id]
  @volunteers =  Volunteer.all
  erb :volunteer_patient_page
end

post '/volunteer_patient_page/?' do
   @volunteers =  Volunteer.all
   @patient = Patient.find params[:id]
   if params[:beverage]
     beverage = true
   else
    beverage = false 
   end
   @interaction = @patient.interactions.create(
    observation:   params[:observation],
    beverage:    beverage,
    volunteer: Volunteer.find(session[:vid]),
    time: Time.now
    )
   
  erb :volunteer_patient_page
end

get '/enduser/?'  do
  session.clear
  @patients = Patient.all
  @staff = Staff.first
  session[:sid] = @staff.id
  session[:expire] = 1.week.from_now
  erb :enduser1
end

get '/enduser2/:id' do 
  @chosen = Patient.find_by(id: params[:id])
  erb :enduser2
end

get '/search/?' do
  erb :search
end

get '/volunteer_patient_page/search/result' do
  @patient = Patient.find_by(family_code: params[:family_code])
  if @patient
    @volunteers = Volunteer.all
    erb :volunteer_patient_page
  else
    @patient = Patient.new(family_code: params[:family_code])
    @patient.errors.add(:family_code, 'was incorrect.')
    erb :search
  end 
end

