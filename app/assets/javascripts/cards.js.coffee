window.card_tasks = (id) ->
  $.ajax
    url: '/cards/' + id + '/tasks'
    type: 'get'

window.close_modal = ->
  $('.tasks_modal').hide()

window.children = (parent) ->
  $.ajax
    url: 'cards/get_children'
    type: 'get'
    data: parent: parent