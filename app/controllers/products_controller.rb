class ProductsController < ApplicationController

  def new
    @product = Product.new
  end
  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render 'new', status: 422
    end
  end

  private def product_params
    params.require(:product).permit(:name, :description, :price, :stock_quantity)
  end
end
