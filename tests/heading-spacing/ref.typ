#set page(paper: "a7")

#for i in range(1, 7) {
  heading(level: i)[H#i]
}

#set par(justify: true)
#set text(hyphenate: false)
#for i in range(1, 7) {
  heading(level: i)[J#i]
  heading(level: i)[J#i;LongLongLongWord LongLongLongWord]
}
