class Activity
  include Mongoid::Document
  field :name, type: String

  has_many :places

  def self.import_database
    File.readlines(File.join(Rails.root, 'lib', 'old_database_json', 'Activi.txt')).map do |line|
      activity = find_or_create_by(name: line.strip)
      puts "Activity #{activity.id}"
    end
  end

  def self.parser_activity_type(activity)
    case activity
    when "Via publica"
      "Vía Pública"
    when "PANADERÍA"
      "Panadería"
    else
      activity.capitalize
    end
  end
end
