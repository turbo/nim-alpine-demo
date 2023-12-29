import std / [
  strutils,
  strformat
]

import mummy, mummy/routers
import karax / [karaxdsl, vdom, vstyles]

const appJs = "./frontend/app.dist.js".readFile

proc rHead(): VNode =
  buildHtml head:
    meta(charset = "UTF-8")
    meta(
      name = "viewport", 
      content = @[
        "width=device-width", 
        "initial-scale=1", 
        "maximum-scale=1", 
        "user-scalable=0",
      ].join(", ")
    )
    meta("http-equiv" = "X-UA-Compatible", content = "ie=edge")
    script(
      src = "https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js",
      "defer" = ""
    )

proc rBody(): VNode =
  buildHtml body:
    tdiv("x-data" = "dropdown(true)"):
      button("x-bind" = "dropbutton"):
        text "Toggle Me"
      tdiv("x-show" = "open"):
        p: text "I'm inside!"

    verbatim &"""
      <script>
        {appJs}
      </script>
    """

proc home*(): string =
  let vnode = buildHtml html(lang = "en"):
    rHead()
    rBody()

  result = "<!DOCTYPE html>\n" & $vnode


proc indexHandler(request: Request) =
  var headers: HttpHeaders
  headers["Content-Type"] = "text/html; charset=utf-8"
  request.respond(200, headers, home())

var router: Router
router.get("/", indexHandler)

let server = newServer(router)
echo "Serving on http://localhost:8080"
server.serve(Port(8080))
