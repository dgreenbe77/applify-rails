class JobInfo < ActiveRecord::Base
  belongs_to :user

  CONTACTS = ['Home Phone', 'Cell Phone', 'Work Phone']
  validates :first_name, presence: true, format: { with: /\w[a-z]+\z/i }
  validates :last_name, presence: true, format: { with: /\w[a-z]+\z/i }
  validates :contact_email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }, uniqueness: true
  validates :address, presence: true
  validates :city, presence: true  
  validates :state, presence: true
  validates :zip_code, presence: true, format: {:with => /^\d{5}(-\d{4})?$/,
                                                :message => "should be in the form 12345 or 12345-1234", multiline: true}
  validates :resume, presence: true
  validates :country, presence: true
  validates :home_phone, presence: true
  validates :primary_contact, inclusion: { in: CONTACTS })
end
