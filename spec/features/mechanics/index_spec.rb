require 'rails_helper'

describe 'When I visit a mechanics index page' do
  describe 'I see a header saying All Mechanics' do
    it 'and I see a list of all mechanics and their years experience' do
      mechanic1 = Mechanic.create!(name: 'Jim Jones',
                            years_experience: 10)
      mechanic2 = Mechanic.create!(name: 'George Gin',
                            years_experience: 5)
      mechanic3 = Mechanic.create!(name: 'Petra Perogi',
                            years_experience: 1)

      visit '/mechanics'

      expect(page).to have_content('All Mechanics')
      expect(page).to have_content(mechanic1.name)
      expect(page).to have_content(mechanic1.years_experience)
      expect(page).to have_content(mechanic2.name)
      expect(page).to have_content(mechanic2.years_experience)
      expect(page).to have_content(mechanic3.name)
      expect(page).to have_content(mechanic3.years_experience)
    end
  end
end
