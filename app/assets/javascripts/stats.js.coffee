$(document).ready ->
  install_handler = () ->
    $('.StatsController td.sortable').bind 'ajax:success', update

  update = (evt, data, status, xhr) ->
    $('.content').html xhr.responseText
    install_handler()


  install_handler()
  $('a.tip').tooltip()
