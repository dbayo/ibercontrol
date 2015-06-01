class BillDate
  include Mongoid::Document

  field :fecha_de_factura, type: Date
  field :cuota_factura, type: Float, default: 0.0
  field :emitida, type: Boolean, default: false #Si se ha impreso la Factura
  field :cobrada, type: Boolean, default: false
  field :recibo, type: Boolean, default: false
  field :periodo_desde, type: Date
  field :periodo_hasta, type: Date
  field :observaciones, type: String
  field :extras, type: Hash

  belongs_to :service

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
      service = client.places.first.services.first
      bill_date = service.bill_dates.new
      bill_date._id = record.delete "Auto"
      bill_date.fecha_de_factura = Date.parse(record.delete("FECHAFACT")) unless record["FECHAFACT"].blank?
      bill_date.cuota_factura = record.delete("CuotaFactEuro").to_s.to_f.round(2)
      bill_date.emitida = record.delete("EMITIDA") == 'Si'
      bill_date.cobrada = record.delete("COBRADA") == 'Si'
      bill_date.recibo = record.delete("RECIBO") == 'Si'
      bill_date.periodo_desde = Date.parse(record.delete("PERIODESDE")) unless record["PERIODESDE"].blank?
      bill_date.periodo_hasta = Date.parse(record.delete("PERIOHASTA")) unless record["PERIOHASTA"].blank?
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