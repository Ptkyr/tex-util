#let tableau(scale: 100%, tabloid: false, width: 0pt, ..labels) = context {
    let size = if width == 0pt { text.size } else { width }
    let partition = labels.pos().map(
        // If `none` or literally nothing is passed in,
        //  convert to an empty array
        x => if type(x) != array { () } else { x }
    )
    let max_v = calc.max(..partition.map(x => x.len()))
    let cells = ()
    let cell-stroke = if tabloid {
        (top: 0.1pt, bottom: 0.1pt, left: none, right: none)
    } else {
        0.1pt
    }
    for p in partition {
        for label in p {
            cells.push(table.cell($#label$, align: center + horizon, stroke: cell-stroke))
        }
        for _ in std.range(0, max_v - p.len()) {
            cells.push(none)
        }
    }
    $#std.scale(
        scale, origin: left + horizon, reflow: true,
        std.table(
            columns: std.range(0, max_v).map(x => size),
            rows: std.range(0, partition.len()).map(x => size),
            stroke: 0pt,
            inset: 2pt,
            ..cells,
        )
    )$
}

#let tabloid(..args) = young(..args, tabloid: true)
