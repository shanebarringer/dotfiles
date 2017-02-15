# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"

{BufferedProcess, CompositeDisposable} = require 'atom'

module.exports =
  config:
    executablePath:
      type: 'string'
      title: 'Some Executable Path'
      default: '/usr/local/bin/linter'
  activate: ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.config.observe 'linter-example.executablePath',
      (executablePath) =>
        @executablePath = executablePath
  deactivate: ->
    @subscriptions.dispose()
  provideLinter: ->
    provider =
      grammarScopes: ['source.js', 'source.ruby']
      scope: 'file' # or 'project'
      lintOnFly: false # must be false for scope: 'project'
      lint: (textEditor) =>
        return new Promise (resolve, reject) =>
          filePath = textEditor.getPath()
          json = []
          process = new BufferedProcess
            command: @executablePath
            args: [filePath, '--json']
            stdout: (data) ->
              json.push data
            exit: (code) ->
              return resolve [] unless code is 0
              info = try JSON.parse json.join('\n')
              return resolve [] unless info?
              return resolve [] if info.passed
              resolve info.errors.map (error) ->
                type: error.type,
                text: error.message,
                filePath: error.file or filePath,
                range: [
                  # Atom expects ranges to be 0-based
                  [error.lineStart - 1, error.charStart - 1],
                  [error.lineEnd - 1, error.charEnd]
                ]

          process.onWillThrowError ({error,handle}) ->
            atom.notifications.addError "Failed to run #{@executablePath}",
              detail: "#{error.message}"
              dismissable: true
            handle()
            resolve []
