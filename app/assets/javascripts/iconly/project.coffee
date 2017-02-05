class iconly.Project
  constructor: (@projectId, @rootUrl) ->
    self = this
    $(document)
      .on('click', '[data-action="add-to-project"]',      -> self._toggleInProject(this))
      .on('click', '[data-action="remove-from-project"]', -> self._toggleInProject(this, true))
      .on('click', '[data-action="share-package"]',   (e) -> self._sharePackage(e, this))

  _toggleInProject: (target, remove) ->
    target = $(target)
    iconId = target.data('id')
    if remove || target.hasClass('selected')
      target.removeClass 'selected'
      @_remove iconId
      if remove
        target.remove()
        $("[data-id='#{iconId}']").removeClass('selected')
      else
        el = $("[data-id='#{iconId}'][data-action='remove-from-project']")
        el.fadeOut -> el.remove()
      @_updateIconCount(-1)
    else
      target.addClass 'selected'
      @_add iconId
      @_updateIconCount(1)
      @_addToProjectIcons(target.html(), iconId)

  _add: (iconId) ->
    $.post @rootUrl,
      project_id: @projectId,
      icon_id:    iconId

  _remove: (iconId) ->
    $.post "#{@rootUrl}/#{iconId}",
      _method:    'DELETE'
      project_id: @projectId

  _updateIconCount: (factor) ->
    el    = $('#project-icons-count')
    count = parseInt(el.text())
    el.text Math.max(count + factor, 0)

  _addToProjectIcons: (svg, iconId)->
    markup = """
      <div class="btn btn-svg btn-sm float-left remove" title="Remove from project" data-action="remove-from-project" data-id="#{iconId}">
        #{svg}
        <i class="bg-danger text-white rm"></i>
      </div>
    """
    $(markup)
      .css(display: 'none')
      .appendTo($('#project-icons'))
      .fadeIn()

  _sharePackage: (e, target) ->
    e.preventDefault()
    url    = target.href
    target = $(target)
    shared = true
    if target.hasClass('shared')
      shared = false
      target.removeClass 'shared'
    else
      target.addClass 'shared'
    $.post url

  @start: (projectId, rootUrl) ->
    iconly.project ||= new iconly.Project(projectId, rootUrl)
