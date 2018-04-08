class ProductsController < ApplicationController
  before_action :get_product, only: [:show]
  before_action :order_items_new, only: [:index, :show]
  def index
    @products = Product.all.order("id desc").page(params[:page]).per(8)
  end

  def show    
  end

  private

  def get_product
    @product = Product.find(params[:id])
  end
  def order_items_new
     @order_item = current_order.order_items.new
  end

end