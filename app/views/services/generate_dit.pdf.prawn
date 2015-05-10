prawn_document() do |pdf|
  pdf.text "Hello World #{@service.to_param}"

  pdf.font "Helvetica",:size => 23
  pdf.text "Book: #{@service.nombre}", :size => 16, :style => :bold, :spacing => 4
  pdf.move_down 20
  pdf.text "Author: #{@service.baja}", :spacing => 16
end
