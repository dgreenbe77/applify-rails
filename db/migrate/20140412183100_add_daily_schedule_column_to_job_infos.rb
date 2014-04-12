class AddDailyScheduleColumnToJobInfos < ActiveRecord::Migration
  def change
    add_column :job_infos, :daily_schedule, :boolean, null: false
  end
end
