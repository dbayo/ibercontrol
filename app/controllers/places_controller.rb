class PlacesController < ApplicationController
  before_action :set_client, except: [:index]
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    if params[:place_search]
      @places = Place.search(params[:place_search]).page params[:page]
    else
      @places = Place.page params[:page]
    end
  end

  # GET /places/1
  # GET /places/1.json
  def show
    @services = @place.services
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  def fill_as_client
    place = Place.create_from_client_info(@client)
    redirect_to edit_client_place_path(@client, place), notice: 'Place was successfully created.'
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = @client.places.new(place_params)

    if @place.save
      redirect_to [@client], notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    if @place.update(place_params)
      redirect_to [@client, @place], notice: 'Place was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    redirect_to [@client], notice: 'Place was successfully destroyed.'
  end

  private
    def set_client
      @client = Client.find(params[:client_id])
      add_breadcrumb "Cliente"
      add_breadcrumb @client.nombre_fiscal, [@client]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
      add_breadcrumb "Local"
      add_breadcrumb "#{@place.nombre} (#{@place.direccion})", [@client, @place]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:numero_cliente, :nombre, :direccion,
        :poblacion, :provincia, :dpostal, :zona, :telefono, :fax, :preguntar_por,
        :reclamacion, :actividad, :plaga, :area, :observaciones, :plano,
        :aplicador1, :aplicador2, :geolocalizacion, :activity)
    end
end
