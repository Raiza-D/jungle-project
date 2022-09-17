require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # When all required fields have values
    it 'should create a new user if all required fields are set' do
      @user = User.new(name: 'Waldo Smith', email: 'waldos@email.com', password: '12345678', password_confirmation: '12345678')

      @user.validate

      expect(@user).to be_valid
    end

    # Password and password confirmation do not match
    it 'should produce an error if password and password confirmation do not match' do
      @user = User.new(name: 'Alice Jones', email: 'alicej@email.com', password: 'abc12345', password_confirmation: '123abc4')

      @user.validate

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # Name cannot be blank
    it 'should produce an error if name is blank' do
      @user = User.new(email: 'atlasrain@email.com', password: '12345678', password_confirmation: '12345678')

      @user.validate

      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    # Email cannot be blank
    it 'should produce an error if email is blank' do
      @user = User.new(name: 'Tessa Rand', password: 'abc123456', password_confirmation: 'abc123456')

      @user.validate

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    # Checks that the email does not already exist
    it 'checks that the email does not already exist' do
      @user = User.new(name: 'Atlas Desmoine', email: 'atlasdes@email.com', password: '12345678', password_confirmation: '12345678')

      @user2 = User.new(name: 'Anne Doe', email: 'atlasdes@email.com', password: '123', password_confirmation: '123' )

      @user.save
      @user2.validate

      expect(@user2).not_to be_valid
    end

    # Checks that email is not case sensitive
    it 'checks that the email is not case sensitive' do
      @user = User.new(name: 'Mick Jagger', email: 'MICKJAGGER@email.COM', password: '12345678', password_confirmation: '12345678')

      @user2 = User.new(name: 'Jane Jagger', email: 'mickjagger@email.com', password: '12345678', password_confirmation: '12345678')

      @user.save
      @user2.validate

      expect(@user2).not_to be_valid
    end

    # Checks password length meets minimum
    it 'checks that the password length is a minimum of 8 characters' do
      @user = User.new(name: 'Bart Simpson', email: 'bartsimpson@email.com', password: '123', password_confirmation: '123')

      @user.validate

      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end

  describe '.authenticate_with_credentials' do

    # Valid credentials
    it 'should pass with valid credentials' do
      @user = User.new(name: 'Elizabeth Friar', email: 'elizabethf@gmail.com', password: 'abc12345', password_confirmation: 'abc12345')

      @user.save
      @user = User.authenticate_with_credentials("elizabethf@gmail.com", "abc12345")

      expect(@user).not_to be(nil)
    end

    # Invalid email
    it 'should fail with email is invalid' do
      @user = User.new(name: 'Elizabeth Friar', email: 'elizabethf@gmail.com', password: 'abc12345', password_confirmation: 'abc12345')

      @user.save
      @user = User.authenticate_with_credentials("elizabethfriar@gmail.com", "abc12345")

      expect(@user).to be(nil)
    end

  end


end
