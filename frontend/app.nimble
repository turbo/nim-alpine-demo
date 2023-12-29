import strformat

bin           = @["app"]
backend       = "js"

requires "nim >= 2.0.0"

after build:
  exec &"terser --compress hoist_funs,keep_fargs=false,unsafe --mangle toplevel {bin[0]}.js -o {bin[0]}.dist.js"