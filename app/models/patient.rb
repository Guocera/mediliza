class Patient < ActiveRecord::Base
  belongs_to :staff
  has_many :preferences
  has_many :interactions
  
  # Lists the most recent interactions with the patient
  #
  # @param [FixNum] number of recent interactions (default: 3)
  # @return [Array] list of recent interaction
  def last_interaction(num = 3)
    interactions.order(time: :desc).limit(num)
  end

end