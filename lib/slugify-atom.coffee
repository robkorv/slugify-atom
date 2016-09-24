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
      slug = require 'slug'
      editor.mutateSelectedText(
        (selection) ->
          selectedText = selection.getText()
          slugify = slug(selectedText, {mode: 'rfc3986'})
          selection.insertText("#{slugify}", {select: true})
      )
