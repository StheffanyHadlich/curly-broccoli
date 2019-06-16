class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_list


  def index
    @products = @list.products.all
  end


  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = @list.products.create product_params

    respond_to do |format|
      if @product.save
        format.html { redirect_to list_products_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to list_products_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product = @list.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to list_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def set_list
      @list = List.find(params[:list_id])
    end

    def product_params
      params.require(:product).permit(:name, :bought)
    end
end
