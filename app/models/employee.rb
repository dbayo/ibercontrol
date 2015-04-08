class Employee
  include Mongoid::Document
  field :name, type: String

  has_and_belongs_to_many :place

  def self.import_database
    File.readlines(File.join(Rails.root, 'lib', 'old_database_json', 'Empleados.txt')).map do |line|
      employee = find_or_create_by(name: line.strip)
      puts "Employee #{employee.id}"
    end
  end
end
