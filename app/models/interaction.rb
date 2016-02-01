# Interactions between volunteer and patients.  Records information about the activities done.
#
# @attribute volunteer_id
#   @return [Integer] id of the volunteer interacting
# @attribute patient_id
#   @return [Integer] id of the patient being interacted with
# @attribute observation
#   @return [String] volunteer observations of the patient
# @attribute walking_duration
#   @return [Integer] the duration of walking in minutes
# @attribute beverage
#   @return [Boolean] true if beverage was drunk
# @attribute time
#   @return [DateTime] time of the interaction
class Interaction < ActiveRecord::Base
  default_scope { order(time: :desc) }

  # Gives back volunteer involved in the interaction
  #
  # @return [Volunteer] gives the volunteer involved in the interaction
  belongs_to :volunteer

  # Gives back the patient involved in the interaction
  #
  # @return [Patient] gives the patient involved in the interaction
  belongs_to :patient
end