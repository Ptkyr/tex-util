#import "@preview/ctheorems:1.1.3": *

#let proof = thmproof("proof", "Proof",
  outset: (left: -4pt),
  radius: 0pt,
  stroke: (left: 1pt + gradient.linear(dir: ttb, ..color.map.mako)),
)

#let section(name) = {
    heading("  " + name)
}

#let box_settings(color) = (
    inset: (left: 9pt, right: 0.8em, top: 0.3em, bottom: 0.5em),
    outset: (left: -3pt),
    padding: (top: -3pt),
    radius: 0pt,
    stroke: (
      left: 4pt + color, 
      bottom: 1pt + gradient.linear(white, white, color),
      right: 1pt + gradient.linear(white, color, angle: 90deg)
    ),
)

#let tbox(string, color) = thmbox(
    "all",
    string, string, 
    ..box_settings(color),
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

#let remkbox(titlefmt: emph, string, color) = thmbox(
    string, string, 
    titlefmt: titlefmt,
    breakable: true, 
    ..box_settings(color),
).with(numbering: none)

#let color_defn_dark = luma(125)
#let color_thm_dark = rgb("003bd1")
#let color_lemma_dark = rgb("c100c4")
#let color_propo_dark = rgb("7600c4")
#let color_cor_dark = rgb("0089c4")
#let color_remk_dark = rgb("faf25f")
#let color_note_dark = rgb("e30202")

#let color_defn_light = luma(235)
#let color_thm_light = rgb("c7d1ff")
#let color_lemma_light = rgb("f7bef5")
#let color_propo_light = rgb("dfc0fc")
#let color_cor_light = rgb("89c3d9")
#let color_remk_light = rgb("fbfccc")
#let color_note_light = rgb("fccccc")

#let color_exmp = rgb("d4fcd7")
#let color_remk = rgb("fbfccc")
#let color_note = rgb("fccccc")

#let defn = tbox("Definition", color_defn_light)
#let thm = tbox("Theorem", color_thm_light)
#let lemma = tbox("Lemma", color_lemma_light)
#let propo = tbox("Proposition", color_propo_light)
#let cor = tbox("Corollary", color_cor_light)

#let exmp = otherbox("Example", color_exmp)
#let remk = remkbox("Remark", color_remk_dark)
#let note = remkbox(titlefmt: strong, "Note", color_note_dark)
#let notation = thmplain("Notation", "Notation", titlefmt: underline).with(numbering: none)

#let todofmt(x) = text(red)[*#x*]
#let todo = thmplain("todo", "TODO", titlefmt: todofmt, bodyfmt: todofmt).with(numbering: none)
