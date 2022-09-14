class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password

  validates_length_of :password, :minimum => 8, :on => :create
  
  validates :password_confirmation, presence: true

end
