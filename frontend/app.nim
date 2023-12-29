import std / [
  dom,
  strformat
]

import alpine

import components

proc dropdown(initialOpenState = false): DropDown =
  DropDown(
    init: (proc() =
      this DropDown

      this.timer = setInterval(
        (proc() = 
          this DropDown
          inc this.counter
          echo &"Counter is now at {this.counter}"
        ).env(this), # explicit binding
        1_000
      )
      
      echo "Component initialized and timer started"
    ),

    destroy: (proc() =
      this DropDown
      clearInterval(this.timer)
    ),

    open: initialOpenState,
    
    toggle: (proc(msg: cstring) =
      this DropDown
      this.open = not this.open
      echo &"Parameter passed to toggle: {msg}"
    )
  )

proc dropbutton(): DropButton =
  DropButton(
    `@click`: (proc() =
      this DropDown
      this.toggle("boo!")
    ),

    `disabled`: (proc(): bool =
      this DropDown
      return this.counter > 10
    )
  )

document.addEventListener("alpine:init", proc(e: Event) =
  registerComponent("dropdown", dropdown)
  bindElement("dropbutton", dropbutton)
)