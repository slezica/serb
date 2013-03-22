# serve

The `serve` command-line utility will serve the current working directory over HTTP, much like python's `SimpleHTTPServer`.

It is, however, a lot more powerful and a lot more flexible.

# usage
    serve [options]

    Options:
      -h, --help     Display this message and exit            [false]
      -p, --port     Port to bind to                          [8000]
      -a, --address  IP address to bind to                    [0.0.0.0]
      -i, --index    Automatically redirect to index.html     [true]
      -d, --dirs     Show directory listings                  [false]
      -e, --ext      Implicit extension for URLs lacking one  [false]
