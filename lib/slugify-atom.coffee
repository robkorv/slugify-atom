SlugifyAtomView = require './slugify-atom-view'

module.exports =
  slugifyAtomView: null

  activate: (state) ->
    @slugifyAtomView = new SlugifyAtomView(state.slugifyAtomViewState)

  deactivate: ->
    @slugifyAtomView.destroy()

  serialize: ->
    slugifyAtomViewState: @slugifyAtomView.serialize()
