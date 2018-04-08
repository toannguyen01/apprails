class ProductsController < ApplicationController
  before_action :get_product, only: [:show]
  def index
    @products = Product.all.order("id desc").page(params[:page]).per(8)
  end

  def show    
  end

  private

  def get_product
    @product = Product.find(params[:id])
  end

end