class Staff < ActiveRecord::Base
  has_many :patients
end