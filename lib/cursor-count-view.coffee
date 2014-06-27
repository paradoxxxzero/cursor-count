{View} = require 'atom'

module.exports =
class CursorCountView extends View
  @content: ->
    @div class: 'cursor-count inline-block'

  initialize: (@statusBar) ->
    @subscribe @statusBar, 'active-buffer-changed', @update
    @subscribe atom.workspaceView, 'selection:changed', @update

  destroy: ->
    @remove()

  afterAttach: ->
    @update()

  update: =>
    editor = atom.workspace.getActiveEditor()
    len = editor.getCursors().length
    if len > 1
      @text("#{len}").show()
    else
      @hide()
