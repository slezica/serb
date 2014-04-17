# serb

The `serb` command-line utility will serve the current working directory over HTTP, much like python's `SimpleHTTPServer`.

It is, however, a lot more powerful and a lot more flexible.

# installation

    npm install -g serb


# basic usage

    ~$ serb [root]

That's it. Your `cwd` or `root` is at localhost:8000.


# advanced usage
    serb [options]

    Options:
      -h, --help     Display this message and exit                [boolean]  [default: false]
      -p, --port     Port to bind to                              [default: 8000]
      -a, --address  IP address to bind to                        [default: "0.0.0.0"]
      -i, --index    Automatically redirect to index.html         [boolean]  [default: true]
      -d, --dirs     Show directory listings                      [boolean]  [default: false]
      -e, --ext      Assume given extension for URLs lacking one  [default: false]
      -H, --header   Set a "name:value" header (repeatable)
