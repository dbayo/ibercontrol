class Activity
  include Mongoid::Document
  field :name, type: String

  belongs_to :place

  def self.import_database
    File.readlines(File.join(Rails.root, 'lib', 'old_database_json', 'Activi.txt')).map do |line|
      activity = find_or_create_by(name: line.force_encoding('iso-8859-1').encode('utf-8').strip)
      puts "Activity #{activity.id}"
    end
  end
end
