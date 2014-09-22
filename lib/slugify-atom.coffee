module.exports =
  activate: ->
    atom.workspaceView.command "slugify:convert", => @convert()

  convert: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()

    slug = require 'slug'
    slugify = slug(selection.getText().toLowerCase())
    selection.insertText("#{slugify}")
