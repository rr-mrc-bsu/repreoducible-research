--- 
title: "A Reproducible Research Compendium"
author: "cf. list of contributors at https://github.com/rr-mrc-bsu/reproducible-research/graphs/contributors"
date: "2019-03-04"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "This compendium is inteded is intended to be a growing knowledge base on reproducible research and by writing it collaboratively acts as learning-by-doing example on modern collaborative coding workflows and version control."
---





# A 'Living Book' - aims and scope


This book is a little different from your ususal statistics foliant -
it is written entirely using **Markdown** and rendered to html, pdf, and epub
publishing formats using the R package **bookdown**.
Its entire Markdown source code is publicly available on GitHub.com at
[https://github.com/rr-mrc-bsu/reproducible-research](https://github.com/rr-mrc-bsu/reproducible-research).
A pre-build version is hosted as static html website using **GitHub pages** at
[https://rr-mrc-bsu.github.io/reproducible-research/](https://rr-mrc-bsu.github.io/reproducible-research/).
This structure allows to easily discuss changes using GitHub issues
[https://github.com/rr-mrc-bsu/reproducible-research/issues](https://github.com/rr-mrc-bsu/reproducible-research/issues), organize
further development using milestones and projects, contribute corrections or 
even entire chapters by creating pull requests, and to manage editions by
GitHub releases.
It also means that everybody - and yes, that does include you - can become a 
contributor by creating pull requests in the GitHub repository.
Since the contents are thus evolving over time as long as there are active 
contributors to the project, the book is 'living'.

The overall purpose of the *Reproducible Research Compendium* is threefold:

1. Provide a platform for discussing aims and objectives as well as best 
practices for reproducible research with a clear focus on applications in 
biostatistics.
2. Build-up a lasting compendium for knowledge sharing around various issues 
and methods for coping with them that may broadly be subsumed under the term 
'reproducible research'. 
3. The book project itself acts as a learning-by-doing example for its 
contributors with the goal of anybody participating becoming knowlegable about
organizing collaborative open-source [mostly coding] projects.

The complete documentation for **bookdown** can be found at 
[https://bookdown.org/yihui/bookdown/](https://bookdown.org/yihui/bookdown/).
Note that R is a prerequisite but only for building the book - 
the contents itself are completely language-agnostic.
