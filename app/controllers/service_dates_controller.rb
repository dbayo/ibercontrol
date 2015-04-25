class ServiceDatesController < ApplicationController
  before_action :set_service_date, only: [:show, :edit, :update, :destroy, :remove_product, :add_product]
  before_action :set_client
  before_action :set_place
  before_action :set_service


  # GET /service_dates
  # GET /service_dates.json
  def index
    @service_dates = ServiceDate.all
  end

  # GET /service_dates/1
  # GET /service_dates/1.json
  def show
  end

  # GET /service_dates/new
  def new
    @service_date = ServiceDate.new
  end

  # GET /service_dates/1/edit
  def edit
  end

  # POST /service_dates
  # POST /service_dates.json
  def create
    @service_date = @service.service_dates.new(service_date_params)

    if @service_date.save
      redirect_to [@client, @place, @service], notice: 'Service date was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /service_dates/1
  # PATCH/PUT /service_dates/1.json
  def update
    if @service_date.update(service_date_params)
      redirect_to [@client, @place, @service, @service_date], notice: 'Service date was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /service_dates/1
  # DELETE /service_dates/1.json
  def destroy
    @service_date.destroy
    redirect_to [@client, @place, @service], notice: 'Service date was successfully destroyed.'
  end

  def remove_product
    product = Product.find params[:product_id]
    @service_date.products.delete(product)

    redirect_to [@client, @place, @service, @service_date], notice: 'Product was successfully destroyed.'
  end

  def add_product
    @service_date.add_product(params[:product_id])

    redirect_to [@client, @place, @service, @service_date], notice: 'Product was successfully added.'
  end

  private
    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_place
      @place = Place.find(params[:place_id])
    end

    def set_service
      @service = Service.find(params[:service_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_service_date
      @service_date = ServiceDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_date_params
      params.require(:service_date).permit(:fecha_servicio, :emitida, :aplicada)
    end
end
