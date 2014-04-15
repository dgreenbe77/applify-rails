class DiceJobWorker
  require 'capybara'
  include Sidekiq::Worker
    sidekiq_options queue: "high"
  sidekiq_options retry: false

def perform
session = Capybara::Session.new(:selenium)
session.visit 'http://www.dice.com'
session.click_on 'Login/Register'
session.fill_in 'Email_1', with: 'testingemailjobs@gmail.com' #current_user.email
session.fill_in 'Password_1', with: 'password1' #password
session.click_on 'Login'
session.fill_in 'navSearchInput', with: 'Ruby on Rails'
session.click_on 'navSearchSubmit'
search_page = session.current_url
anchors = session.all('tr.gold td:first-child a')
anchors.each do |a| 
  if a[:href].include?('dice.com') || !a[:href].include?('op=1030')
    session.visit a[:href]
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
end

end
