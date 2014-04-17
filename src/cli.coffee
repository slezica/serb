colors   = require 'colors'
server   = require '../lib/server.js'
optimist = require 'optimist'

require('idiom').export global

getopts = (usage, desc) ->
  optimist.usage usage
  argv = optimist.options(desc).argv

  if argv.h
    optimist.showHelp()
    process.exit()

  # Make options available as its aliases, to keep the code readable
  for arg of argv when arg of desc
    argv[desc[arg].alias] = argv[arg]

  argv


parse_headers = (headers) ->
  switch kindof headers
    when undefined then {}
    when String
      parse_headers [headers]
    when Array
      dict (header.split ':' for header in headers)


logging = (req, res, next) ->
  res.on 'end', ->
    method = req.method.bold.green
    target = req.url
    status = res.statusCode.toString().bold.red

    console.log method, target, status
  next()


@start = ->
  $ = getopts 'serb [options]',
    h:
      alias  : 'help'
      desc   : 'Display this message and exit'
      boolean: true
      default: false

    p:
      alias  : 'port'
      desc   : 'Port to bind to'
      default: 8000

    a:
      alias  : 'address'
      desc   : 'IP address to bind to'
      default: 'localhost'

    i:
      alias  : 'index'
      desc   : 'Automatically redirect to index.html'
      default: true
      boolean: true

    d:
      alias  : 'dirs'
      desc   : 'Show directory listings'
      default: false
      boolean: true

    e:
      alias  : 'ext'
      desc   : 'Assume given extension for URLs lacking one'
      default: false

    H:
      alias  : 'header'
      desc   : 'Set a "name:value" header (repeatable)'

  console.log 'Serving at', ($.address + ':' + $.port).green.bold + '...'

  server.createServer(

    root    : $._[0] || '.'
    index   : $.index
    ext     : $.ext
    dirs    : $.dirs
    headers : parse_headers $.header
    preware: [logging]

  ).listen $.port, $.address
