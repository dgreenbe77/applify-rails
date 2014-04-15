
require 'capybara'
session = Capybara::Session.new(:selenium)

session.visit "https://login.monster.com"
session.fill_in "EmailAddress", with: "testingemailjob@gmail.com"
session.fill_in "Password", with: "password1"
session.click_button "Sign In"
session.click_on "CREATE RESUME"
