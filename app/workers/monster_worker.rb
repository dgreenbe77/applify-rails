class MonsterWorker
  require 'capybara'
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  sidekiq_options retry: false

def perform
session = Capybara::Session.new(:selenium)

session.visit "https://login.monster.com"
session.fill_in "EmailAddress", with: "testingemailjob@gmail.com"
session.fill_in "Password", with: "password1"
session.click_button "Sign In"
session.click_on "CREATE RESUME"
session.fill_in "Desired Job Title", with: "leet skills"
session.fill_in "Most Recent Job Title", with: "sick dev"
session.fill_in "Most Recent Employer", with: "Bgroupe"
session.select( "I am authorized to work in this country for any employer.", from: "Work authorization for US")

session.attach_file('FileToUpload', File.expand_path('KeithWebberResume.pdf'))
session.click_on "UPLOAD RESUME"
session.click_on "UPDATE VISIBILITY"
session.click_on "SAVE SETTINGS"
end

end
