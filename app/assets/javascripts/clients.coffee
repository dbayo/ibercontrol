# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

start_bindings = ->
  $('#geocomplete').geocomplete
    details: '.details'
    detailsAttribute: "data-geo"
    types: [
      'geocode'
      'establishment'
    ]
    map: "#my_map"
  return

$(document).ready start_bindings
$(document).on 'page:load', start_bindings
window.Loaded = true
