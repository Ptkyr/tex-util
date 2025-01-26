#import "@preview/ctheorems:1.1.3": *

#let proof = thmproof("proof", "Proof")

#let section(name) = {
    heading("  " + name)
}

#let tbox(string, color) = thmbox(
    "all",
    string, string, 
    inset: (left: 0.8em, right: 0.8em, top: 0.3em, bottom: 0.5em),
    padding: (top: -3pt),
    radius: 0pt,
    stroke: (left: 8pt + color, bottom: 1pt + gradient.linear(color, color.lighten(100%))),
)

#let otherbox(string, color) = thmbox(
    string, string, 
    fill: color, 
    inset: 0.4em,
    padding: (top: -3pt, bottom: -3pt),
    stroke: 1pt + color.darken(20%),
    breakable: true, 
    titlefmt: emph,
    radius: 0pt,
).with(numbering: none)

#let color_defn_dark = luma(125)
#let color_thm_dark = rgb("003bd1")
#let color_lemma_dark = rgb("c100c4")
#let color_propo_dark = rgb("7600c4")
#let color_cor_dark = rgb("0089c4")

#let color_defn_light = luma(235)
#let color_thm_light = rgb("c7d1ff")
#let color_lemma_light = rgb("f7bef5")
#let color_propo_light = rgb("dfc0fc")
#let color_cor_light = rgb("d4fcf9")

#let color_exmp = rgb("d4fcd7")
#let color_remk = rgb("fbfccc")
#let color_note = rgb("fccccc")

#let defn = tbox("Definition", color_defn_dark)
#let thm = tbox("Theorem", color_thm_dark)
#let lemma = tbox("Lemma", color_lemma_dark)
#let propo = tbox("Proposition", color_propo_dark)
#let cor = tbox("Corollary", color_cor_dark)

#let exmp = otherbox("Example", rgb("d4fcd7"))
#let remk = otherbox("Remark", rgb("fbfccc"))
#let note = otherbox("Note", rgb("fccccc"))
#let notation = thmplain("Notation", "Notation", titlefmt: underline).with(numbering: none)

#let todofmt(x) = text(red)[*#x*]
#let todo = thmplain("todo", "TODO", titlefmt: todofmt, bodyfmt: todofmt).with(numbering: none)
