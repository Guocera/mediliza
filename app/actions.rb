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


get '/enduser'  do
  @patients = Patient.all
  erb :enduser1
end

get '/enduser2' do 
  @chosen = Patient.id(params[:p])
  erb :enduser2
end
