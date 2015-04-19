class ServiceDate
  include Mongoid::Document
  field :fecha_servicio, type: String
  field :emitida, type: String
  field :aplicada, type: String
  field :extras, type: Hash

  has_and_belongs_to_many :products
  belongs_to :service

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Fch_Apl.xml')))
    xml.xpath("//Fch_Apl").each do |service_date|
      json = Hash.from_xml(service_date.to_xml).as_json
      find_or_create_by_json(json['Fch_Apl'])
    end
  end

  def self.find_or_create_by_json(record)
    extras = record
    client_id = record.delete("NumCliente")
    client = Client.where(id: client_id).first

    if client
      place_id = record.delete("NumOrden")
      place = client.places.where("extras.NumOrden" => place_id).first

      if place
        service = place.services.first
        service_date = service.service_dates.new(_id: record.delete("Auto"), service: service )
        service_date.fecha_servicio = record.delete "Emitida"
        service_date.aplicada = record.delete "Aplicada"

        service_date.products << Product.find_by(record.delete("Produc1")) unless record["Produc1"].nil? || record["Produc1"] == '0'
        service_date.products << Product.find_by(record.delete("Produc2")) unless record["Produc2"].nil? || record["Produc2"] == '0'
        service_date.products << Product.find_by(record.delete("Produc3")) unless record["Produc3"].nil? || record["Produc3"] == '0'
        service_date.products << Product.find_by(record.delete("Produc4")) unless record["Produc4"].nil? || record["Produc4"] == '0'
        service_date.products << Product.find_by(record.delete("Produc5")) unless record["Produc5"].nil? || record["Produc5"] == '0'
        service_date.products << Product.find_by(record.delete("Produc6")) unless record["Produc6"].nil? || record["Produc6"] == '0'
        service_date.products << Product.find_by(record.delete("Produc7")) unless record["Produc7"].nil? || record["Produc7"] == '0'

        service_date.extras = extras
        service_date.save

        place.save

        puts "Service #{service_date.id}"
      else
        puts "Place #{place_id} not found for client #{client_id}"
      end
    else
      puts "Client not found #{client_id}"
    end

    service_date
  end
end

# <Fch_Apl>
#   <Auto>23082</Auto>
#   <NumCliente>2958</NumCliente>
#   <NumOrden>1</NumOrden>
#   <NumServ>1</NumServ>
#   <FechaServ>2014-02-01T00:00:00</FechaServ>
#   <Produc1>1</Produc1>
#   <Produc2>160</Produc2>
#   <Produc3>360</Produc3>
#   <Produc4>4</Produc4>
#   <Produc5>0</Produc5>
#   <Produc6>492</Produc6>
#   <Produc7>493</Produc7>
#   <Emitida>Si</Emitida>
#   <Aplicada>Si</Aplicada>
# </Fch_Apl>