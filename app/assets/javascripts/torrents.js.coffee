$ loadTooltip = ->
  if $('[data-tooltip]').length
    $('[data-tooltip]').tipsy
      fade: true

$ lastUpated = ->
  if $('div.last_update').length
    $('div.last_update span').timeago()
