fs       = require 'fs'
union    = require 'union'
ecstatic = require 'ecstatic'

exports.defaults = DEFAULTS =
  root : '.'

  index: true   # Redirect to index.html
  ext  : 'html' # Default implicit extension for served files
  dirs : true   # Show directory listings
  cache: 600    # Cache expiry in seconds

  headers:    {}
  middleware: []

merge = (objects...) ->
  result = {}
  for object in objects
    result[key] = object[key] for own key of object
  result

take = (context, f) -> f.call context

exports.createServer = (options) ->
  take merge(DEFAULTS, options), ->
    union.createServer
      headers: @headers

      before: @middleware.concat [
        ecstatic @root,

          showDir   : @dirs
          autoIndex : @index
          cache     : @cache
          defaultExt: @ext

      ]
