# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#service_fecha_contrato, #service_fecha_inicio, #service_fecha_de_baja, #service_fecha_ultimo_aumento').datetimepicker(format: 'DD/MM/YYYY', defaultDate: '')

  $('#service_fecha_inicio').on 'dp.hide', (e) ->
    get_date_service_fecha_inicio()
    return

  $('#facturas_meses').change ->
    get_date_service_fecha_inicio()
    value = parseInt($(this).val())
    current = parseInt($('input.checkbox_application:checked:visible:first').attr('month'))

    i = 0
    while i < (12 / value) - 1
      current = current + value
      month_to_check = current % 12
      if month_to_check == 0
        month_to_check = 12

      $(".checkbox_application[month=#{month_to_check}]").closest('label').click()
      i++
    return

  $('.buttons-application .btn').on 'click', ->
    toggle_months
    return

  toggle_months = () ->
    if $(this).hasClass('active')
      check_months($(this))
    else
      uncheck_months($(this))

  check_months = (el) ->
    el.find('input[type=hidden]').attr 'value', 0
    el.find('input[type=checkbox]').removeAttr 'checked'

  uncheck_months = (el) ->
    el.find('input[type=hidden]').attr 'value', 1
    el.find('input[type=checkbox]').attr 'checked', 'checked'

  get_date_service_fecha_inicio = ->
    from = $('#service_fecha_inicio').val().split('/');
    f = new Date(from[2], from[1] - 1, from[0]);
    currMonth = f.getMonth() + 1
    $('.buttons-application label.active').click()
    $(".checkbox_application[month=#{currMonth}]").closest('label').click()
  return

$(document).ready(ready);
$(document).on('page:load', ready);
