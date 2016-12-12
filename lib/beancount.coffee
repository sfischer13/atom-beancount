{CompositeDisposable} = require 'atom'

module.exports = Beancount =
  subscriptions: null

  activate: (state) ->
    require('atom-package-deps').install('beancount')

  deactivate: ->

  serialize: ->
