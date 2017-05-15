require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://mock.agiletrailblazers.com/"
driver.quit