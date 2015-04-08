# Facturas
class Bill
  include Mongoid::Document

  field :numero_factura, type: String
  field :estado, type: String
  field :fecha_factura, type: String
  field :year, type: String
  field :nif, type: String
  field :nombre_fis, type: String
  field :direccion_fis, type: String
  field :poblacion_fis, type: String
  field :provincia_fis, type: String
  field :dpostal_fis, type: String
  field :periodo_desde, type: String
  field :periodo_hasta, type: String
  field :tipo_servicio, type: String
  field :nombre_apl, type: String
  field :direccion_apl, type: String
  field :poblacion_apl, type: String
  field :provincia_apl, type: String
  field :dpostal_apl, type: String
  field :base_imponible, type: String
  field :base_impuestos_sin_descuentos, type: String
  field :descuento, type: String
  field :total_descuento, type: String
  field :iva, type: String
  field :total_iva, type: String
  field :total_factura, type: String
  field :numero_recibo, type: String
  field :fecha_vencimiento, type: String
  field :banco, type: String
  field :agencia, type: String
  field :ccc, type: String
  field :observaciones, type: String
  field :cobrada, type: String
  field :fecha_cobrada, type: String
  field :abonada, type: String
  field :morosa, type: String
  field :extras, type: Hash

  belongs_to :contract
  belongs_to :client

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
      bill = client.bills.new
      bill._id = record.delete "Auto"
      bill.numero_factura = record.delete "NUMFACT"
      bill.estado = record.delete "ESTADO"
      bill.fecha_factura = record.delete "FECHAFACT"
      bill.year = record.delete "ANYO"
      bill.nif = record.delete "NIF"
      bill.nombre_fis = record.delete "NOMBRE_FIS"
      bill.direccion_fis = record.delete "DIREC_FIS"
      bill.poblacion_fis = record.delete "POBLAC_FIS"
      bill.provincia_fis = record.delete "PROVIN_FIS"
      bill.dpostal_fis = record.delete "DIST_P_FIS"
      bill.periodo_desde = record.delete "PERIODESDE"
      bill.periodo_hasta = record.delete "PERIOHASTA"
      bill.tipo_servicio = record.delete "TIPOSERV"
      bill.nombre_apl = record.delete "NOMBRE_APL"
      bill.direccion_apl = record.delete "DIREC_APL"
      bill.poblacion_apl = record.delete "POBLAC_APL"
      bill.provincia_apl = record.delete "PROVIN_APL"
      bill.dpostal_apl = record.delete "DIST_P_APL"
      # bill.??? = record.delete "Euro"
      bill.base_imponible = record.delete "BASEIMP"
      bill.base_impuestos_sin_descuentos = record.delete "BaseImpSDesc"
      bill.descuento = record.delete "Descuento"
      bill.total_descuento = record.delete "TotalDescuento"
      bill.iva = record.delete "IVA"
      bill.total_iva = record.delete "TOTALIVA"
      bill.total_factura = record.delete "TOTALFACT"
      bill.numero_recibo = record.delete "NUMRECIBO"
      bill.fecha_vencimiento = record.delete "FECHAVENC"
      bill.banco = record.delete "BANCO"
      bill.agencia = record.delete "AGENCIA"
      bill.ccc = record.delete "CCC"
      bill.cobrada = record.delete "Cobrada"
      bill.observaciones = record.delete "OBSERV"
      bill.abonada = record.delete "Abonada"
      # bill.fecha_cobrada = record.delete "???"
      bill.morosa = record.delete "Morosa"
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