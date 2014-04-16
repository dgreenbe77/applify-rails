require 'capybara'
session = Capybara::Session.new(:selenium)
session.visit 'http://www.dice.com'
session.click_on 'Login/Register'
session.fill_in 'Email_1', with: 'keith.e.webber@gmail.com' #current_user.email
session.fill_in 'Password_1', with: 'password1' #password
session.click_on 'Login'
session.fill_in 'navSearchInput', with: 'Ruby on Rails'
session.click_on 'navSearchSubmit'
search_page = session.current_url
anchors = session.all('tr.gold td:first-child a')

links = anchors.map {|a| a[:href]}

links.each do |a|
  if a.include?('dice.com') && !a.include?('op=1030')
    session.visit a
    job_url = session.find('a#APPLY_FOR_JOB')[:href]
    unless job_url.include?('&url=')
      session.visit job_url
      session.fill_in 'fname', with: 'Joni'
      session.fill_in 'lname', with: 'Mitchell'
      session.fill_in 'coverLetterText', with: 'I am the best'
      session.find('li#rtab2 a').click
      session.fill_in 'resumeText', with: 'Hi'
      session.click_on 'sendButton-button'
    end
  end
end
# session.visit search_page
# session2.driver.browser.quit
# session.fill_in 'Addr', with: '10 Launch Rd'
# session.fill_in 'City', with: 'New York'
# session.select('Alabama', :from => 'ddlState')
# session.fill_in 'Zip', with: '12345'
# session.fill_in 'Phone', with: '512-222-2222'
# session.fill_in 'Company', with: 'Business'
# session.select('Director (IT)', :from => '2_1')
# session.select('Education', :from => '3_1')
# session.select('20,000 or More', :from => '4_1')
# session.select('Application Development', :from => '5_1')
# session.select('Hybrid', :from => '6_1')
# session.click_on('ibRequestInfo')
