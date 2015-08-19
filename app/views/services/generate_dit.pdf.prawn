require "prawn/measurement_extensions"

prawn_document() do |pdf|
  # Datos del cliente
  x = 2.mm
  y = 245.mm

  pdf.stroke_axis
  pdf.draw_text @client.nombre_fiscal, :at => [x + 35.mm, y]
  pdf.draw_text @client.to_param, :at => [x + 155.mm, y]

  pdf.draw_text @client.direccion_fiscal, :at => [x + 20.mm, y - 5.mm]

  pdf.draw_text @client.poblacion_fiscal, :at => [x + 22.mm, y - 10.mm]
  pdf.draw_text @client.codigo_postal, :at => [x + 92.mm, y - 10.mm]
  pdf.draw_text @client.provincia_fiscal, :at => [x + 138.mm, y - 10.mm]

  pdf.draw_text @client.preguntar_por, :at => [x + 15.mm, y - 15.mm]
  pdf.draw_text @client.telefono_fiscal, :at => [x + 102.mm, y - 15.mm]

  # Datos del servicio
  y = 210.mm

  pdf.draw_text @service.nombre, :at => [x + 30.mm, y]
  pdf.draw_text @service.nombre, :at => [x + 128.mm, y]
  pdf.draw_text @service.to_param, :at => [x + 170.mm, y]

  pdf.draw_text @service.plagues.pluck(:name).join(', '), :at => [x + 30.mm, y - 5.mm]

  # pdf.draw_text @service.poblacion_fiscal, :at => [x + 32.mm, y - 10.mm]
end

# pdf.font "Helvetica",:size => 23
# pdf.text "Book: #{@service.nombre}", :size => 16, :style => :bold, :spacing => 4
# pdf.move_down 20
# pdf.text "Author: #{@service.baja}", :spacing => 16
