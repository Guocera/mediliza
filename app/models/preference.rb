# Preference record of all the patients
#
# @attribute patient_id
#   @return [Integer] id of the patient being interacted with
# @attribute description
#   @return [String] information about the preference
# @attribute likes
#   @return [Boolean] true for likes and false for dislikes
class Preference < ActiveRecord::Base
  # Gives back the patient involved in the interaction
  #
  # @return [Patient] gives the patient involved in the interaction
  belongs_to :patient
end