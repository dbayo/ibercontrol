class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    if params[:client_search]
      @clients = Client.search(params[:client_search])
    else
      @clients = Client.all
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @places = @client.places
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
      add_breadcrumb "Cliente"
      add_breadcrumb @client.nombre_fiscal, [@client]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:nombre_fiscal, :geolocalizacion, :direccion_fiscal, :poblacion_fiscal, :telefono_fiscal, :codigo_postal, :fax, :preguntar_por, :fecha_contrato, :cuota_contrato, :fecha_de_baja, :fecha_ultimo_aumento, :cantidad_aumentada, :banco, :agencia, :ccc, :nif, :dia_de_factura, :dias_aplazado, :iva, :descuento, :observaciones, :web, :email)
    end
end
