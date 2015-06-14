# Facturas
class Bill
  include Mongoid::Document

  field :numero_factura, type: Integer
  field :estado, type: String
  field :fecha_factura, type: Date
  field :year, type: Integer
  field :nif, type: String
  field :nombre_fis, type: String
  field :direccion_fis, type: String
  field :poblacion_fis, type: String
  field :provincia_fis, type: String
  field :dpostal_fis, type: Integer
  field :periodo_desde, type: Date
  field :periodo_hasta, type: Date
  field :tipo_servicio, type: String
  field :nombre_apl, type: String
  field :direccion_apl, type: String
  field :poblacion_apl, type: String
  field :provincia_apl, type: String
  field :dpostal_apl, type: Integer
  field :euro, type: Boolean, default: true
  field :base_imponible, type: Integer
  field :base_impuestos_sin_descuentos, type: Integer
  field :descuento, type: Integer
  field :total_descuento, type: Integer
  field :iva, type: Integer
  field :total_iva, type: Integer
  field :total_factura, type: Float
  field :numero_recibo, type: Integer
  field :fecha_vencimiento, type: Date
  field :banco, type: String
  field :agencia, type: String
  field :ccc, type: String
  field :observaciones, type: String
  field :cobrada, type: Boolean, default: false
  # field :fecha_cobrada, type: Date
  field :abonada, type: Boolean, default: false
  field :morosa, type: Boolean, default: false
  field :extras, type: Hash

  belongs_to :service

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Facturas.xml')))
    xml.xpath("//Facturas").each do |factura|
      json = Hash.from_xml(factura.to_xml).as_json
      find_or_create_by_json(json['Facturas'])
    end
  end

  def self.find_or_create_by_json(record)
    extras = record
    client_id = record.delete("NUMCLIENTE")

    client = Client.where(id: client_id).first
    if client
      service = client.places.first.services.first
      bill = service.bills.new
      bill._id = record.delete "Auto"
      bill.numero_factura = record.delete "NUMFACT"
      bill.estado = record.delete "ESTADO"
      bill.fecha_factura = Date.parse(record.delete("FECHAFACT")) unless record["FECHAFACT"].blank?
      bill.year = record.delete "ANYO"
      bill.nif = record.delete "NIF"
      bill.nombre_fis = record.delete "NOMBRE_FIS"
      bill.direccion_fis = record.delete "DIREC_FIS"
      bill.poblacion_fis = record.delete "POBLAC_FIS"
      bill.provincia_fis = record.delete "PROVIN_FIS"
      bill.dpostal_fis = record.delete "DIST_P_FIS"
      bill.periodo_desde = Date.parse(record.delete("PERIODESDE")) unless record["PERIODESDE"].blank?
      bill.periodo_hasta = Date.parse(record.delete("PERIOHASTA")) unless record["PERIOHASTA"].blank?
      bill.tipo_servicio = record.delete "TIPOSERV"
      bill.nombre_apl = record.delete "NOMBRE_APL"
      bill.direccion_apl = record.delete "DIREC_APL"
      bill.poblacion_apl = record.delete "POBLAC_APL"
      bill.provincia_apl = record.delete "PROVIN_APL"
      bill.dpostal_apl = record.delete "DIST_P_APL"
      bill.euro = record.delete("Euro") == 'Si'
      bill.base_imponible = record.delete "BASEIMP"
      bill.base_impuestos_sin_descuentos = record.delete "BaseImpSDesc"
      bill.descuento = record.delete "Descuento"
      bill.total_descuento = record.delete "TotalDescuento"
      bill.iva = record.delete "IVA"
      bill.total_iva = record.delete "TOTALIVA"
      bill.total_factura = record.delete "TOTALFACT"
      bill.numero_recibo = record.delete "NUMRECIBO"
      bill.fecha_vencimiento = Date.parse(record.delete("FECHAVENC")) unless record["FECHAVENC"].blank?
      bill.banco = record.delete "BANCO"
      bill.agencia = record.delete "AGENCIA"
      bill.ccc = record.delete "CCC"
      bill.cobrada = record.delete("Cobrada") == 'Si'
      bill.observaciones = record.delete "OBSERV"
      bill.abonada = record.delete("Abonada") == 'Si'
      # bill.fecha_cobrada = Date.parse(record.delete("???")) unless record["???"].blank?
      bill.morosa = record.delete("Morosa") == 'Si'
      bill.extras = extras
      bill.save

      puts "Bill #{bill.id}"
    else
      puts "Client not found #{client_id}"
    end

    bill
  end
end


# <Facturas>
#   <Auto>1</Auto>
#   <NUMCLIENTE>1</NUMCLIENTE>
#   <NUMFACT>525</NUMFACT>
#   <ESTADO>0</ESTADO>
#   <FECHAFACT>1998-06-01T00:00:00</FECHAFACT>
#   <ANYO>98</ANYO>
#   <NIF>B/58-665555</NIF>
#   <NOMBRE_FIS>BONA COMPRA, S.L.</NOMBRE_FIS>
#   <DIREC_FIS>Pl. Reis Catolics, 1</DIREC_FIS>
#   <POBLAC_FIS>PINEDA-PUEBLO NUEVO</POBLAC_FIS>
#   <PROVIN_FIS>Barcelona</PROVIN_FIS>
#   <DIST_P_FIS>08397</DIST_P_FIS>
#   <PERIODESDE>1998-04-01T00:00:00</PERIODESDE>
#   <PERIOHASTA>1998-05-01T00:00:00</PERIOHASTA>
#   <TIPOSERV>Desratización</TIPOSERV>
#   <NOMBRE_APL>SUPERMERCADO ROSA</NOMBRE_APL>
#   <DIREC_APL>Selva, 10</DIREC_APL>
#   <POBLAC_APL>PINEDA-PUEBLO NUEVO</POBLAC_APL>
#   <PROVIN_APL>Barcelona</PROVIN_APL>
#   <DIST_P_APL>08397</DIST_P_APL>
#   <Euro>No</Euro>
#   <BASEIMP>6525</BASEIMP>
#   <BaseImpSDesc>0</BaseImpSDesc>
#   <Descuento>0</Descuento>
#   <TotalDescuento>0</TotalDescuento>
#   <IVA>16</IVA>
#   <TOTALIVA>1044</TOTALIVA>
#   <TOTALFACT>7569</TOTALFACT>
#   <NUMRECIBO>126</NUMRECIBO>
#   <FECHAVENC>1998-06-20T00:00:00</FECHAVENC>
#   <BANCO>CAIXA LAIETANA</BANCO>
#   <AGENCIA>Ent.2242 Of.0042 DC 55</AGENCIA>
#   <CCC>3300005003</CCC>
#   <Cobrada>No</Cobrada>
#   <Abonada>No</Abonada>
#   <Morosa>No</Morosa>
# </Facturas>