{CompositeDisposable} = require 'atom'

class CursorCountView extends HTMLElement
  initialize: ->
    @classList.add('inline-block')
    @createEventHandlers()
    @update()

  destroy: ->
    @disposables?.dispose()
    @disposables = null

  update: (editor = atom.workspace.getActiveTextEditor()) ->
    len = editor?.getCursors().length
    if len > 1
      @textContent = "|#{len}"
      @style.display = 'inline-block'
    else
      @textContent = ''
      @style.display = 'none'

  createEventHandlers: ->
    @disposables = new CompositeDisposable
    @createActivePaneHandler()

  createActivePaneHandler: ->
    @disposables.add atom.workspace.onDidChangeActivePaneItem =>
      @update()

module.exports = document.registerElement('status-bar-cursor-count',
                                          prototype: CursorCountView.prototype,
                                          extends: 'div')
