configure do
  # Log queries to STDOUT in development
  if Sinatra::Application.development?
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end



  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    host: "ec2-54-225-197-143.compute-1.amazonaws.com",
    database: "d55mvpk1jcmgfl",
    user: "syixxfnlmtnqjr",
    password: "P8S_eujkGCve2Ro1KfisURtoiM",
    post: "5432"
  )

  # # Load all models from app/models, using autoload instead of require
  # # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  # Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  #   filename = File.basename(model_file).gsub('.rb', '')
  #   autoload ActiveSupport::Inflector.camelize(filename), model_file
  # end

  require_relative '../app/models/volunteer.rb'

end
