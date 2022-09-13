require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.new(name: 'Climbers')
    @category.save!
  end

  describe 'Validations' do
    it 'should save new product when all required fields are set' do
      @product = Product.new(name: 'White Rose', description: 'White roses have a profound, plain, and enigmatic side by their genuineness and their purity.', category: @category, quantity: 45, price: 3999)

      @product.save!
      
      expect(@product).to be_valid
    end
    
  end
end
