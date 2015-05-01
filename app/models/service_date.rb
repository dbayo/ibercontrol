class ServiceDate
  include Mongoid::Document
  field :fecha_servicio, type: Date
  field :emitida, type: Boolean
  field :aplicada, type: Boolean
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
        service_date.fecha_servicio = Date.parse(record.delete("FechaServ")) unless record["FechaServ"].blank?
        service_date.emitida = record.delete("Emitida") == 'Si'
        service_date.aplicada = record.delete("Aplicada") == 'Si'

        service_date.add_product(record.delete("Produc1"))
        service_date.add_product(record.delete("Produc2"))
        service_date.add_product(record.delete("Produc3"))
        service_date.add_product(record.delete("Produc4"))
        service_date.add_product(record.delete("Produc5"))
        service_date.add_product(record.delete("Produc6"))
        service_date.add_product(record.delete("Produc7"))

        service_date.extras = extras
        service_date.save

        puts "Service date #{service_date.id}"
      else
        puts "Place #{place_id} not found for client #{client_id}"
      end
    else
      puts "Client not found #{client_id}"
    end

    service_date
  end

  def add_product(product_id)
    product = Product.where(id: product_id).first
    if product
      self.products << Product.find(product_id)
      product.service_dates << self
      product.save
    end
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