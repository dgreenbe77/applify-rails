class MechanizeWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"
  sidekiq_options retry: false
  
  def perform(job_info_id)
    job_info = JobInfo.find(job_info_id) 
    agent = Mechanize.new
    page = agent.get("http://www.dice.com/profman/servlet/ProfMan?op=3000")
    form = page.forms.first
    form["SJT_USER_NAME"] = "keith.e.webber@gmail.com"
    form["SJT_PASSWD"] = "password1"
    form.click_button(form.button_with(:value => /Login/))
  end

end
