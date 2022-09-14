require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # When all required fields have values
    it 'should create a new user if all required fields are set' do
      @user = User.new(name: 'Waldo Smith', email: 'waldos@email.com', password: '123', password_confirmation: '123')

      @user.validate

      expect(@user).to be_valid
    end

    # Password and password confirmation do not match
    it 'should produce an error if password and password confirmation do not match' do
      @user = User.new(name: 'Alice Jones', email: 'alicej@email.com', password: 'abc123', password_confirmation: '123')

      @user.validate

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # Name cannot be blank
    it 'should produce an error if name is blank' do
      @user = User.new(email: 'atlasrain@email.com', password: '123', password_confirmation: '123')

      @user.validate

      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    # Email cannot be blank
    it 'should produce an error if email is blank' do
      @user = User.new(name: 'Tessa Rand', password: 'abc', password_confirmation: 'abc')

      @user.validate

      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    # Checks that the email does not already exist
    it 'checks that the email does not already exist' do
      @user = User.new(name: 'Atlas Desmoine', email: 'atlasdes@email.com', password: '1234', password_confirmation: '1234')

      @user2 = User.new(name: 'Anne Doe', email: 'atlasdes@email.com', password: '123', password_confirmation: '123' )

      @user.save
      @user2.validate

      expect(@user2).not_to be_valid
    end

  end
end
