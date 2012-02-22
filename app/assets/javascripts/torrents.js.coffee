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
            $(tr).removeClass('inactive_format')
          else
            $(tr).addClass('inactive_format')
      else
        $('table.torrents_list > tbody > tr').removeClass('inactive_format')

$ sortRatings = ->
  if $('#torrent_sort').length
    table = $('table.torrents_list > tbody > tr')
    $('#torrent_sort').change ->
      switch this.value
        when 'downloads'
          table.tsort('td.position')
        when 'name'
          table.tsort('td.movie h2')
        when 'format'
          table.tsort('td.format')
        when 'rating'
          table.tsort('td.rating span',{ order: 'desc' })

$ searchMovie = ->
  if $('input#search').length
    $('input#search').quicksearch 'table tbody tr',
      selector: 'td.movie'

$ resetFilters = ->
  if $('a#reset_filters').length
    $('a#reset_filters').click ->
      $('form.filters')[0].reset()
      $('table.torrents_list > tbody > tr').tsort('td.position').removeClass('inactive_format').show()
      false
