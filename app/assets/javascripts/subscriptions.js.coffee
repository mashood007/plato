
window.calculate_subscription = (id) ->
  number_of_users = $('#number_of_users').val()
  number_of_boards = $('#number_of_boards').val()
  $.ajax
    url: '/subscriptions/calculate.json'
    type: 'get'
    data:
      id: id
      number_of_users: number_of_users
      number_of_boards: number_of_boards
    success: (response) ->
      if response.title == 'error'
        $('.subscribe_button').hide()
        message = '<div class=\'alert alert-danger\'>' + response.message + '</div>'
      else
        $('.subscribe_button').show()
        message = '<div class=\'alert alert-success\'>' + response.message + '</div>'
      $('.subscription_messages').html message



window.select_subsciption_type = (subscription_id) ->
  $('#subscribe_subscription_id').val subscription_id
  $('.subscription_type').removeClass 'border_red'
  $('#subscription_type_' + subscription_id).addClass 'border_red'
  $.ajax
    url: '/subscriptions/details'
    type: 'get'
    data: id: subscription_id
  calculate_subscription subscription_id
  