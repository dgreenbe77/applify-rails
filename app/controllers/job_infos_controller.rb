class JobInfosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job_info, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index

    @job_infos = @user.job_infos
  end

  def new
    @job_info = JobInfo.new
  end

  def create
    @job_info = JobInfo.new(job_info_params)
    @job_info.user = current_user

    if @job_info.save
      MechanizeWorker.perform_async(@job_info.id)
      redirect_to @job_info, 
        notice: 'Job Info Added'
    else
      render :new
    end
  end

  def show
  end

  def edit 
  end

  def update
    if @job_info.update(job_info_params)
      redirect_to job_infos_path(@job_info), 
       notice: 'Updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @job_info.destroy
    redirect_to job_infos_url, 
      notice: 'Deleted successfully'
  end

  private
  def set_job_info
    @job_info = JobInfo.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def job_info_params
    params.require(:job_info).permit(:primary_contact, :current_salary, :desired_salary, :cell_phone, :work_phone, :home_phone, :cover_letter,
                                      :resume, :zip_code, :state, :city, :address, :contact_email, :last_name, :first_name, :title, :daily_schedule)
  end

end
