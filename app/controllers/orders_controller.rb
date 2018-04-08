class OrdersController < ApplicationController
  before_action :get_order, only: [:show, :payment, :update, :execute]
  
  def show
  end

  def update
    return redirect_to payment_order_path(params[:id]) if @order.update(order_params)
  end

  def payment
    @payment = PayPal::SDK::REST::Payment.new({
      :intent => "sale",
      :payer => {
        :payment_method => "paypal" },
      :redirect_urls => {
        :return_url => 'http://localhost:3000' + payment_order_path(params[:id]),
        :cancel_url => 'http://localhost:3000' + orders_path(params[:id]) },
      :transactions => [ {
        :amount => {
          :total => current_order.subtotal,
          :currency => "USD" },
        :description => "creating a payment" } ] } )

    if @payment.create
      @payment.id    
    else
      @payment.error 
    end
    if !params[:token].nil? && !params[:PayerID].nil?
          @order.update(payment_id: params[:paymentId], token_payment: params[:token], payer_id: params[:PayerID], user_id: current_user.id,status: true, total: current_order.subtotal)                 
    end
  end

  def execute
    @payment = PayPal::SDK::REST::Payment.find(@order.payment_id)
    if @payment.execute( :payer_id => @order.payer_id   )
      @order.update( finished: true)
      flash[:notice] = 'Payment success'
      current_order = Order.create(user_id: current_user.id)
      session[:order_id] = current_order.id
      redirect_to root_path
    else
      flash[:notice] = @payment.error 
      redirect_to cart_path(@order)
    end
  end


  private
  def get_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:name, :address, :phone)
  end    
end