module UI
  module PropertySearch
    class Edit
      include Capybara::DSL

      def initialize
        visit('https://www.redfin.com')
      end

      def fill_in_city(city_name)
        log("fill_in_city: #{city_name}")
        fill_in 'search-box-input', with: city_name
      end

      def click_search
        log('ClickSearchButton')
        find_button('[data-rf-test-name=#searchButton]').click
      end

      def set_filters
        log('ClickFilters')
        find('span', text: 'Filters').click
      end

      def select_minbeds(minbeds)
        log("SelectStatus: #{minbeds}")
        select minbeds, from: 'minBeds'
      end

      def select_maxbeds(maxbeds)
        log("SelectStatus: #{maxbeds}")
        select maxbeds, from: 'maxBeds'
      end

      def select_baths(numbaths)
        log("SelectStatus: #{numbaths}")
        select numbaths, from: 'baths'
      end

      def click_for_sale
        log ("Click For Sale Toggle")
        find('//div[@class="handle on"]').click
      end

      def click_apply_filters
        log('Click Apply Filters')
        find('span', text: 'Apply Filters').click
      end

    end
  end
end