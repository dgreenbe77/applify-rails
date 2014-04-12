class CreateJobApplicationsTable < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.string :company
      t.string :job_title
      t.string :website
      t.string :application_date
      t.string :location
      t.integer :user_id

      t.timestamps
    end
    add_index :job_applications, :user_id
  end
end
