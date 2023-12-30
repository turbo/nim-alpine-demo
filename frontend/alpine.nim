proc registerComponent*(name: cstring, component: pointer) 
  {.importjs: "Alpine.data(#, #)".}

proc bindElement*(binding: cstring, actions: pointer)
  {.importjs: "Alpine.bind(#, #)".}

proc env*[T](fn: (proc()), bar: T): (proc())
  {. importjs: "(#).bind(#)" .}

template this*(T: typedesc) =
  var this {.importc, nodecl, inject.}: T