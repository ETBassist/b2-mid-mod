class Park < ApplicationRecord
  has_many :mechanics
  has_many :rides
end
