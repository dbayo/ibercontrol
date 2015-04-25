class ServicesController < ApplicationController
  before_action :set_client
  before_action :set_place
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services/1
  # GET /services/1.json
  def show
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
    redirect_to services_url, notice: 'Service was successfully destroyed.'
  end

  private

    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_place
      @place = Place.find(params[:place_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:nombre, :baja)
    end
end
