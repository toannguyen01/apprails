class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.page(params[:page]).per(4)
  end
end