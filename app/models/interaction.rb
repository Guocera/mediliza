class Interaction < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :patient
end