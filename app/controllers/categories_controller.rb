class CategoriesController < ApplicationController 
  before_action :get_categories, only: [:index, :show]
  before_action :order_items_new, only: [:index, :show]
  def index
    @products = Product.all.order("id desc").page(params[:page]).per(6)
  end

  def show    
    category = Category.find(params[:id])
    @products =category.products.order("id desc").page(params[:page]).per(6)
  end

  private

  def get_categories
    @categories = Category.all.order("id desc")
  end
  def order_items_new
     @order_item = current_order.order_items.new
  end  
end