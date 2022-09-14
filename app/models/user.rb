class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password
  
  validates :password_confirmation, presence: true

end
