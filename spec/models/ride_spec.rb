require 'rails_helper'

describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to :park }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'class methods' do
    it 'can sort rides by name' do
      park = Park.create(name: 'Great America', price: 25.0)
      park.mechanics.create(name: 'Kara Smith',
                                       years_experience: 11)
      ride1 = park.rides.create!(name: 'Storm Runner',
                                  thrill_rating: 5)
      ride2 = park.rides.create!(name: 'Lightning Racer',
                                  thrill_rating: 10)

      expected = [ride2, ride1]
      
      expect(Ride.by_name).to eq(expected)
    end
  end
end
