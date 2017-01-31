class app.Scroller
  constructor: (options = {}) ->
    @_topSpacing = options.topSpacing
    @_root       = $('html body')
    that         = this
    $('[data-scroll-to]').on 'click', (e) -> that._onScroll(e, this)

  _onScroll: (e, link) ->
    el = $(link.hash)

    return unless el.length
    e.preventDefault()

    @_root.animate({
      scrollTop: el.offset().top - @_topSpacing
    }, 200)

