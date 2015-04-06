# Facturas
class Bill
  include Mongoid::Document

  field :numero_cliente, type: String
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

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Facturas.xml')))
    xml.xpath("//Facturas").each do |factura|
      json = Hash.from_xml(factura.to_xml).as_json
      bill = replace_fields(json['Facturas'])
      bill = find_or_create_by bill

      puts "Bill #{bill.id}"
    end
  end

  def self.replace_fields(record)
    new_record = {}
    extras = record
    new_record["_id"] = record.delete "Auto"
    new_record["numero_cliente"] = record.delete "NUMCLIENTE"
    new_record["numero_factura"] = record.delete "NUMFACT"
    new_record["estado"] = record.delete "ESTADO"
    new_record["fecha_factura"] = record.delete "FECHAFACT"
    new_record["year"] = record.delete "ANYO"
    new_record["nif"] = record.delete "NIF"
    new_record["nombre_fis"] = record.delete "NOMBRE_FIS"
    new_record["direccion_fis"] = record.delete "DIREC_FIS"
    new_record["poblacion_fis"] = record.delete "POBLAC_FIS"
    new_record["provincia_fis"] = record.delete "PROVIN_FIS"
    new_record["dpostal_fis"] = record.delete "DIST_P_FIS"
    new_record["periodo_desde"] = record.delete "PERIODESDE"
    new_record["periodo_hasta"] = record.delete "PERIOHASTA"
    new_record["tipo_servicio"] = record.delete "TIPOSERV"
    new_record["nombre_apl"] = record.delete "NOMBRE_APL"
    new_record["direccion_apl"] = record.delete "DIREC_APL"
    new_record["poblacion_apl"] = record.delete "POBLAC_APL"
    new_record["provincia_apl"] = record.delete "PROVIN_APL"
    new_record["dpostal_apl"] = record.delete "DIST_P_APL"
    # new_record["numero_cliente"] = record.delete "Euro"
    new_record["base_imponible"] = record.delete "BASEIMP"
    new_record["base_impuestos_sin_descuentos"] = record.delete "BaseImpSDesc"
    new_record["descuento"] = record.delete "Descuento"
    new_record["total_descuento"] = record.delete "TotalDescuento"
    new_record["iva"] = record.delete "IVA"
    new_record["total_iva"] = record.delete "TOTALIVA"
    new_record["total_factura"] = record.delete "TOTALFACT"
    new_record["numero_recibo"] = record.delete "NUMRECIBO"
    new_record["fecha_vencimiento"] = record.delete "FECHAVENC"
    new_record["banco"] = record.delete "BANCO"
    new_record["agencia"] = record.delete "AGENCIA"
    new_record["ccc"] = record.delete "CCC"
    new_record["cobrada"] = record.delete "Cobrada"
    new_record["observaciones"] = record.delete "OBSERV"
    new_record["abonada"] = record.delete "Abonada"
    # new_record["fecha_cobrada"] = record.delete "???"
    new_record["morosa"] = record.delete "Morosa"
    new_record["extras"] = extras

    new_record
  end
end


