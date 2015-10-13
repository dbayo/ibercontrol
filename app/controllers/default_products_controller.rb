class DefaultProductsController < ApplicationController
  before_action :set_default_product, only: [:show, :edit, :update, :destroy,
    :add_product, :remove_product]

  # GET /default_products
  # GET /default_products.json
  def index
    @default_products = DefaultProduct.all
  end

  # GET /default_products/1
  # GET /default_products/1.json
  def show
  end

  # GET /default_products/new
  def new
    @default_product = DefaultProduct.new
  end

  # GET /default_products/1/edit
  def edit
  end

  # POST /default_products
  # POST /default_products.json
  def create
    @default_product = DefaultProduct.new(default_product_params)

    respond_to do |format|
      if @default_product.save
        format.html { redirect_to @default_product, notice: 'Default product was successfully created.' }
        format.json { render :show, status: :created, location: @default_product }
      else
        format.html { render :new }
        format.json { render json: @default_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /default_products/1
  # PATCH/PUT /default_products/1.json
  def update
    respond_to do |format|
      if @default_product.update(default_product_params)
        format.html { redirect_to @default_product, notice: 'Default product was successfully updated.' }
        format.json { render :show, status: :ok, location: @default_product }
      else
        format.html { render :edit }
        format.json { render json: @default_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_products/1
  # DELETE /default_products/1.json
  def destroy
    @default_product.destroy
    respond_to do |format|
      format.html { redirect_to default_products_url, notice: 'Default product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_product
    product = Product.find params[:product_id]
    @default_product.products.delete(product)

    redirect_to @default_product, notice: 'Product was successfully destroyed.'
  end

  def add_product
    @default_product.add_product(params[:product_id])

    redirect_to @default_product, notice: 'Product was successfully added.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_default_product
      @default_product = DefaultProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def default_product_params
      params.require(:default_product).permit(:name)
    end
end
