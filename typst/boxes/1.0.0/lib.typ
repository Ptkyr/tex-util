#import "@preview/ctheorems:1.1.2": *

#let proof = thmproof("proof", "Proof")

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



#let pog(string, color) = thmbox(
    string, string, 
    fill: color, 
    inset: 0.8em,
    padding: (top: -3pt, bottom: -3pt),
    stroke: 0.8pt + color.darken(30%),
)

#let defn = pog("Definition", luma(235))
#let thm = pog("Theorem", rgb("c7d1ff"))
#let lemma = pog("Lemma", rgb("f7bef5"))
#let propo = pog("Proposition", rgb("dfc0fc"))
#let cor = pog("Corollary", rgb("d4fcf9"))

#let exmp = pog("Example", rgb("d4fcd7")).with(numbering: none)
#let remk = pog("Remark", rgb("fbfccc")).with(numbering: none)
#let note = pog("Note", rgb("fccccc")).with(numbering: none)
#let notation = thmplain("Notation", "Notation", titlefmt: underline).with(numbering: none)
