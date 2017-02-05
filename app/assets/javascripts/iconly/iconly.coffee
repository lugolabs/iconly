window.iconly =
  start: ->
    return if @_started
    $(document).tooltip(selector: '[data-toggle="iconly-tooltip"]')
    @_started = true
