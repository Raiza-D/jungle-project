require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.new(name: 'Climbers')
    @category.save
    # Remove the bang operator here. Not needed. It's just a test.
    # Bang operator MUTATES the object or variable that calls it.
    # So be careful when using it. 
  end

  describe 'Validations' do
    it 'should save new product when all required fields are set' do
      @product = Product.new(name: 'White Rose', description: 'White roses have a profound, plain, and enigmatic side by their genuineness and their purity.', category: @category, quantity: 45, price: 3999)

      @product.save
      
      expect(@product).to be_valid
    end

    it 'should produce an error if name is blank' do
      @product = Product.new(name: nil, description: 'Fusce in blandit libero. Duis eget tincidunt lorem.', category: @category, quantity: 90, price: 2599)

      @product.validate
      # Do validation first, then save (using bang operator)
      # BEST practice is to use 'validate' method, instead of actually changing the database.

      # Use product.validate for tests instead of product.save
      # Update all tests here.

      # No need to set fields being tested to have value of nil. Just remove it.
      # Wording on Compass confusing for this tip.

      # ActiveRecord contains the default error messages that are produced.
      # These error messages can be customized.

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should produce an error if price is blank' do
      @product = Product.new(name: 'True Jasmine', description: 'Suspendisse eleifend imperdiet tellus non consectetur.', category: @category, quantity: 60)
      # if price: nil, why does my test fail?

      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should produce an error if quantity is blank' do
      @product = Product.new(name: 'Chocolate Vine', description: 'Fusce in blandit libero', category: @category, quantity: nil, price: 2599)

      @product.save
      
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should produce an error if category is blank' do
      @product = Product.new(name: 'Downy Clematis', description: 'Donec vel commodo', category: nil, quantity: 100, price: 5999)

      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
