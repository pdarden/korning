class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.fine(params[:id])
  end
end
