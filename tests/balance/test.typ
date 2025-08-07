#import "/src/lib.typ": balance

#for i in range(5, 100, step: 7) {
  let t = lorem(i)
  let body = table(
    columns: (4cm, 1fr),
    [Regular], t,
    [Balanced], balance(t),
    [Hyphenated],
    {
      set text(hyphenate: true)
      t
    },

    [Balanced Hyphenated],
    {
      set text(hyphenate: true)
      balance(t)
    },

    [Justified],
    {
      set par(justify: true)
      t
    },

    [Balanced Justified],
    {
      set par(justify: true)
      balance(t)
    },
  )
  page(height: auto, width: 20cm, margin: 1mm, body)
}
