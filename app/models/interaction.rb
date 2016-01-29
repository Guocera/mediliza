class Interaction < ActiveRecord::Base
  belongs_to :volunteer, :patient
end