fs       = require 'fs'
union    = require 'union'
ecstatic = require 'ecstatic'

@defaults =
  root : '.'

  index: true   # Redirect to index.html
  ext  : 'html' # Default implicit extension for served files
  dirs : true   # Show directory listings
  cache: 600    # Cache expiry in seconds

  headers : {}
  preware : []
  postware: []

@createServer = (options) =>
  (->
    union.createServer
      headers: @headers

      before: @preware.concat([
        ecstatic @root,

          showDir   : @dirs
          autoIndex : @index
          cache     : @cache
          defaultExt: @ext

      ]).concat @postware
  ).call merge(@defaults, options)
