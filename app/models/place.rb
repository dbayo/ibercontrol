class Place
  include Mongoid::Document

  field :nombre, type: String
  field :geolocalizacion, type: String
  field :direccion, type: String
  field :poblacion, type: String
  field :provincia, type: String
  field :dpostal, type: String
  field :zona, type: String
  field :telefono, type: String
  field :fax, type: String
  field :preguntar_por, type: String
  field :reclamacion, type: Integer
  field :observaciones, type: String
  field :plano, type: Boolean
  field :extras, type: Hash

  belongs_to :client
  has_many :services
  has_many :service_types
  belongs_to :activity

  def self.search(search)
    search_condition = /#{search}/i
    any_of({:nombre => search_condition}, {:id => search_condition}, {:direccion => search_condition})
  end

  def full_address
    out = [self.direccion.to_s.scan(/^\D*\d*/)]
    out << self.poblacion
    out << self.provincia
    out << self.dpostal
    out.join(', ')
  end

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Locales.xml')))
    xml.xpath("//Aplica").each do |place|
      json = Hash.from_xml(place.to_xml).as_json
      find_or_create_by_json json['Aplica']
    end
  end

  def self.find_or_create_by_json(record)
    extras = record
    client_id = record.delete("NumCliente")

    client = Client.where(id: client_id).first
    if client
      place = client.places.new
      place._id = record.delete "Auto"
      place.nombre = record.delete "Nombre_Apl"
      place.direccion = record.delete "Direc_Apl"
      place.poblacion = record.delete "Poblac_Apl"
      place.provincia = record.delete "Provin_Apl"
      place.dpostal = record.delete "Dist_P_Apl"
      place.zona = record.delete "Zona"
      place.telefono = record.delete "Telf_Apl"
      place.fax = record.delete "Fax"
      place.preguntar_por = record.delete "Pregun_Apl"
      place.reclamacion = record.delete "Reclamacio"
      place.observaciones = record.delete "Observ_apl"
      # place.observaciones_parti = record.delete "ObserParti"
      place.plano = record.delete("Plano") == 'Si'

      if record["Actividad"]
        parsed_activity = Activity.parser_activity_type(record.delete("Actividad"))
        place.activity = Activity.find_or_create_by(name: parsed_activity)
      end

      place.extras = extras
      place.save
      puts "Place #{place.id}"
    else
      puts "Client not found #{client_id}"
    end

    place
  end

  def self.join_duplicates
    Client.each do |client|
      client.places.group_by(&:direccion).values.each do |places_array|
        final_place = places_array.shift

        final_place.move_plague_to_service
        final_place.move_employee_to_service

        places_array.each do |place|
          place.move_plague_to_service
          place.move_employee_to_service
          place.move_area_to_service

          place.services.each do |service|
            service.place = final_place
            service.save
          end
          final_place.services.concat(place.services)
          place.delete
        end
      end
    end
  end

  def move_plague_to_service
    plaga = self.extras['Plaga']
    service = self.services.first

    if plaga
      array_plagues = Plague.parser_plague_type(plaga)
      array_plagues.each do |plague_name|
        service.plagues << Plague.find_or_create_by(name: plague_name)
      end
    end
  end

  def move_employee_to_service
    aplicador1 = self.extras['Aplicador1']
    aplicador2 = self.extras['Aplicador2']
    service = self.services.first

    service.employees << Employee.find_or_create_by(name: aplicador1) unless aplicador1.blank?
    service.employees << Employee.find_or_create_by(name: aplicador2) unless aplicador2.blank?
  end

  def move_area_to_service
    area = self.extras['Area']
    service = self.services.first
    service.update_attributes(area: area)
  end

  def self.create_from_client_info(client)
    place = client.places.new
    place.nombre = client.nombre_fiscal
    place.geolocalizacion = client.geolocalizacion
    place.direccion = client.direccion_fiscal
    place.poblacion = client.poblacion_fiscal
    place.provincia = client.provincia_fiscal
    place.dpostal = client.codigo_postal
    place.telefono = client.telefono_fiscal
    place.fax = client.fax
    place.save
    place
  end
end

# <Aplica>
#   <Auto>1</Auto>
#   <NumCliente>1</NumCliente>
#   <NumOrden>1</NumOrden>
#   <Nombre_Apl>SUPERMERCADO ROSA</Nombre_Apl>
#   <Direc_Apl>Selva, 10</Direc_Apl>
#   <Poblac_Apl>PINEDA-PUEBLO NUEVO</Poblac_Apl>
#   <Provin_Apl>Barcelona</Provin_Apl>
#   <Dist_P_Apl>08397</Dist_P_Apl>
#   <Zona>ZONA 3</Zona>
#   <Telf_Apl>93/769.06.57</Telf_Apl>
#   <Reclamacio>0</Reclamacio>
#   <Actividad>SUPERMERCADO</Actividad>
#   <Plaga>Mus Musculus y Rattus Norvegicus</Plaga>
#   <Area>Supermercado y almacén (18)</Area>
#   <Plano>No</Plano>
#   <Aplicador1>Fran</Aplicador1>
# </Aplica>
