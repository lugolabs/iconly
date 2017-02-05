class iconly.Package
  constructor: (@fileInputSelector, @messageSelector) ->
    $(document).on 'change', @fileInputSelector, (e) => @_addFiles(e)

  _addFiles: (e) ->
    @_showMessage $.map(e.target.files, (f) => @_badge(f.name))

  _showMessage: (fileNames) ->
    $(@messageSelector).html """
      <h4 class="mt-0">#{fileNames.length} #{@_pluralize(fileNames.length, 'file')} selected</h4>
      #{fileNames.join('')}
    """

  _badge: (fileName) ->
    """
      <span class="badge badge-pale">#{fileName}</span>
    """

  _pluralize: (count, text) ->
    message = text
    message += 's' if count != 1
    message

  @start: (fileInputSelector, messageSelector) ->
    iconly.package ||= new iconly.Package(fileInputSelector, messageSelector)
