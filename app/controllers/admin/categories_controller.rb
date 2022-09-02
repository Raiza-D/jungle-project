class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end


  # Select count(quantity) FROM products GROUP BY category_id

  def new
    @category = Category.new
  end

end
