class PagesController < ApplicationController 
  def index
    @categories = Category.all.order("id desc")
    @products = Product.all.order("id desc").page(params[:page]).per(6)
  end

end