$(document).ready ->
  install_handler = () ->
    $('.StatsController td.sortable').bind 'ajax:success', update

  install_tooltips = () ->
    $('a.tip').tooltip()

  update = (evt, data, status, xhr) ->
    $('.content').html xhr.responseText
    install_handler()
    install_tooltips()

  install_handler()
  install_tooltips()
