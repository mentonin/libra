#import "/src/lib.typ": balance
#set page(width: 30em, height: auto, margin: 1em)

#let test-cases = {
  let test-case(name: none, hook: none) = [

    This is just some text that, just before linebreak, changes to #hook[#name: #lorem(13)]

  ]
  par[This is just some text that, just before linebreak, changes to `raw: some text that keeps on going because I don't know how to use lorem in verbatim`]
  test-case(hook: text.with(font: "DejaVu Sans Mono"), name: [mono])
  test-case(hook: emph, name: [italics])
  test-case(hook: strong, name: [bold])
  test-case(hook: text.with(size: 0.8em), name: [small font])
  test-case(hook: text.with(size: 1.2em), name: [big font])
}

#page({
  `control`
  test-cases
})

#page({
  `balanced`
  show par: balance
  test-cases
})

#page({
  `balanced and justified`
  show par: balance
  set par(justify: true)
  test-cases
})
