require 'rails_helper'

describe 'When I visit a parks show page' do
  describe 'I see details about' do
    before :each do
      @park = Park.create!(name: 'Cedar Rapids', price: 25.0)
      @ride1 = @park.rides.create!(name: 'Lightning Racer', thrill_rating: 10)
      @ride2 = @park.rides.create!(name: 'Storm Runner', thrill_rating: 5)
    end

    it 'the name and price of admissions for that amusement park' do
      visit "/parks/#{@park.id}"

      expect(page).to have_content(@park.name)
      expect(page).to have_content(@park.price)
    end

    it 'the name of all rides and the average thrill rating' do
      visit "/parks/#{@park.id}"

      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
      expect(page).to have_content((@ride1.thrill_rating + @ride2.thrill_rating) / 2)
    end
  end
end
