require 'rake'
require "sinatra/activerecord/rake"
require 'factory_girl'
require 'faker'
require ::File.expand_path('../config/environment', __FILE__)
require_relative './spec/support/factory_girl.rb'


desc "Populates database"
task "db:populate" do
  FactoryGirl.create_list(:staff, 5)
  FactoryGirl.create_list(:patient, 50)
  FactoryGirl.create_list(:volunteer, 20)
  FactoryGirl.create_list(:interaction, 200)
  FactoryGirl.create_list(:preference, 125)
end