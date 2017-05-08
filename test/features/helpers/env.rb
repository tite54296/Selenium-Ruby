require 'selenium/webdriver'

#url = "http://#{ENV['TB_KEY']}:#{ENV['TB_SECRET']}@hub.testingbot.com/wd/hub"

browser = Selenium::WebDriver.for :firefox, marionette:true
ENV['base_url'] = 'http://www.google.com'

Before do |scenario|

	@browser = browser
end

at_exit do
	browser.quit
end