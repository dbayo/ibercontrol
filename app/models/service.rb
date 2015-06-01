class Service
  include Mongoid::Document
  field :nombre, type: String
  field :baja, type: Boolean, default: false

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

  has_many :service_dates
  belongs_to :place
  has_many :dits
  has_and_belongs_to_many :plagues
  has_and_belongs_to_many :employees

  after_create :generate_service_dates

  def self.create_services
    Place.all.each do |place|
      service = place.services.new
      service_name = place.client.extras['TIPOSERV']

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
      service.save
      puts "Service #{service.id}"
    end
  end

  def generate_service_dates
    %w(enero febrero marzo abril mayo junio julio agosto septiembre octubre noviembre diciembre).each_with_index do |month, index|
      self.service_dates.create(fecha_servicio: Date.new(Date.today.year, index - 1, 1)) if self[month]
    end
  end
end

