$ loadTooltip = ->
  if $('[data-tooltip]').length
    $('[data-tooltip]').tipsy
      fade: true

$ lastUpated = ->
  if $('div.last_update').length
    $('div.last_update span').timeago()

$ filterReleseFormats = ->
  if $('#torrent_release_format').length
    $('#torrent_release_format').change ->
      if this.value
        for tr in $('table.torrents_list > tbody > tr')
          if $(tr).attr('data-movie-format') == this.value
            $(tr).show()
          else
            $(tr).hide()
      else
        $('table.torrents_list > tbody > tr').show()
