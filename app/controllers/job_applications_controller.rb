class JobApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @job_applications = current_user.job_applications
    
  end

end
