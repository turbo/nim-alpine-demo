srcDir        = "backend"
bin           = @["server"]
backend       = "c"

requires "nim >= 2.0.0"

requires "karax#head"
requires "mummy >= 0.3.5"

before build:
  withDir "frontend":
    exec "nimble build"