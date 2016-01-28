class Patient < ActiveRecord::Base
  belongs_to :staff
end