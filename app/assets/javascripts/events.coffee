# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('input[name="event[when]"]').parent('.field').calendar({type: 'datetime', ampm: false})

  $('.event').on('click', () ->
    Turbolinks.visit($(this).data('link'))
  )

  if !!document.getElementById("eventmap")
    console.log("Eventmap is ready.")
    handler = Gmaps.build('Google')
    handler.buildMap({ provider: {
      zoom: 8, 
      center: new google.maps.LatLng(50.7812, 17.22812),
      disableDefaultUI: true
    }, internal: {id: 'eventmap'}}, () ->
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

  if !!document.getElementById("createmap") 
    console.log("Createmap is ready.")
    handler = Gmaps.build('Google')
    handler.buildMap({ provider: {
      zoom: 8,
      center: new google.maps.LatLng(50.7812, 17.22812),
      disableDefaultUI: true
    }, internal: {id: 'createmap'}}, () ->
      lastMarker = undefined
      google.maps.event.addListener handler.getMap(), 'click', (event) ->
        if typeof(lastMarker) != 'undefined'
          lastMarker.clear()
          handler.removeMarker(lastMarker)
        lastMarker = handler.addMarker({"lat": event.latLng.lat(), "lng": event.latLng.lng()})
        $("#event_where").val(event.latLng.lat() + "," + event.latLng.lng())
    )

  if !!document.getElementById("showthemap")
    console.log("Showthemap!")
    handler = Gmaps.build('Google')
    handler.buildMap({ provider: {
      zoom: 8, 
      center: new google.maps.LatLng(50.7812, 17.22812),
      disableDefaultUI: true
    }, internal: {id: 'showthemap'}}, () ->
      localpos = $("#showthemap").data('where').split(',')
      handler.bounds.extendWith(handler.addMarker({
        "lat": parseFloat(localpos[0]), 
        "lng": parseFloat(localpos[1])
      }))
    )

$(document).on('turbolinks:load', ready)