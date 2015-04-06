namespace :import_database do
  desc "Importa clientes"
  task :all => :environment do
    puts 'Importando Clients...'
    Client.import_database
    puts 'Finalizado Clients...'

    puts 'Importando Locales...'
    Place.import_database
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

  desc "Importa locales"
  task :places => :environment do
    Place.import_database
  end
end
