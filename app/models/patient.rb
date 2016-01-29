class Patient < ActiveRecord::Base
  belongs_to :staff
  has_many :preferences, :interactions
end