CursorCountView = require './cursor-count-view'

module.exports =
  activate: ->
    if atom.workspaceView.statusBar
      @ccv = new CursorCountView(atom.workspaceView.statusBar)
      atom.workspaceView.statusBar.find('.cursor-position').after(@ccv)
    else
      atom.packages.once 'activated', ->
        @ccv = new CursorCountView(atom.workspaceView.statusBar)
        atom.workspaceView.statusBar.find('.cursor-position').after(@ccv)

  deactivate: ->
    @ccv?.destroy()
    @ccv = null
