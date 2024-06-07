// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(paper: "a4",margin: (x: 1.2cm, y: 1.5cm),columns: 1,
  header: [
    #set text(8pt)
    // #smallcaps[Typst Academcy]
    // #h(1fr) _Exercise Sheet 3_
  ],
  footer: context [
    #set align(right)
    #set text(8pt)
    #counter(page).display(
      "1 of I",
      both: true,
    )
  ],
)
  set heading(numbering: "1.a.i")
  show heading.where(level: 1): set text(font:"Helvetica",red,size: 18pt,style:"italic")
  show heading.where(level: 2): set  text(font:"Helvetica",blue,size: 17pt,style:"italic")
  show heading.where(level: 3): set text(font:"Helvetica",purple,size: 16pt,style:"italic")
  set text(font: "Times new roman",size: 14pt)


  // Title row.
  align(center)[
    #block(text(font:"Roboto Serif",style:"italic",weight: 500, 1.2em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.1em,
    bottom: 0.1em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, strong(author))),
    ),
  )

  // Main body.
  set par(justify: true,leading: 0.52em)
  
  body
}