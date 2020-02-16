class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice:"新增成功"
    else
      render :new
    end
  end
  
  def show
    product_params
    @product = Product.find(params[:id])
  end

  def edit
    
  end

  def destroy
    
  end

  private

  def product_params
    params.require(:product).permit(:name, :list_price, :sell_price, :status, :description)
  end
end