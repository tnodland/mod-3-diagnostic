require 'rails_helper'

RSpec.describe "as a user" do
  context "when I visit the hompage and search for a food" do
    it "should see 10 foods and the total number found" do
      # When I visit "/"
      visit '/'
      # And I fill in the search form with "sweet potatoes"
      fill_in :q, with: "sweet potatoes"
      # (Note: Use the existing search form)
      # And I click "Search"
      click_on "Search"
      # Then I should be on page "/foods"
      expect(current_path).to eq(foods_path)
      # Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
      expect(page).to have_content("531 Results founds")
      # Then I should see a list of ten foods sorted by relevance.
      expect(page.all('.food').count).to eq(10)
      #
      # And for each of the foods I should see:
      within(page.all('.food')[0]) do
        expect(page).to have_content('NDB Number:')
        expect(page).to have_content('Food:')
        expect(page).to have_content('Food Group:')
        expect(page).to have_content('Data source:')
        expect(page).to have_content('Manufacturer:')
      end
      # - The food's NDB Number
      # - The food's name
      # - The food group to which the food belongs
      # - The food's data source
      # - The food's manufacturer
    end
  end
end
