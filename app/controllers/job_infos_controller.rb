class JobInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_infos

  def index

  end

end
