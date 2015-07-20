{CompositeDisposable} = require 'atom'
module.exports = SlugifyAtom =
  subscriptions: null
  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace', 'slugify:convert': => @convert()

  deactivate: ->
    @subscriptions.dispose()

  convert: ->
    if editor = atom.workspace.getActiveTextEditor()
      selection = editor.getSelectedText()

      slug = require 'slug'
      slugify = slug(selection, {mode: 'rfc3986'})
      editor.insertText("#{slugify}")
