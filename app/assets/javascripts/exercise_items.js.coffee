# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $('form.new_exercise_item').length
    $('#exercise_item_exercise_id').on 'change', () ->
      $weight_el = $('[data-scope=weight]')
      if $(@).find("option:selected").data('need-weight')
        $weight_el.show()
      else
        $weight_el.hide()
    $('#exercise_item_exercise_id').change()