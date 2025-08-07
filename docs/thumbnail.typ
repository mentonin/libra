#import "/src/lib.typ": balance

#set page(height: auto, margin: 5mm, fill: none)

// style thumbnail for light and dark theme
#let theme = sys.inputs.at("theme", default: "light")
#let fg-color = if theme == "dark" { white } else { black }
#set text(fg-color)
#set table(stroke: fg-color)
#set text(22pt)
#set align(center + horizon)

#let row(t) = (t, balance(t))
#table(
  columns: 2,
  align: center + horizon,
  inset: 0.5em,
  [*unbalanced*], [*balanced*],
  ..row(text(size: 12pt, lorem(8))),
  ..row(align(left, text(size: 14pt, par(justify: true, lorem(27))))),
)
