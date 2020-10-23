class Park < ApplicationRecord
  has_many :mechanics
  has_many :rides

  def average_thrill
    rides.average(:thrill_rating)
  end
end
