#import "@preview/tidy:0.4.3"

#import "/src/lib.typ" as libra

#let docs = tidy.parse-module(
  read("/src/lib.typ"),
  name: "libra",
  scope: (libra: libra),
  preamble: "#import libra: *\n",
)

#tidy.show-module(docs, show-outline: false, style: tidy.styles.minimal)
