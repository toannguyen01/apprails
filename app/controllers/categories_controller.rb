class CategoriesController < ApplicationController 
  before_action :get_categories, only: [:index, :show]
  def index
    @products = Product.all.order("id desc")
  end

  def show    
    category = Category.find(params[:id])
    @products =category.products.order("id desc")
  end

  private

  def get_categories
    @categories = Category.all.order("id desc")
  end
end