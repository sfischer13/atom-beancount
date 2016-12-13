{CompositeDisposable} = require 'atom'

moment = require 'moment'

module.exports = Beancount =
  subscriptions: null

  activate: (state) ->
    require('atom-package-deps').install('beancount')
      .then ->
          console.log("Installed beancount dependencies.")
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-text-editor', 'beancount:today': => @today()

  deactivate: ->
    @subscriptions.dispose()

  serialize: ->

  isBeancountScope: (editor) ->
    if editor?
      return editor.getGrammar().scopeName is 'source.beancount'
    return false

  today: ->
    editor = atom.workspace.getActiveTextEditor()

    if not @isBeancountScope editor
      atom.notifications.addInfo('Not a beancount file.')
    else
      editor.insertText(moment().format('YYYY-MM-DD'))
