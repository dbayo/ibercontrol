class Client
  include Mongoid::Document
  field :nombre_fiscal, type: String
  field :geolocalizacion, type: String
  field :direccion_fiscal, type: String
  field :poblacion_fiscal, type: String
  field :provincia_fiscal, type: String
  field :codigo_postal, type: String
  field :telefono_fiscal, type: String
  field :fax, type: String
  field :preguntar_por, type: String
  field :fecha_contrato, type: String
  field :cuota_contrato, type: String
  field :fecha_de_baja, type: String
  field :fecha_ultimo_aumento, type: String
  field :cantidad_aumentada, type: String
  field :banco, type: String
  field :agencia, type: String
  field :ccc, type: String
  field :nif, type: String
  field :dia_de_factura, type: String
  field :dias_aplazado, type: String
  field :iva, type: String
  field :descuento, type: String
  field :observaciones, type: String
  field :web, type: String
  field :email, type: String
  field :extras, type: Hash

  has_many :places
  has_many :bills
  has_many :bill_dates

  # before_save :create_geolocalizacion

  def self.search(search)
    search_condition = /#{search}/i
    any_of({:nombre_fiscal => search_condition}, {:id => search_condition})
  end

  def create_geolocalizacion
    if self.direccion_fiscal
      self.geolocalizacion = self.full_address
    end
  end

  def full_address
    out = [self.direccion_fiscal.scan(/^\D*\d*/)]
    out << self.poblacion_fiscal
    out << self.provincia_fiscal
    out << self.codigo_postal
    out.join(', ')
  end

  def self.import_database
    xml = Nokogiri::XML(open(File.join(Rails.root, 'lib', 'old_database_json', 'Clientes.xml')))
    xml.xpath("//Clientes").map do |cliente|
      json = Hash.from_xml(cliente.to_xml).as_json
      client = find_or_create_by_json json['Clientes']
      puts "Client #{client.nombre_fiscal}"
    end
  end

  def self.find_or_create_by_json(record)
    extras = record

    client = Client.find_or_create_by(id: record.delete("NUMCLIENTE"))
    client.nombre_fiscal = record.delete "NOMBRE_FIS"
    client.direccion_fiscal = record.delete "DIREC_FIS"
    client.poblacion_fiscal = (record.delete "POBLAC_FIS").to_s.capitalize
    client.provincia_fiscal = (record.delete "PROVIN_FIS").to_s.capitalize
    client.codigo_postal = record.delete "DIST_P_FIS"
    client.telefono_fiscal = record.delete "TELF_FIS"
    client.fax = record.delete "FAX"
    client.preguntar_por = record.delete "PREGUN_FIS"
    client.fecha_contrato = record.delete "FECHA_CONT"
    client.cuota_contrato = record.delete "CUOTA_CONT"
    client.fecha_de_baja = record.delete "FECHA_BAJA"
    # client.???" record.delete "REPRESEN"
    # client.???" record.delete "COMISION"
    client.banco = record.delete "BANCO"
    client.agencia = record.delete "AGENCIA"
    client.ccc = record.delete "CCC"
    client.nif = record.delete "NIF"
    client.dia_de_factura = record.delete "DIA_FACT"
    client.dias_aplazado = record.delete "DIA_APLAZ"
    client.iva = record.delete "IVA"
    client.descuento = record.delete "Descuento"
    client.observaciones = record.delete "OBSERVFIS"
    client.web = record.delete "Web"
    client.fecha_ultimo_aumento = record.delete "Fecha_Ult_Aum"
    client.email = record.delete "EMail"
    client.extras = extras

    client.save

    client
  end

  def self.join_duplicates
    self.all.group_by(&:nif).values.each do |clients_array|
      final_client = clients_array.shift
      clients_array.each do |client|
        final_client.places.concat(client.places)
        client.delete
      end
    end
  end
end


# <Clientes>
# <Auto>2523</Auto>
# <NUMCLIENTE>2380</NUMCLIENTE>
# <NOMBRE_FIS>UTE ESPAIS SINGULARS</NOMBRE_FIS>
# <DIREC_FIS>Wold Trade Center Edif. Norte, 7ª Planta</DIREC_FIS>
# <POBLAC_FIS>BARCELONA</POBLAC_FIS>
# <PROVIN_FIS>Barcelona       @#+T</PROVIN_FIS>
# <DIST_P_FIS>08039</DIST_P_FIS>
# <TELF_FIS>93/419.87.59/639.721.496</TELF_FIS>
# <FAX>93/419.87.53</FAX>
# <PREGUN_FIS>Belén Nuñez/David M.Gomez</PREGUN_FIS>
# <FECHA_CONT>2006-08-01T00:00:00</FECHA_CONT>
# <CUOTA_CONT>387.5</CUOTA_CONT>
# <FECHA_BAJA>2007-03-01T00:00:00</FECHA_BAJA>
# <NIF>G/64.244.056</NIF>
# <DIA_FACT>25</DIA_FACT>
# <DIA_APLAZ>90</DIA_APLAZ>
# <IVA>21</IVA>
# <Descuento>0</Descuento>
# <TIPOSERV>Baja Dr</TIPOSERV>
# <OBSERVFIS>UTE ESPAIS SINGULARS
# Av. Josep Tarradellas, 97 Entresuelo 2ª
# 08029 BARCELONA</OBSERVFIS>
# </Clientes>

# <Clientes>
# <Auto>2699</Auto>
# <NUMCLIENTE>2380</NUMCLIENTE>
# <NOMBRE_FIS>UTE ESPAIS SINGULARS</NOMBRE_FIS>
# <DIREC_FIS>c/ Cataluña, 55</DIREC_FIS>
# <POBLAC_FIS>EL PRAT DE LLOBREGAT</POBLAC_FIS>
# <PROVIN_FIS>Barcelona</PROVIN_FIS>
# <DIST_P_FIS>08820</DIST_P_FIS>
# <TELF_FIS>93/370.93.59</TELF_FIS>
# <PREGUN_FIS>Sra.Mª Carmen/Mª Mar</PREGUN_FIS>
# <NIF>G-63.626.196</NIF>
# <DIA_FACT>1</DIA_FACT>
# <IVA>21</IVA>
# <Descuento>0</Descuento>
# <TIPOSERV>Baja Control</TIPOSERV>
# </Clientes>