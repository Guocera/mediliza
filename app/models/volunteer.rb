# Volunteer record with their interactions with patients.
#
# @attribute first_name 
#   @return [String] first name of the volunteer
# @attribute last_name 
#   @return [String] last name of the volunteer
class Volunteer < ActiveRecord::Base
  # List of all intractions with the patient sorted by most recent
  #
  # @return [Array] lists all the interactions sorted by most recent
  has_many :interactions
end