class CreateJobInfos < ActiveRecord::Migration
  def change
    create_table :job_infos do |t|
      t.integer :user_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :contact_email, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :resume, null: false
      t.string :cover_letter
      t.string :home_phone, null: false
      t.string :work_phone
      t.string :cell_phone
      t.string :desired_salary
      t.string :current_salary
      t.string :country, null: false
      t.string :primary_contact

      t.timestamps
    end
    add_index :job_infos, :contact_email, unique: true
    add_index :job_infos, :user_id
  end
end
