class PagesController < ApplicationController 
  def index
    @categories = Category.all.order("id desc")
    @products = Product.all.order("id desc")
  end

end