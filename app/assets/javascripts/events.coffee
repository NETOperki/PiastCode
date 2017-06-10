# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('.event').on('click', () ->
    Turbolinks.visit($(this).data('link'))
  )

$(document).on('turbolinks:load', ready)