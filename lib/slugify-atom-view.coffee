{View} = require 'atom'

module.exports =
class SlugifyAtomView extends View
  @content: ->
    @div class: 'slugify-atom overlay from-top', =>
      @div "The SlugifyAtom package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "slugify-atom:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "SlugifyAtomView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
