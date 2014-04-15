class DiceWorker
  require 'capybara'
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  sidekiq_options retry: false

  def perform(job_info_id)

    current_job =  JobInfo.find(job_info_id)

    session = Capybara::Session.new(:selenium)
    session.visit 'http://www.dice.com'
    session.click_on "Login/Register"
    session.fill_in "Email_1", with: "#{current_job.dice_email}" #current_user.email
    session.fill_in "Password_1", with: "#{current_job.dice_password}"#password
    session.click_on "Login"
    session.click_on "Manage/Add Resumes"
    session.click_on "Create a New Resume"

    if (session.has_css?( "Delete", :count => 5))
      session.all(:css, "a.RSdelete")[0].click
      session.click_on("OK")
    end

    session.fill_in "Profile Name:", with: "#{current_job.first_name} #{current_job.last_name}  #{rand(1000)}" #needs to be unique just increment it
    session.fill_in "Desired Position:", with: "#{current_job.desired_position} " #desired position
    session.select("#{current_job.work_auth}", :from => 'Work Authorization') #needs to be from the user inputed to begin with
    session.fill_in "resumeText", with: "#{current_job.resume} " # Right now it is only text, cant figure out uploading
    session.click_on "submit-button"

    if session.has_field?(:id, "#contactData.errors")
      session.click_on "sectionEditLink_3"
      session.fill_in 'firstName', with: "#{current_job.first_name} "
      session.fill_in 'lastName', with: "#{current_job.last_name} "
      session.click_on 'submitSection4-button'
    end

    if session.has_field?(:id, "#skillData.errors.errors")
      session.click_on 'sectionEditLink_8'
      skills = current_job.skills.split(',')
        skills.each_with_index do |skill,index|
          session.fill_in "skills[#{index}].description", with: "#{skill}"
          session.click_on("skillAddButton")
        end
      session.click_on "submitSection9-button"
    end

  end

end
