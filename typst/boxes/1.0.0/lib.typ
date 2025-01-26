#import "@preview/ctheorems:1.1.3": *

#let proof = thmproof("proof", "Proof",
  outset: (left: -6pt),
  radius: 0pt,
  stroke: (left: 1pt + gradient.linear(dir: ttb, ..color.map.mako)),
)

#let section(name) = {
    heading("  " + name)
}

#let tbox(string, color) = thmbox(
    "all",
    string, string, 
    inset: (left: 10pt, right: 0.8em, top: 0.3em, bottom: 0.5em),
    outset: (left: -4pt),
    padding: (top: -3pt),
    radius: 0pt,
    stroke: (left: 6pt + color, 
      bottom: 1pt + gradient.linear(white, white, color),
      right: 1pt + gradient.linear(white, color, angle: 90deg)),
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
#let color_cor_light = rgb("89c3d9")

#let color_exmp = rgb("d4fcd7")
#let color_remk = rgb("fbfccc")
#let color_note = rgb("fccccc")

#let defn = tbox("Definition", color_defn_light)
#let thm = tbox("Theorem", color_thm_light)
#let lemma = tbox("Lemma", color_lemma_light)
#let propo = tbox("Proposition", color_propo_light)
#let cor = tbox("Corollary", color_cor_light)

#let exmp = otherbox("Example", rgb("d4fcd7"))
#let remk = otherbox("Remark", rgb("fbfccc"))
#let note = otherbox("Note", rgb("fccccc"))
#let notation = thmplain("Notation", "Notation", titlefmt: underline).with(numbering: none)

#let todofmt(x) = text(red)[*#x*]
#let todo = thmplain("todo", "TODO", titlefmt: todofmt, bodyfmt: todofmt).with(numbering: none)
