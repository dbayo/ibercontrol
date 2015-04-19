class Service
  include Mongoid::Document
  field :nombre, type: String
  field :baja, type: Boolean

  belongs_to :place
  has_many :service_dates

  def self.create_services
    Places.all.each do |place|
      service=place.services.new
      case place.client.tipo_de_servicio
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
        service.nombre = place.client.tipo_de_servicio
        service.baja = false
      end
      service.save
    end
  end
end

