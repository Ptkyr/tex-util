#import "@preview/ctheorems:1.1.2": *

#let proof = thmproof("proof", "Proof")

#let section(name) = {
    heading("  " + name)
}

#let tbox(string, color) = thmbox(
    string, string, 
    fill: color, 
    inset: 0.8em,
    padding: (top: -3pt, bottom: -3pt),
    stroke: 0.8pt + color.darken(30%),
)

#let defn = tbox("Definition", luma(235))
#let thm = tbox("Theorem", rgb("c7d1ff"))
#let lemma = tbox("Lemma", rgb("f7bef5"))
#let propo = tbox("Proposition", rgb("dfc0fc"))
#let cor = tbox("Corollary", rgb("d4fcf9"))

#let exmp = tbox("Example", rgb("d4fcd7")).with(numbering: none)
#let remk = tbox("Remark", rgb("fbfccc")).with(numbering: none)
#let note = tbox("Note", rgb("fccccc")).with(numbering: none)
#let notation = thmplain("Notation", "Notation", titlefmt: underline).with(numbering: none)
