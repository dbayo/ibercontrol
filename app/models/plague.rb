class Plague
  include Mongoid::Document
  field :name, type: String
  field :plagues, type: Array

  has_and_belongs_to_many :places

  def self.import_database

    File.readlines(File.join(Rails.root, 'lib', 'old_database_json', 'Plaga.txt')).each do |line|
      plague = find_or_create_by(name: line.strip)
      puts "Plague #{plague.name}"
    end
  end

  def self.parser_plague_type(plague)
  	case plague
    when "Blatta Oriental"
      ["Blatta Orientalis"]
  	when "Blatta Oriental y Periplaneta Americana"
  		["Blatta Orientalis", "Periplaneta Americana"]
  	when "Blattella Germanica y Oriental"
  		["Blattella Germanica", "Blatta Oriental"]
    when "Hormigas,Blattellas Oriental y Germánicas"
      ["Hormigas", "Blatta Orientalis", "Blattella Germanica"]
    when "Mus Musculus y Rattus Norvegicus"
      ["Mus Musculus", "Rattus Norvegicus"]
  	else
  		[plague]
    end
  end

end
