class ServiceType
  include Mongoid::Document
  field :name, type: String

  belongs_to :place

  def self.import_database
    File.readlines(File.join(Rails.root, 'lib', 'old_database_json', 'TipoServ.txt')).map do |line|
      service_type = find_or_create_by(name: line.strip)
      puts "Service type #{service_type.id}"
    end
  end
end
