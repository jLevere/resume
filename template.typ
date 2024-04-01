// Function gets an input from the cli by name.
// 
// - key: (str): The key to return the value of
// -> (boolean, str): Returns an option type with the result
#let get_agument_by_key(key) = {
  if sys.inputs.at(key, default: "").len() != 0 {
    (true, sys.inputs.at(key))
  } else {
    (false, "")
  }
}

// Function returns either the key value if it is present
// or the default value if it is not
//
// key (str): Key to get from the cli args
// default (str) = "": The default value to return. Blank if none set
// -> str
#let set_from_argument(key, default: "") = {
  let arg_option = get_agument_by_key(key)
  if arg_option.first() {
    arg_option.last()
  } else {
    default
  }
}

// Function sets the document characteristics and builds the header.  Parameters
// override cli arguments.
//
// If no parameters are included, will be populated from cli key value arguments in the form:
//   ` typst compile doc.typ --input key=value `
#let conf(title: none, author: none, email: none, phone: none, links: none, doc) = {

  let title = { if title == none {set_from_argument("title", default: "no title supplied")} }
  let author = { if author == none {set_from_argument("author", default: "no author supplied")} }
  let email = { if email == none {set_from_argument("email", default: "email@example.com")} }
  let phone = { if phone == none {set_from_argument("phone", default: "(123) 123 1234")} }
  let links = { if links == none {set_from_argument("links", default: "github.com/example")}}

  set document(author: author, title: "resume")
  set text(
    font: "New Computer Modern",
    size: 11pt,
    lang: "en"
  )

  set page(
    margin: (x: 5em, y: 4em)
  )

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
#let chiline() = {v(-3pt); line(length: 100%); v(-5pt)}

// Creates an entry paragraph
#let entry_par(company, title, location, date, bullets) = {
  text(
    weight: "bold",
    company
  )
  box(
    width: 1fr,
    align(
       alignment.right,
       date
    )
  )
  "\n"
  (title, location).join(" | ")
  "\n"
  list(
    ..bullets
  )
}

// Creates a resume body entry such as job or project
#let entry(company, title, location, date, bullets) = {
  par(
    leading: 0.60em,
    entry_par(company, title, location, date, bullets)
  )
}

// Creates a degree entry
#let degree(school, degree, graduation_date, additional: "") = {
  text(
    weight: "bold",
    school
  )
  "\n"
  text(
    style: "italic",
    degree
  )
  box(
    width: 1fr,
    align(
      alignment.right,
      graduation_date
    )
  )
  additional
}