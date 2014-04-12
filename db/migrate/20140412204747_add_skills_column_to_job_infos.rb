class AddSkillsColumnToJobInfos < ActiveRecord::Migration
  def change
    add_column :job_infos, :skills, :string, null: false
  end
end
