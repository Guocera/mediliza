class Patient < ActiveRecord::Base
  belongs_to :staff

  def interactions
    p "test"
  end
end