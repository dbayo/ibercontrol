class BillDate
  include Mongoid::Document

  field :fecha_de_factura, type: String
  field :cuota_factura, type: String
  field :emitida, type: String #Si se ha impreso la Factura
  field :cobrada, type: String
  field :recibo, type: String
  field :periodo_desde, type: String
  field :periodo_hasta, type: String
  field :observaciones, type: String
  field :extras, type: Hash

  belongs_to :client

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Fch_Fact.xml')))
    xml.xpath("//Fch_Fact").each do |bill_date|
      json = Hash.from_xml(bill_date.to_xml).as_json
      bill_date = find_or_create_by_json(json['Fch_Fact'])
    end
  end

  def self.find_or_create_by_json(record)
    extras = record
    client_id = record.delete("NUMCLIENTE")

    client = Client.where(id: client_id).first
    if client
      bill_date = client.bill_dates.new
      bill_date._id = record.delete "Auto"
      bill_date.fecha_de_factura = record.delete "FECHAFACT"
      bill_date.cuota_factura = record.delete "CuotaFactEuro"
      bill_date.emitida = record.delete "EMITIDA"
      bill_date.cobrada = record.delete "COBRADA"
      bill_date.recibo = record.delete "RECIBO"
      bill_date.periodo_desde = record.delete "PERIODESDE"
      bill_date.periodo_hasta = record.delete "PERIOHASTA"
      bill_date.observaciones = record.delete "OBSERFCHFA"
      bill_date.extras = extras

      bill_date.save
      puts "BillDate #{bill_date.id}"
    else
      puts "Client not found #{client_id}"
    end

    bill_date
  end
end

# <Fch_Fact>
#   <Auto>5010</Auto>
#   <NUMCLIENTE>14</NUMCLIENTE>
#   <FECHAFACT>2014-05-01T00:00:00</FECHAFACT>
#   <CUOTAFACT>9167</CUOTAFACT>
#   <CuotaFactEuro>55.0947796088613</CuotaFactEuro>
#   <Euro>Si</Euro>
#   <EMITIDA>No</EMITIDA>
#   <COBRADA>No</COBRADA>
#   <RECIBO>No</RECIBO>
#   <PERIODESDE>2014-05-01T00:00:00</PERIODESDE>
#   <PERIOHASTA>2014-05-30T00:00:00</PERIOHASTA>
#   <OBSERFCHFA>San Antonio, 33/Pol.Ind. de Vilasar/Gran Via, 17/Virgen de la Merçe, 30</OBSERFCHFA>
# </Fch_Fact>