# Staff record and their patients.
#
# @attribute first_name 
#   @return [String] first name of the volunteer
# @attribute last_name 
#   @return [String] last name of the volunteer
class Staff < ActiveRecord::Base
  # List of all their patients unsorted
  # List of all their patients alphabetically
  #
  # @return [Array] list of all their patients alphabetically
  has_many :patients
end