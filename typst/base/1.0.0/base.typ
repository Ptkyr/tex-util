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

    set text(10pt, font: "New Computer Modern")

    set table.hline(stroke: 0.1pt)
    set table.vline(stroke: 0.1pt)
    set figure.caption(position: top)

    show: doc
}
