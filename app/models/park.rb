class Park < ApplicationRecord
  has_many :rides

  def average_thrill
    rides.average(:thrill_rating)
  end
end
