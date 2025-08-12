#import "/src/lib.typ": balance

#set page(height: auto, margin: 5mm, fill: none)

// style thumbnail for light and dark theme
#let theme = sys.inputs.at("theme", default: "light")
#let fg-color = if theme == "dark" { white } else { black }
#set text(fg-color)
#set table(stroke: fg-color)

#set text(22pt)
#set par(justify: true)

#show table.cell: it => {
  if it.y == 1 {
    it = {
      set text(size: 16pt)
      it
    }
  } else if it.y == 2 {
    it = {
      set text(size: 14pt)
      it
    }
  }
  it
}
#table(
  columns: 2,
  align: center + horizon,
  inset: 0.5em,
  table.header([*unbalanced*], [*balanced*]),
  lorem(8), balance(lorem(8)),
  lorem(27), balance(lorem(27)),
)
