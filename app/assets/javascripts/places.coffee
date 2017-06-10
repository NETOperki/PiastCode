# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

startReady=->
	handler = Gmaps.build('Google')
	handler.buildMap({ provider: {}, internal: {id: 'map'}}, ()->
	  markers = handler.addMarkers([
	    {  
	      "lat": 51,
	      "lng": 17,
	      "infowindow": "hello!"
	    }
	  ])
	  handler.bounds.extendWith(markers)
	  handler.fitMapToBounds()
	)


    
$(document).on('turbolinks:load', startReady)
       
  
