class Ride < ApplicationRecord
  belongs_to :park
  has_many :mechanic_rides
  has_many :mechanics, through: :mechanic_rides

  def self.by_name
    order(:name)
  end
end
