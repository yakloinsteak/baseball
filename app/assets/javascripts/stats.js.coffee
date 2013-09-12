$(document).ready ->
  $('td.sortable').bind 'ajax:success', (evt, data, status, xhr) ->
    alert data
