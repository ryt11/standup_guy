require "selenium-webdriver"
require 'pry'
require_relative 'r'
require_relative 'p'


WAIT_TIME = 5
Selenium::WebDriver::Chrome.driver_path = "/Users/rthompson/Desktop/chromedriver"
browser = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => WAIT_TIME)
#Loading the assertselenium URL
#visit url then add cookies
browser.navigate.to "https://na29.salesforce.com/00O80000005LAWY"

SF_COOKIES.each {|k, v| browser.manage.add_cookie(name: k, value: v)}
login_email = wait.until {
    element = browser.find_element(:xpath, '//*[@id="username"]')
    element if element.displayed?
}


login_email.send_keys('rthompson@invoca.com')

login_password = wait.until {
    element = browser.find_element(:xpath, '//*[@id="password"]')
    element if element.displayed?
}

login_password.send_keys(PWD[:thing])

submit = wait.until {
    element = browser.find_element(xpath: '//*[@id="Login"]')
    element if element.displayed?
}

submit.click



browser.execute_script( "window.open()" )
browser.switch_to.window( browser.window_handles.last )
browser.navigate.to "https://hangouts.google.com/"
browser.switch_to.window( browser.window_handles.first )
binding.pry
''
