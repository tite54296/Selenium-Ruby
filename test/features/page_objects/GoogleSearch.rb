class GoogleSearch

  SEARCH_BOX        = { id: 'lst-ib' }
  SEARCH_BOX_SUBMIT = { css: '[name="btnK"]' }
  TOP_SEARCH_RESULT = { css: '#rso .g'  }
  RESULTS_CONTAINER = { css: '.srg'}
  PAGE_TITLE = { css: 'head title'}

  attr_reader :driver

  def initialize(driver)
    @driver = driver
    visit
    verify_page
  end

  def visit
    driver.get ENV['base_url']
  end

  def search_for(search_term)
    driver.find_element(SEARCH_BOX).send_keys search_term
  end

  def search_result_present?(search_result)
    wait_for { displayed?(TOP_SEARCH_RESULT) }
    driver.find_element(TOP_SEARCH_RESULT).text.include? search_result
  end

  def get_title
    wait_for { displayed?(RESULTS_CONTAINER) }
    driver.find_element(PAGE_TITLE).text
  end

  private

    def verify_page
      driver.title.include?('Google').should == true
    end

    def wait_for(seconds=5)
      Selenium::WebDriver::Wait.new(:timeout => seconds).until { yield }
    end

    def displayed?(locator)
      driver.find_element(locator).displayed?
      true
      rescue Selenium::WebDriver::Error::NoSuchElementError
        false
    end

end