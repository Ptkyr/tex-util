#import "@preview/ctheorems:1.1.3": *

#let proof = thmproof(
  "proof",
  "Proof",
  radius: 0pt,
  stroke: (left: 1pt + gradient.linear(dir: ttb, ..color.map.icefire)),
)

#let section(name) = {
  heading("  " + name)
}

#let box_settings(color, fade: true) = (
  inset: (left: 6pt, right: 0.8em, top: 0.3em, bottom: 0.5em),
  padding: (top: -3pt),
  radius: 0pt,
  stroke: (
    left: 3pt + color,
    bottom: if fade {
      1pt + gradient.linear(white, white, white, white, color)
    } else {
      none
    },
    right: if fade {
      1pt + gradient.linear(white, color, angle: 90deg)
    } else {
      none
    },
  ),
)

#let tbox(string, color, fade: true) = thmbox(
  "all",
  string,
  string,
  base_level: 1,
  ..box_settings(color, fade: fade),
)

#let remkbox(titlefmt: emph, string, color, fade: true) = thmbox(
  string,
  string,
  titlefmt: titlefmt,
  breakable: true,
  ..box_settings(color, fade: fade),
).with(numbering: none)

#let color_defn_dark = luma(125)
#let color_thm_dark = rgb("003bd1")
#let color_lemma_dark = rgb("c100c4")
#let color_propo_dark = rgb("7600c4")
#let color_cor_dark = rgb("0089c4")
#let color_remk_dark = rgb("faf25f")
#let color_note_dark = rgb("e30202")
#let color_fact_dark = rgb("e6a8d8")

#let color_defn_light = luma(235)
#let color_thm_light = rgb("c7d1ff")
#let color_lemma_light = rgb("f7bef5")
#let color_propo_light = rgb("dfc0fc")
#let color_cor_light = rgb("b9e4ed")
#let color_remk_light = rgb("fbfccc")
#let color_note_light = rgb("fccccc")

#let color_exmp = rgb("d4fcd7")
#let color_exmp_dark = rgb("80d981")
#let color_remk = rgb("fbfccc")
#let color_note = rgb("fccccc")

#let defn = remkbox(titlefmt: strong, "Definition", color_defn_light)
#let thm = tbox("Theorem", color_thm_light)
#let lemma = tbox("Lemma", color_lemma_light)
#let propo = tbox("Proposition", color_propo_light)
#let cor = tbox("Corollary", color_cor_light)

#let exmp = remkbox("Example", color_exmp_dark)
#let remk = remkbox("Remark", color_remk_dark)
#let note = remkbox(titlefmt: strong, "Note", color_note_dark)
#let factoid = remkbox(titlefmt: strong, "Fact", color_fact_dark)
#let notation = thmplain("Notation", "Notation", titlefmt: underline).with(numbering: none)

#let todofmt(x) = text(red)[*#x*]
#let todo = thmplain("todo", "TODO", titlefmt: todofmt, bodyfmt: todofmt).with(numbering: none)

#let color_exer_dark = rgb("fcba03")
#let exercise-counter = counter("exercise")

#let exsol-counter = counter("exsols")

#let solutions = state("sol-buffer", ())

#let exproof(string, color, fade: true) = thmproof(
  "ex",
  string,
  radius: 0pt,
  ..box_settings(color, fade: false)
)

#let exercise(ex-content, sol-content) = {
  exercise-counter.step()
  context {
    let ctr = str(exercise-counter.get().first())
    let head = str(counter(heading).get().first())
    let fmt = i => i + " " + head + "." + ctr
    let sol_lab = label(fmt("exsol"))
    let ex_lab = label(fmt("ex"))
    let exer = exproof(fmt("Exercise"), color_exer_dark, fade: false)
    let exsol = exproof(head + "." + ctr, color_exer_dark, fade: false)

    show link: set text(color_exer_dark)
    let old-qed = thm-qed-symbol.get()
    show: thmrules.with(qed-symbol: link(sol_lab, $triangle.r.filled$))
    [
        #exer[
          #ex-content
        ] #ex_lab
    ]

    show: thmrules.with(qed-symbol: link(ex_lab, $triangle.l.filled$))
    solutions.update(x => {
      x.push([
        #exsol[
          #sol-content
        ] #sol_lab  
      ])
      x
    })
    show: thmrules.with(qed-symbol: old-qed)
  }
}

#let display-sols() = {
  show link: set text(color_exer_dark)
  context {
    for sol in solutions.final() {
      sol
    }
  }
}
