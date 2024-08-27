// Function sets the document characteristics and builds the header.  Parameters
// override cli arguments.
//
// If no parameters are included, will be populated from cli key value arguments in the form:
//   ` typst compile doc.typ --input key=value `
#let conf(title: none, author: none, email: none, phone: none, links: none, doc) = {
  let title = { if title == none { sys.inputs.at("title", default: "Default Title") } }
  let author = { if author == none { sys.inputs.at("author", default: "Default Author") } }
  let email = { if email == none { sys.inputs.at("email", default: "Default Email") } }
  let phone = { if phone == none { sys.inputs.at("phone", default: "Default Phone") } }
  let links = { if links == none { sys.inputs.at("links", default: "Default Links") } }

  set document(author: author, title: "resume", date: datetime.today())
  set text(font: "New Computer Modern", size: 11pt, lang: "en")

  set page(margin: (x: 5em, y: 4em))

  set align(left + top)

  align(center)[
    #show: text(weight: 700, 1.75em, title)
  ]
  align(center)[
    #show: text((phone, email, links).join("  |  "))
  ]
  set par(justify: true)
  doc
}

// Returns a horizontal line across the page to divide sections
// -> str
#let chiline() = { v(-3pt); line(length: 100%); v(-5pt) }

// Creates an entry paragraph
#let entry_par(company, title, location, date, bullets) = {
  text(weight: "bold", company)
  box(width: 1fr, align(alignment.right, date))
  "\n"
  (title, location).join(" | ")
  "\n"
  list(..bullets)
}

// Creates a resume body entry such as job or project
#let entry(company, title, location, date, bullets) = {
  par(leading: 0.60em, entry_par(company, title, location, date, bullets))
}

// Creates a degree entry
#let degree(school, degree, graduation_date, additional: "") = {
  text(weight: "bold", school)
  "\n"
  text(style: "italic", degree)
  box(width: 1fr, align(alignment.right, graduation_date))
  additional
}