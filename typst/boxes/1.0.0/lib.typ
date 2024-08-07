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

#let otherbox(string, color) = thmbox(
    string, string, 
    fill: color, 
    inset: 0.4em,
    padding: (top: -3pt, bottom: -3pt),
    stroke: 0.8pt + color.darken(30%),
    breakable: true, 
    titlefmt: emph,
    radius: 0pt,
).with(numbering: none)

#let defn = tbox("Definition", luma(235))
#let thm = tbox("Theorem", rgb("c7d1ff"))
#let lemma = tbox("Lemma", rgb("f7bef5"))
#let propo = tbox("Proposition", rgb("dfc0fc"))
#let cor = tbox("Corollary", rgb("d4fcf9"))

#let exmp = otherbox("Example", rgb("d4fcd7"))
#let remk = otherbox("Remark", rgb("fbfccc"))
#let note = otherbox("Note", rgb("fccccc"))
#let notation = thmplain("Notation", "Notation", titlefmt: underline).with(numbering: none)

#let todofmt(x) = text(red)[*#x*]
#let todo = thmplain("todo", "TODO", titlefmt: todofmt, bodyfmt: todofmt).with(numbering: none)
