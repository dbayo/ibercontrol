namespace :import_database do
  desc "Importa clientes"
  task :all => :environment do
    DatabaseCleaner.clean

    Plague.import_database
    Activity.import_database
    Employee.import_database
    ServiceType.import_database
    Product.import_database

    puts 'Importando Clients...'
    Client.import_database
    puts 'Finalizado Clients...'

    puts 'Importando Locales...'
    Place.import_database
    puts 'Finalizado Locales...'

    puts 'Importando Locales...'
    Service.import_database
    puts 'Finalizado Locales...'

    puts 'Importando Facturas...'
    Bill.import_database
    puts 'Finalizado Facturas...'

    puts 'Base de datos importada!'
  end

  desc "Importa clientes"
  task :clients => :environment do
    Client.import_database
  end

  desc "Importa facturas"
  task :bills => :environment do
    Bill.import_database
  end

  desc "Importa Fecha facturas"
  task :bill_dates => :environment do
    BillDate.delete_all
    BillDate.import_database
  end

  desc "Importa locales"
  task :places => :environment do
    Place.import_database
  end

  desc "Importa locales"
  task :services => :environment do
    # Service.delete_all
    Service.import_database
  end

  desc "Importa Producto"
  task :products => :environment do
    Product.import_database
  end

  desc "Importa Plague"
  task :plagues => :environment do
    Plague.import_database
  end

  desc "Importa Activity"
  task :activities => :environment do
    Activity.import_database
  end

  desc "Importa Employee"
  task :employees => :environment do
    Employee.import_database
  end

  desc "Importa Tipo de servicio"
  task :service_types => :environment do
    ServiceType.import_database
  end
end
