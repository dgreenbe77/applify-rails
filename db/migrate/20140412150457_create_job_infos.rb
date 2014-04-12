class CreateJobInfos < ActiveRecord::Migration
  def change
    create_table :job_infos do |t|
      t.integer :user_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :dice_email, null: false
      t.string :dice_password, null: false
      t.string :desired_position, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.text :resume, null: false
      t.text :cover_letter
      t.string :home_phone, null: false
      t.string :work_phone
      t.string :cell_phone
      t.string :desired_salary
      t.string :current_salary
      t.string :primary_contact
      t.string :title, null: false

      t.timestamps
    end
    add_index :job_infos, :user_id
  end
end
