require "selenium/webdriver"



chrome_driver = Selenium::WebDriver.for :chrome

name = "christian"

chrome_driver.get('http://toolsqa.com/automation-practice-form/')

chrome_driver.find_element(:name, 'firstname')

chrome_driver.find_element(:name, 'firstname').displayed?

chrome_driver.find_element(:name, 'firstname').send_keys("Hello #{name}")

sleep 10
