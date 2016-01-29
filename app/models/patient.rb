# Patient record of their preferences along with their interactions with volunteers.
#
# @attribute first_name 
#   @return [String] first name of the patient
# @attribute last_name 
#   @return [String] last name of the patient
# @attribute staff_id
#   @return [Integer] id of the staff associated with the patient
# @attribute beverage_type
#   @return [String] describes the type of drink required
# @attribute mobility_type
#   @return [String] describes the mobility level
# @attribute language
#   @return [String] lists language spoken
class Patient < ActiveRecord::Base
  # Gives the staff member associated with the patient.
  #   
  # @return [Staff] gives the staff member associated with the patient
  belongs_to :staff

  # List of all prefences with the patient unsorted
  #
  # @return [Array] lists all the preferences unsorted
  has_many :preferences
  # List of all intractions with the patient unsorted
  #
  # @return [Array] lists all the interactions unsorted
  has_many :interactions
  
  # Lists the most recent interactions with the patient
  #
  # @param [FixNum] number of recent interactions (default: 3)
  # @return [Array] list of recent interaction
  def last_interaction(num = 3)
    interactions.order(time: :desc).limit(num)
  end

  default_scope { order(first_name: :asc, last_name: :asc) }

end