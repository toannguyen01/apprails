class HistoriesController < ApplicationController
  before_action :get_order_histories, only: [:index]
  def index    
    @order_histories = @order_histories.order("id desc").page(params[:page]).per(3)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @order_history = @order.order_items
  end
  
  private
  
  def get_order_histories
    @order_histories = current_user.orders.all
  end  

end