class PagesController < ApplicationController 
  def index
    @categories = Category.all.order("id desc")
    @products = Product.all.order("id desc").page(params[:page]).per(6)
    @order_item = current_order.order_items.new
  end

end