# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('input[data-role=money]').autoNumeric('init');

  # Added for fixing the ENTER inside the field problem: