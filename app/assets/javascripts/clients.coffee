# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#geocomplete').geocomplete
    details: '.details'
    detailsAttribute: "data-geo"
    types: [
      'geocode'
      'establishment'
    ]
    map: "#my_map"
