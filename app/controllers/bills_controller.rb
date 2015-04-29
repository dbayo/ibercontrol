class BillsController < ApplicationController
  before_action :set_client
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  # GET /bills
  # GET /bills.json
  def index
    @bills = @client.bills
  end

  # GET /bills/1
  # GET /bills/1.json
  def show
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills
  # POST /bills.json
  def create
    @bill = Bill.new(bill_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to @bill, notice: 'Bill was successfully created.' }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1
  # PATCH/PUT /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_params)
        format.html { redirect_to @bill, notice: 'Bill was successfully updated.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1
  # DELETE /bills/1.json
  def destroy
    @bill.destroy
    respond_to do |format|
      format.html { redirect_to bills_url, notice: 'Bill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_client
      @client = Client.find(params[:client_id])
      add_breadcrumb "Cliente"
      add_breadcrumb @client.nombre_fiscal, [@client]
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
      add_breadcrumb "Facturas"
      add_breadcrumb @bill.numero_factura, [@client, @bill]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params.require(:bill).permit(:numero_factura, :estado, :fecha_factura, :year, :nif, :nombre_fis, :direccion_fis, :poblacion_fis, :provincia_fis, :dpostal_fis, :periodo_desde, :periodo_hasta, :tipo_servicio, :nombre_apl, :direccion_apl, :poblacion_apl, :provincia_apl, :dpostal_apl, :base_imponible, :base_impuestos_sin_descuentos, :descuento, :total_descuento, :iva, :total_iva, :total_factura, :numero_recibo, :fecha_vencimiento, :banco, :agencia, :ccc, :observaciones, :cobrada, :fecha_cobrada, :abonada, :morosa, :extras, :client_id)
    end
end
