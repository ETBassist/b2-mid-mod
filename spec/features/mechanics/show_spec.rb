require 'rails_helper'

describe 'When I go to a mechanics show page' do
  describe 'I see details about' do
    before :each do
      park = Park.create(name: 'Great America', price: 25.0)
      @mechanic = park.mechanics.create(name: 'Kara Smith',
                                       years_experience: 11)
      @ride1 = park.rides.create!(name: 'Lightning Racer',
                                  thrill_rating: 10)
      @ride2 = park.rides.create!(name: 'Storm Runner',
                                  thrill_rating: 5)
    end

    it 'their name and experience' do
      visit "/mechanics/#{@mechanic.id}"

      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.years_experience)
    end
  end
end
