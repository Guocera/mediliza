require 'rake'
require "sinatra/activerecord/rake"
require ::File.expand_path('../config/environment', __FILE__)

desc "Populates database"
task 'db:populate' do
  @patient = Patient.find_or_create_by(first_name: "Nick", last_name: "Yoooo", beverage_type: "Water")
  @patient.interactions.create(observation: "We talked about WWII.")
  @patient.interactions.create(observation: "We talked about farming.")
  @patient.interactions.create(observation: "Camel")
  @patient.interactions.create(observation: "Liked fish")
  @patient.interactions.create(observation: "Played scrabble")
  @patient.interactions.create(observation: "Sang songs")
  @patient.interactions.create(observation: "Talked about kids")
  @patient.interactions.create(observation: "Looks for husband")
  @patient.interactions.create(observation: "didn't say much; was sad :(")
end