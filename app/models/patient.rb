# Patient record of their preferences along with their interactions with volunteers.
#
# @attribute first_name 
#   @return [String] first name of the patient
# @attribute last_name 
#   @return [String] last name of the patient
# @attribute nick_name 
#   @return [String] preferred name of the patient
# @attribute staff_id
#   @return [Integer] id of the staff associated with the patient
# @attribute beverage_type
#   @return [String] describes the type of drink required
# @attribute mobility_type
#   @return [String] describes the mobility level
# @attribute language
#   @return [String] lists language spoken
# @attribute request
#   @return [String] newest request from family member
class Patient < ActiveRecord::Base
  default_scope { order(first_name: :asc, last_name: :asc) }
  after_create :assign_family_code

  # Gives the staff member associated with the patient.
  #   
  # @return [Staff] gives the staff member associated with the patient
  belongs_to :staff

  # List of all prefences with the patient unsorted
  #
  # @return [Array] lists all the preferences unsorted
  has_many :preferences
  # List of all intractions with the patient sorted by most recent
  #
  # @return [Array] lists all the interactions sorted by most recent
  has_many :interactions
  
  # Lists the most recent interactions with the patient
  #
  # @param [FixNum] number of recent interactions (default: 3)
  # @return [Array] list of recent interaction
  def last_interactions(num = 3)
    interactions.order(time: :desc).limit(num)
  end

  # Gives the patient a unique code for the family to know the status of a patient
  #
  # @return [Integer] 10 digit unique code to find family
  def assign_family_code
    unique = false
    until unique
      code = rand(8999999999).floor + 1000000000
      unless Patient.find_by(family_code: code)
        unique = true
        update(family_code: code)
      end
    end
  end

  # Gives back a list of all patient's likes
  #
  # @return [Array] list of all patient's likes
  def likes
    preferences.where(likes: true)
  end

  # Gives back a list of all patient's dislikes
  #
  # @return [Array] list of all patient's dislikes
  def dislikes
    preferences.where(likes: false)
  end

end