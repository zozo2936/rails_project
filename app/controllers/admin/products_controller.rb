class Admin::ProductsController < ApplicationController
  class ProductsController < ApplicationController
    before_action :product_find, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @products = Product.all
    end
  
    def new
      @product = Product.new
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
    end
  
    def edit
    end
  
    def update
      if @product.update(product_params)
        redirect_to products_path, notice:"更新成功"
      else
        render :edit
      end
    end
  
    def destroy
      @product.destroy
      redirect_to products_path, notice:"刪除成功"
    end
  
    private
  
    def product_params
      params.require(:product).permit(:name, :list_price, :sell_price, :status, :description)
    end
    
    def product_find
      @product = Product.find(params[:id])
    end
  end
end
