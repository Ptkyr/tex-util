#let tboxcount = counter("tbox")

#let tbox(
    color, 
    kind,
    title, 
    content
) = {
    tboxcount.step()
    let sec = context counter(heading).display()
    let num = context tboxcount.display()
    block(
        breakable: false,
        spacing: 0pt,
        below: 6pt,
        [
            #block(
                fill: color,
                stroke: 0.8pt + color,
                inset: 6pt,
                below: 0pt,
                text([*#kind #sec.#num: #title*], fill: white)
            )
            #block(
                width: 100%,
                stroke: 0.8pt + color,
                inset: 8pt,
                below: 0pt,
                content
            )
        ]
    )
}

#let section(name) = {
    tboxcount.update(0)
    heading("  " + name)
}

#let defn(title, content) = {
    tbox(
        luma(160),
        "Definition",
        title,
        content
    )
}

#let thm(title, content) = {
    tbox(
        rgb("00668f"),
        "Theorem",
        title,
        content
    )
}

#let lemma(title, content) = {
    tbox(
        rgb("a3006f"),
        "Lemma",
        title,
        content
    )
}

#let propo(title, content) = {
    tbox(
        rgb("00855d"),
        "Proposition",
        title,
        content
    )
}

#let cor(title, content) = {
    tbox(
        rgb("5488e3"),
        "Corollary",
        title,
        content
    )
}

#let exmp(body) = {
    par(
        first-line-indent: 0pt,
        [#highlight(fill: lime, [_*Ex.*_]) #body]
    )
}

#let remk(body) = {
    par(
        first-line-indent: 0pt,
        [#highlight(fill: yellow, [_*Remark.*_]) #body]
    )
}

#let note(body) = {
    par(
        first-line-indent: 0pt,
        [#highlight(fill: red, [_*Note.*_]) #body]
    )
}

#let notation(body) = {
    par(
        first-line-indent: 0pt,
        [#highlight(fill: aqua, [_Notation._]) #body]
    )
}
