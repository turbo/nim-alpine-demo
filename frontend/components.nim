import std / [
  dom
]

type
  DropDown* = ref object
    init*: proc()
    destroy*: proc()

    open*: bool
    toggle*: proc(msg: cstring)
    timer*: Interval
    counter*: cint
    
  DropButton* = ref object
    `type`* = "button"
    `@click`* {.exportc: "['$1']".}: proc()
    `disabled`* {.exportc: "[':$1']".}: proc(): bool
