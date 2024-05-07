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
    show par: set block(spacing: 0.65em)

    set enum(numbering: "(a)")
    set text(10pt, font: "New Computer Modern")

    set table.hline(stroke: 0.1pt)
    set table.vline(stroke: 0.1pt)
    set figure.caption(position: top)

    set math.mat(delim: "[")
    set math.vec(delim: "[")

    show: doc

    // Don't know why but this has to be after the show
    set enum(numbering: "(a)")
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

#let sgn = math.op("sgn")
#let imp = math.arrow.r.double.long
#let impby = math.arrow.l.double.long
#let iff = math.arrow.l.r.double.long
#let cup = math.union
#let cap = math.sect
#let xx = math.times
