require 'rails_helper'

describe 'When I go to a mechanics show page' do
  describe 'I see details about' do
    before :each do
      park = Park.create(name: 'Great America', price: 25.0)
      @mechanic = park.mechanics.create(name: 'Kara Smith',
                                       years_experience: 11)
      @ride1 = park.rides.create!(name: 'Storm Runner',
                                  thrill_rating: 10)
      @ride2 = park.rides.create!(name: 'Lightning Racer',
                                  thrill_rating: 5)
    end

    it 'their name and experience' do
      visit "/mechanics/#{@mechanic.id}"

      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.years_experience)
    end

    it 'a form to add rides to that mechanics work load' do
      visit "/mechanics/#{@mechanic.id}"

      fill_in(:ride_id, with: @ride1.id)
      click_button("Submit")
      expect(current_path).to eq("/mechanics/#{@mechanic.id}")

      expect(page).to have_content(@ride1.name)

      fill_in(:ride_id, with: @ride2.id)
      click_button("Submit")

      expect(page).to have_content(@ride2.name)
      within("#mechanic-rides") do
        expect(page.all("li")[0]).to have_content(@ride2.name)
        expect(page.all("li")[1]).to have_content(@ride1.name)
      end
    end
  end
end
