class Product
  include Mongoid::Document
  field :producto, type: String
  field :numero_registro, type: String
  field :material_activo, type: String
  field :disolucion, type: String
  field :tecnica, type: String
  field :plazo_seguridad, type: String
  field :extras, type: Hash

  has_and_belongs_to_many :places

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'producto.xml')))
    xml.xpath("//producto").each do |factura|
      json = Hash.from_xml(factura.to_xml).as_json
      find_or_create_by_json(json['producto'])
    end
  end

  def self.find_or_create_by_json(record)
    extras = record

    product = new
    product._id = record.delete "NUMERO"
    product.producto = record.delete "PRODUCTO"
    product.numero_registro = record.delete "NUM_REG"
    product.material_activo = record.delete "MAT_ACTIVA"
    product.disolucion = record.delete "DISOLUCION"
    product.tecnica = record.delete "TECNICA"
    product.plazo_seguridad = record.delete "PLZSEG"

    product.extras = extras
    product.save

    puts "Producto #{product.id}"

    product
  end
end

# <producto>
#   <Auto>1</Auto>
#   <NUMERO>10</NUMERO>
#   <PRODUCTO>Nexa</PRODUCTO>
#   <NUM_REG>07-30-02109-HA</NUM_REG>
#   <MAT_ACTIVA>Fipronil  0,02 %</MAT_ACTIVA>
#   <TECNICA>Pulverización</TECNICA>
#   <PLZSEG>12</PLZSEG>
# </producto>