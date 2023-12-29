proc registerComponent*(name: cstring, component: pointer) 
  {.importjs: "Alpine.data(#, #)".}

proc bindElement*(binding: cstring, actions: pointer)
  {.importjs: "Alpine.bind(#, #)".}

type Fn = proc()

proc env*[T](fn: Fn, bar: T): Fn
  {. importjs: "(#).bind(#)" .}

template this*(T: typedesc) =
  var this {.importc, nodecl, inject.}: T