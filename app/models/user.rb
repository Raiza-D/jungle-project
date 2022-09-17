class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true

  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password

  validates_length_of :password, :minimum => 8, :on => :create
  
  validates :password_confirmation, presence: true

  # Login authentication
  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase.strip)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

end
