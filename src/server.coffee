fs       = require 'fs'
union    = require 'union'
ecstatic = require 'ecstatic'

lcase = (object) ->
  for own key, value of object
    delete object[key]
    object[key.toLowerCase()] = value
  return

@defaults =
  root : '.'

  index: true   # Redirect to index.html
  ext  : 'html' # Default implicit extension for served files
  dirs : true   # Show directory listings
  cache: 600    # Cache expiry in seconds

  headers:    {}
  middleware: []

@createServer = (options) =>
  (->
    union.createServer
      headers: @headers

      before: @middleware.concat [
        ecstatic @root,

          showDir   : @dirs
          autoIndex : @index
          cache     : @cache
          defaultExt: @ext
      ]
  ).call merge(@defaults, options)
