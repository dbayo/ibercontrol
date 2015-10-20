class Service
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :plano
  do_not_validate_attachment_file_type :plano
  # mount_uploaders :planos, PlanoUploader

  field :nombre, type: String
  field :baja, type: Boolean, default: false

  field :fecha_contrato, type: Date
  field :cuota_contrato, type: Integer
  field :fecha_inicio, type: Date
  field :fecha_de_baja, type: Date
  field :fecha_ultimo_aumento, type: Date
  # field :cantidad_aumentada, type: String

  field :dia_de_factura, type: Integer
  field :dias_aplazado, type: Integer
  field :iva, type: Integer
  field :descuento, type: Integer
  field :area, type: String

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
  field :total_months_service_dates, type: Integer, default: 0

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
  field :total_months_bills, type: Integer, default: 0

  has_many :service_dates
  belongs_to :place
  has_many :dits
  has_and_belongs_to_many :plagues
  has_and_belongs_to_many :employees

  has_many :bills
  has_many :bill_dates

  after_create :generate_service_dates
  after_create :generate_bill_dates

  before_save :calculate_total_months

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

  def calculate_total_months
    total_service_dates = 0
    total_bill_dates = 0
    %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre).each do |month|
      total_service_dates += 1 if self[month]
      total_bill_dates += 1 if self["factura_#{month}"]
    end

    self.total_months_service_dates = total_service_dates
    self.total_months_bills = total_bill_dates
  end

  def generate_service_dates
    %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre).each_with_index do |month, index|
      self.service_dates.find_or_create_by(fecha_servicio: Date.new(Date.today.year, index + 1, 1)) if self[month]
    end
  end

  def generate_bill_dates
    %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre).each_with_index do |month, index|
      self.bill_dates.find_or_create_by(fecha_de_factura: Date.new(Date.today.year, index + 1, 1), cuota_factura: (self.cuota_contrato.to_i / self.total_months_bills)) if self["factura_#{month}"]
    end
  end
end

