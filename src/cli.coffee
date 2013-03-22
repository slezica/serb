colors   = require 'colors'
optimist = require 'optimist'
server   = require '../lib/server.js'

optimist.usage 'serve [options]'
argv = optimist.options(
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
).argv

if argv.h
  console.log optimist.help()
  process.exit()

server.createServer(
  index: argv.i
  ext  : argv.e
  dirs : argv.d
).listen argv.p, argv.a
