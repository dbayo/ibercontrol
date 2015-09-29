# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#service_fecha_contrato, #service_fecha_de_baja, #service_fecha_ultimo_aumento').
    datetimepicker format: 'DD/MM/YYYY'

  $('#service_fecha_contrato').on 'dp.hide', (e) ->
    currMonth = new Date(e.date).getMonth() + 1
    $(".checkbox_application").prop('checked', false);
    $(".checkbox_application[month=#{currMonth}]").prop('checked', true);
    return

  $('#facturas_meses').change ->
    value = parseInt($(this).val())
    current = parseInt($('input.checkbox_application:checked:visible:first').attr('month'))

    i = 0
    while i < (12 / value) - 1
      current = current + value
      month_to_check = current % 12
      if month_to_check == 0
        month_to_check = 12

      $(".checkbox_application[month=#{month_to_check}]").prop('checked', true);
      i++
    return

  return
