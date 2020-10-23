require 'rails_helper'

describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :mechanics }
    it { should have_many :rides }
  end

  describe 'class methods' do
    it 'can get the average thrill rating of rides' do
      park = Park.create!(name: 'Cedar Rapids', price: 25.0)
      park.rides.create!(name: 'Lightning Racer', thrill_rating: 10)
      park.rides.create!(name: 'Storm Runner', thrill_rating: 5)
      
      expect(park.average_thrill).to eq(7.5)
    end
  end
end
