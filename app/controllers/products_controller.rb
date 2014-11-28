class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end


  private
    def set_product
      @product = Product.friendly.find(params[:id])
    end
end