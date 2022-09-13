require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.new(name: 'Climbers')
    @category.save!
  end

  describe 'Validations' do
    it 'should save new product when all required fields are set' do
      @product = Product.new(name: 'White Rose', description: 'White roses have a profound, plain, and enigmatic side by their genuineness and their purity.', category: @category, quantity: 45, price: 3999)

      @product.save
      
      expect(@product).to be_valid
    end

    it 'should result in an error if name is blank' do
      @product = Product.new(name: nil, description: 'Fusce in blandit libero. Duis eget tincidunt lorem.', category: @category, quantity: 90, price: 2599)

      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

  end
end
