#let meta(left, right: "Eric Wang (e224wang)", doc) = {
    set page(
        paper: "us-letter",
        header: [
            #left
            #h(1fr)
            #right
            #line(start: (0pt, -8pt), length: 100%, stroke: 0.1pt)
        ],
        header-ascent: 25%,
        numbering: "1",
    )

    set heading(numbering: "1.1")
    show heading: set block(above: 1.4em, below: 1em)

    set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
    set par(spacing: 1em)

    set enum(numbering: "(a)", spacing: 1em, tight: false)
    set text(10pt, font: "New Computer Modern")

    set table.hline(stroke: 0.1pt)
    set table.vline(stroke: 0.1pt)
    set figure.caption(position: top)

    set math.mat(delim: "[")
    set math.vec(delim: "[")
    set figure.caption(position: bottom)

    show link: underline
    show link: set text(blue)
    
    show: doc

    // Don't know why but this has to be after the show
    set enum(numbering: "(a).(i)")
}

#let question-counter = counter("question")
#let question(body) = {
  question-counter.step()
  strong(context { question-counter.display("Q1.") })
  parbreak()
  body
  pagebreak(weak: true)
}

#let enum1(body) = {
  set enum(numbering: "(1)")
  body
}

#let tfae(n, body) = {
  set enum(numbering: x => {
    let y = calc.rem(x + 1, n)
    if y == 0 {
      y = n
    }
    [$(#x ==> #y)$]
  })
  body
}

#let caseana(body) = {
  set enum(numbering: x => [#emph([Case #x.])])
  body 
}

#let tableau(..args) = {
    table(
        stroke: (x, y) => (
            left: if x > 0 { 0.1pt },
            top: if y > 0 { 0.1pt },
        ),
        ..args
    )
}

#let tchart(left, right, ..content) = {
    table(
        columns: 2,
        stroke: none,
        table.vline(x: 1),
        table.header([*#left*], [*#right*]),
        table.hline(),
        ..content
    )
}

#let pplist(x) = x.fold([], (acc, item) => {
  if acc == [] [
    #item
  ] else [
    #acc, #item
  ]
})

#let sgn = math.op("sgn")
#let imp = math.arrow.r.double.long
#let impby = math.arrow.l.double.long
#let iff = math.arrow.l.r.double.long
#let cup = math.union
#let scup = math.union.sq
#let cap = math.sect
#let xx = math.times
#let pm = math.plus.minus
#let cdot = math.dot.c
#let oplus = math.plus.circle
#let ominus = math.minus.circle
#let otimes = math.times.circle
#let odiv = math.div.circle
#let circ = math.circle.stroked.small

#let im = math.op("Im")
#let ang(x) = $lr(angle.l #x angle.r)$

#let angles(n, offset: 0) = array.range(0, n).map(a => a / n * calc.tau + offset)
#let roonits(r, n, offset: 0) = angles(n, offset: offset).map(a => (r * calc.cos(a), r * calc.sin(a)))

#let shift(arr) = {
  let a = arr.pop()
  arr.insert(0, a)
  arr
}
#let shiftn(n, arr) = {
  for _ in array.range(n) {
    arr = shift(arr)
  }
  arr
}

// https://typst.app/project/pkaUy4f2m0mgmNQAoOMkBS
#let foldl1(a, f) = a.slice(1).fold(a.first(), f)
#let concat(a) = foldl1(a, (acc, x) => acc + x)
#let nonumber(e) = math.equation(block: true, numbering: none, e)

#let tagged_eq(es, numberlast: false) = if es.has("children") {
  let esf = es.children.filter(x => x != [ ])
  let bodyOrChildren(e) = if e.body.has("children") { concat(e.body.children) } else { e.body }
  let hideEquation(e) = if e.has("numbering") and e.numbering == none {
    nonumber(hide(e))
  } else [
    $ #hide(bodyOrChildren(e)) $ #{if e.has("label") { e.label }}
  ]
  let hidden = box(concat(
    if numberlast {
      esf.slice(0, esf.len()-1).map(e => nonumber(hide(e))) + (hideEquation(esf.last()),)
    } else {
      esf.map(e => hideEquation(e))
    }))
  let folder(acc, e) = acc + if acc != [] { linebreak() } + e
  let aligned = math.equation(block: true, numbering: none, esf.fold([], folder))

  hidden
  context(v(-measure(aligned).height, weak: true))
  aligned
}

#let tag(eq_tag_array) = {
    let pairs = eq_tag_array.chunks(2, exact: true)
    let tags = pairs.map(tag => if tag.last() == none { none } else { "(" + tag.last() + ")" } )
    counter(math.equation).update(0)
    set math.equation(numbering: (a) => tags.at(a - 1))
    let eqs = pairs.map(eq => eq.first())
    tagged_eq(eqs.fold([], (a, x) => a + x))
}

Test

#tag((
    $ a &= 1/2 &= g &= 20 $, none,
    $ b c &= 3 &= f (x)^2 &= H(Y) $, "bar"
))

#tag((
  $ a &= p $, "triangle inequality",
  $ a y x &= p l k $, none
))
