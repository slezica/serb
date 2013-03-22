colors  = require 'colors'
server  = require '../lib/server.js'
optimist = require 'optimist'

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


$ = getopts 'serve [options]',
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
    default: '0.0.0.0'

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
    desc   : 'Implicit extension for URLs lacking one'
    default: false

server.createServer(
  index: $.index
  ext  : $.ext
  dirs : $.dirs
).listen $.port, $.address
