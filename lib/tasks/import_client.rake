namespace :import_client do
  desc "Importa clientes"
  task :client => :environment do
    records = JSON.parse(File.read(File.join(Rails.root, 'lib', 'old_database_json', 'Cliente.json')))
    records.each do |record|
      client = replace_fields(record)
      Client.create client
    end
  end

  def replace_fields(record)
    new_record = {}
    new_record["fax"] = record.delete "FAX"
    new_record["provincia_fiscal"] = record.delete "PROVIN_FIS"
    new_record["email"] = record.delete "EMail"
    new_record["fecha_contrato"] = record.delete "FECHA_CONT"
    new_record["fecha_de_baja"] = record.delete "FECHA_BAJA"
    # new_record[""] = record.delete "REPRESEN"
    new_record["telefono_fiscal"] = record.delete "TELF_FIS"
    # new_record[""] = record.delete "Auto"
    new_record["codigo_postal"] = record.delete "DIST_P_FIS"
    new_record["agencia"] = record.delete "AGENCIA"
    new_record["direccion_fiscal"] = record.delete "DIREC_FIS"
    new_record["ccc"] = record.delete "CCC"
    new_record["preguntar_por"] = record.delete "PREGUN_FIS"
    new_record["tipo_de_servicio"] = record.delete "TIPOSERV"
    new_record["nombre_fiscal"] = record.delete "NOMBRE_FIS"
    new_record["observaciones"] = record.delete "OBSERVFIS"
    new_record["poblacion_fiscal"] = record.delete "POBLAC_FIS"
    new_record["web"] = record.delete "Web"
    new_record["banco"] = record.delete "BANCO"
    new_record["nif"] = record.delete "NIF"
    new_record["fecha_ultimo_aumento"] = record.delete "Fecha_Ult_Aum"
    new_record["extras"] = record

    new_record
  end
end
