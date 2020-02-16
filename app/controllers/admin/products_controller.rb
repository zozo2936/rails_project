class Admin::ProductsController < ApplicationController
  before_action :product_find, only: [:show, :edit, :destroy,:update]
  before_action :authenticate_user!

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice:"新增成功"
    else
      render :new
    end
  end
  
  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice:"更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice:"刪除成功"
  end

  private

  def product_params
    params.require(:product).permit(:name, :list_price, :sell_price, :status, :description, :sku, :user_id)
  end
  
  def product_find
    @product = Product.find(params[:id])
  end
end
