# Resume

### [My resume](https://github.com/jLevere/resume/releases/latest/download/resume.pdf) written in [Typst](https://github.com/typst/typst)


This repository contains my personal resume written in Typst. These documents are compiled using the Typst compiler in a GitHub Actions workflow. The compiler extracts input variables such as name and email directly from GitHub, which are then passed through the [--inputs](https://typst.app/docs/reference/foundations/sys/) CLI flag during the compilation process. Typst compiles the resume into a PDF format, and this PDF is then published as a release.


## Why Typst?

[Typst](https://github.com/typst/typst) is a markup-based typesetting system designed to be as powerful as LaTeX while being much easier to learn and use.
It brings the capability of complex templating for code reuse even in typesetting, allowing for clean documents that are easier to update when needed.

## How It Works

The compilation process is automated using GitHub Actions. Whenever changes are pushed to this repository, the TypSt compiler is triggered. It extracts input variables such as the user's name and email from GitHub variables. These variables are then passed to the TypSt compiler using the `--inputs` CLI flag. The compiler transforms the resume into a PDF format, ready for release.


## Credits

This workflow is inspired by [this cool resume build system](https://github.com/mbund/resume).

For more information about Typst, visit the [official TypSt GitHub repository](https://github.com/typst/typst).




