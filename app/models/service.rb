class Service
  include Mongoid::Document
  field :nombre, type: String
  field :baja, type: Boolean

  has_many :service_dates
  belongs_to :place

  def self.create_services
    Place.all.each do |place|
      service = place.services.new
      service_name = place.client.tipo_de_servicio

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
      place.save
      puts "Service #{service.id}"
    end
  end
end

