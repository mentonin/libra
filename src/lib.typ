/// Balances text, useful for headings, captions, centered text, or others.

#let _normalized-size(body, width: auto) = {
  let (height, width) = measure(
    {
      set text(top-edge: 1000pt, bottom-edge: 0pt, baseline: 0pt)
      body
    },
    width: width,
  )
  let lead = par.leading.to-absolute()
  return (
    lines: (height + lead) / (1000pt + lead),
    width: width,
  )
}

/// Balances lines of text while keeping the minimum amount of lines possible.
/// Works by shrinking the width of the text until it can't be shrunk anymore.
///
/// Unbalanced text:
/// #example(```
///   #rect(width: 25em, lorem(10))
/// ```)
///
/// Balanced text:
/// #example(```
///   #rect(width: 25em, balance(lorem(10)))
/// ```)
///
/// -> content
#let balance(
  /// The text to balance. -> content
  body,
  /// Maximum number of iterations to perform. -> int
  max-iterations: 20,
  /// The precision to which to balance. -> length
  precision: 0.1em,
) = context layout(size => {
  let precision = precision.to-absolute()

  let initial-size = _normalized-size(body, width: size.width)
  let initial-lines = initial-size.lines

  let high = initial-size.width
  let low = high * (1 - (1 / initial-lines)) / 2

  let extra-lines = initial-lines
  for i in range(0, max-iterations) {
    let candidate = high - (high - low) / (extra-lines + 1)
    let (lines, width) = _normalized-size(width: candidate, body)
    if lines > initial-lines {
      low = candidate
      extra-lines = lines - initial-lines
    } else {
      high = width
      if _normalized-size(width: high - precision, body).lines > initial-lines {
        break
      }
      high -= precision
    }
    if high - low < precision {
      break
    }
  }

  block(width: high, body)
})
