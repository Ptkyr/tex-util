#import "@preview/xarrow:0.3.1": xarrow
#let rrarrow(r) = xarrow(width: 6em, r)

#let vv(x) = math.accent(x, math.arrow, size: 107%)

// Operators
// https://typst.app/docs/reference/math/op/
#let span = math.op("Span")
#let codim = math.op("codim", limits: false)
#let nllty = math.op("nullity")
#let rref = math.op("RREF")
#let col = math.op("Col")
#let row = math.op("Row")
#let null = math.op("Null")
#let diag = math.op("diag")
#let range = math.op("Range")
// Predefined, but is lowercase
#let ker = math.op("Ker")
#let adj = math.op("adj")
#let proj = math.op("proj")
#let perpop = math.op("perp")

// Optimization
#let cvhull = math.op("cvhull")
#let slack = math.op("slack")

// Real analysis
#let diam = math.op("diam")
#let dist = math.op("dist")

// Group theory
#let ord = math.op("ord")
#let lcm = math.op("lcm")
#let char = math.op("char")
#let perm = math.op("Perm")

#let hom = math.op("Hom")
#let iso = math.op("Iso")
#let end = math.op("End")
#let aut = math.op("Aut")
#let nsg = math.underline(text(spacing: 0pt, size: 11pt, math.triangle.l.stroked.small))
