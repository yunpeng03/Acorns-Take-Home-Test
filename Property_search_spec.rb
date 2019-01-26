require 'rspec'
RSpec.describe 'Searching Properties on Redfin using 3 filters' do
  context 'When searching by city' do

    city_name = 'Oxnard'
    min_beds  = 2
    max_beds   = 2
    num_baths  = 2

    before(:all) do
      property_search_edit = UI::PropertySearch::Edit.new
      property_search_edit.fill_in_city(city_name)
      property_search_edit.click_search
      property_search_edit.set_filters
      property_search_edit.select_minbeds(min_beds)
      property_search_edit.select_maxbeds(max_beds)
      property_search_edit.select_baths(num_baths)
      property_search_edit.click_for_sale
      property_search_edit.click_apply_filters
    end

    it 'shows properties in the correct city' do
      expect(page).to have_css('h1', text: 'Oxnard Real Estate')
    end

    it 'shows properties that are sold' do
      expect(page).to have_css('span', text: 'sold'.upcase)
    end

    it 'returns properties with the correct number of bedrooms' do
      expect(page).to have_css('div.stats', text: '2 Beds')
    end

    it 'returns properties with the correct number of bathrooms' do
      expect(page).to have_css('div.stats', text: '2 Baths')
    end
  end
end