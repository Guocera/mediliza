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

get '/enduser'  do
  @patients = Volunteer.all
  erb :enduser1
end

post '/enduser/patient' do
  
  erb :enduser2
end

# Nick's Test Suite
get '/model_features/patient' do
  erb :'model_features/patient'
end