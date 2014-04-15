require 'capybara'
session = Capybara::Session.new(:selenium)
session.visit 'http://www.dice.com'
session.click_on 'Login/Register'
session.fill_in 'Email_1', with: 'keith.e.webber@gmail.com' #current_user.email
session.fill_in 'Password_1', with: 'password1' #password
session.click_on 'Login'
session.fill_in 'navSearchInput', with: 'Ruby on Rails'
session.click_on 'navSearchSubmit'
session.all('tr.gold td:first-child a').each do |a| 
  session2 = Capybara::Session.new(:selenium)
  session2.visit a[:href]
  session2.driver.browser.quit
end
