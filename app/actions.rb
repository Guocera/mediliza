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

get '/team/?' do
  erb :team
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
   @interaction = @patient.interactions.new(
    observation:   params[:observation],
    beverage:    beverage,
    volunteer: Volunteer.find(session[:vid]),
    walking_duration: params[:walking_duration],
    time: Time.now
    )
  walking_duration = params[:walking_duration]
  if walking_duration.match(/^[0-9]*$/) != nil
    @interaction.save
    @interacted = true
    erb :volunteer_patient_page
  else
    @interaction.errors.add(:walking_duration, "must be an integer.")
    erb :volunteer_patient_page
  end
end

put '/volunteer_patient_page/?' do
  @volunteers = Volunteer.all
  @patient = Patient.find params[:id]
  @patient.update(request: params[:request])
  @update = true
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
  @patient = Patient.find params[:id]
  @volunteers =  Volunteer.all
  erb :volunteer_patient_page
end

get '/search/?' do
  erb :search
end

get '/search/results' do
  @patient = Patient.find_by(family_code: params[:family_code], last_name: params[:last_name])
  if @patient
    @volunteers = Volunteer.all
    session[:fid] = params[:family_code]
    erb :volunteer_patient_page
  else
    @patient = Patient.new(family_code: params[:family_code], last_name: params[:last_name])
    @patient.errors.add(:family_code, 'or last name was incorrect.')
    erb :search
  end 
end

