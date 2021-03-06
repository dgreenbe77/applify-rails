class JobInfo < ActiveRecord::Base
  belongs_to :user

  CONTACTS = ['Home Phone', 'Cell Phone', 'Work Phone']
  AUTHS = ["Green Card Holder", "Canadian Citizen", "U.S. Citizen", "TN Permit Holder", "Employment Authorization Document", "Have H-1 Visa", "Need H-1 Visa"]
  validates :first_name, presence: true, format: { with: /\w[a-z]+\z/i }
  validates :last_name, presence: true, format: { with: /\w[a-z]+\z/i }
  validates :dice_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :dice_password, presence: true
  validates :desired_position, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, format: {:with => /^\d{5}(-\d{4})?$/,
                                                :message => "should be in the form 12345 or 12345-1234", multiline: true}
  validates :resume, presence: true
  validates :home_phone, presence: true
  validates :primary_contact, presence: true , inclusion: { in: CONTACTS }
  validates :title, presence: true
  validates :daily_schedule, default: false
  validates :work_auth, presence: true, inclusion: { in: AUTHS }
  validates :skills, presence: true
end
