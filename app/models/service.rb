class Service
  include Mongoid::Document
  field :name, type: String

  belongs_to :place

  def self.import_database
    File.readlines(File.join(Rails.root, 'lib', 'old_database_json', 'TipoServ.txt')).map do |line|
      service_type = find_or_create_by(name: line.force_encoding('iso-8859-1').encode('utf-8').strip)
      puts "Service #{service_type.id}"
    end
  end
end
