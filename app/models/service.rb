class Service
  include Mongoid::Document
  field :nombre, type: String
  field :baja, type: Boolean, default: false

  field :fecha_contrato, type: Date
  field :cuota_contrato, type: Integer
  field :fecha_de_baja, type: Date
  field :fecha_ultimo_aumento, type: Date
  # field :cantidad_aumentada, type: String

  field :dia_de_factura, type: Integer
  field :dias_aplazado, type: Integer
  field :iva, type: Integer
  field :descuento, type: Integer

  # Meses que se realiza la aplicación (fecha aplicacion)
  field :enero, type: Boolean, default: false
  field :febrero, type: Boolean, default: false
  field :marzo, type: Boolean, default: false
  field :abril, type: Boolean, default: false
  field :mayo, type: Boolean, default: false
  field :junio, type: Boolean, default: false
  field :julio, type: Boolean, default: false
  field :agosto, type: Boolean, default: false
  field :septiembre, type: Boolean, default: false
  field :octubre, type: Boolean, default: false
  field :noviembre, type: Boolean, default: false
  field :diciembre, type: Boolean, default: false

  # Meses que se realiza facturacion
  field :factura_enero, type: Boolean, default: false
  field :factura_febrero, type: Boolean, default: false
  field :factura_marzo, type: Boolean, default: false
  field :factura_abril, type: Boolean, default: false
  field :factura_mayo, type: Boolean, default: false
  field :factura_junio, type: Boolean, default: false
  field :factura_julio, type: Boolean, default: false
  field :factura_agosto, type: Boolean, default: false
  field :factura_septiembre, type: Boolean, default: false
  field :factura_octubre, type: Boolean, default: false
  field :factura_noviembre, type: Boolean, default: false
  field :factura_diciembre, type: Boolean, default: false

  has_many :service_dates
  belongs_to :place
  has_many :dits
  has_and_belongs_to_many :plagues
  has_and_belongs_to_many :employees

  has_many :bills
  has_many :bill_dates

  after_create :generate_service_dates
  after_create :generate_bill_dates

  def self.create_services
    Place.all.each do |place|
      service = place.services.new
      client = place.client
      service_name = client.extras['TIPOSERV']

      case service_name
      when "Baja Dr"
        service.nombre = "Desratización"
        service.baja = true
      when "Baja Ds"
        service.nombre = "Desinsectación"
        service.baja = true
      when "Baja Dsf"
        service.nombre = "Desinfección"
        service.baja = true
      when "Baja Control"
        service.nombre = "Control"
        service.baja = true
      when "Baja Xilófago"
        service.nombre = "Tratamiento xilófagos"
        service.baja = true
      when "Baja Legionela"
        service.nombre = "Legionela"
        service.baja = true
      else
        service.nombre = service_name
        service.baja = false
      end

      service.fecha_contrato = Date.parse(client.extras['FECHA_CONT']) unless client.extras['FECHA_CONT'].blank?
      service.cuota_contrato = client.extras['CUOTA_CONT']
      service.fecha_de_baja = Date.parse(client.extras['FECHA_BAJA']) unless client.extras['FECHA_BAJA'].blank?
      service.fecha_ultimo_aumento = Date.parse(client.extras['Fecha_Ult_Aum']) unless client.extras['Fecha_Ult_Aum'].blank?

      service.dia_de_factura = client.extras['DIA_FACT']
      service.dias_aplazado = client.extras['DIA_APLAZ']
      service.iva = client.extras['IVA']
      service.descuento = client.extras['Descuento']

      service.save
      puts "Service #{service.id}"
    end
  end

  def generate_service_dates
    %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre).each_with_index do |month, index|
      self.service_dates.create(fecha_servicio: Date.new(Date.today.year, index - 1, 1)) if self[month]
    end
  end

  def generate_bill_dates
    %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre).each_with_index do |month, index|
      self.service_dates.create(fecha_servicio: Date.new(Date.today.year, index - 1, 1)) if self[month]
    end
  end
end

