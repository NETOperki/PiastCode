# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.event').on('click', () ->
    Turbolinks.visit($(this).data('link'))
  )

  handler = Gmaps.build('Google')
  handler.buildMap({ provider: {zoom: 8, center: new google.maps.LatLng(50.7812, 17.22812)}, internal: {id: 'eventmap'}}, () ->
    markers = []
    $(".card.event").each(() -> 
      str_poses = $(this).data('where').split(',')
      markers.push({
        "lat": parseFloat(str_poses[0])
        "lng": parseFloat(str_poses[1])
      })
    )
    handler.bounds.extendWith(handler.addMarkers(markers))
  )

$(document).on('turbolinks:load', ready)