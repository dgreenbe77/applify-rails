class AddWorkAuth < ActiveRecord::Migration
  def change
    add_column :job_infos, :work_auth, :string
  end
end
