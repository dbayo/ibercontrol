class ServicesController < ApplicationController
  before_action :set_client
  before_action :set_place
  before_action :set_service, only: [:show, :edit, :update, :destroy, :generate_dit]

  # GET /services/1
  # GET /services/1.json
  def show
    @bill_dates = @service.bill_dates.page params[:bill_date_page]
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = @place.services.new(service_params)

    if @service.save
      redirect_to [@client, @place], notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    if @service.update(service_params)
      redirect_to [@client, @place, @service], notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    redirect_to [@client, @place], notice: 'Service was successfully destroyed.'
  end

  def generate_dit
    respond_to do |format|
      format.html
      format.pdf { render :layout => false }
      # format.pdf do
      #   send_data pdf.render, filename: "dit_#{@service.to_param}.pdf",
      #                         type: "application/pdf",
      #                         disposition: "inline"
      # end
    end
  end

  private

    def set_client
      @client = Client.find(params[:client_id])
      add_breadcrumb "Cliente"
      add_breadcrumb @client.nombre_fiscal, [@client]
    end

    def set_place
      @place = Place.find(params[:place_id])
      add_breadcrumb "Local"
      add_breadcrumb @place.nombre, [@client, @place]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
      add_breadcrumb "Service"
      add_breadcrumb @service.nombre, [@client, @place, @service]
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:nombre, :baja,
        :enero, :febrero, :marzo, :abril, :mayo, :junio, :julio, :agosto, :septiembre, :octubre, :noviembre, :diciembre,
        :factura_enero, :factura_febrero, :factura_marzo, :factura_abril, :factura_mayo, :factura_junio, :factura_julio, :factura_agosto, :factura_septiembre, :factura_octubre, :factura_noviembre, :factura_diciembre
        )
    end
end
