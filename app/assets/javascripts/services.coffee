# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#service_fecha_contrato,
     #service_fecha_de_baja,
     #service_fecha_ultimo_aumento')
    .datetimepicker format: 'DD/MM/YYYY'
  return
