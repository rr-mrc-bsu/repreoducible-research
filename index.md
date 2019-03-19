--- 
title: "A Reproducible Research Compendium"
author: "cf. list of contributors at https://github.com/rr-mrc-bsu/reproducible-research/graphs/contributors"
date: "2019-03-19"
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

We are committed to making the contribution process as easy as possible while
at the same time requiring contributors to comply with a set of best-practices
for open online collaborative coding.
To ease the transition, see chapter \@ref(chptr-how-to-contribute).
Please do feel free to post any question, suggestions, or feedback via the
[GitHub issue system]((https://github.com/rr-mrc-bsu/reproducible-research/issues))!



## Other rescources

Interest in reproducibility for quantitative (and qualitative!) research is 
rapidly increasing.
The perspectives are probably almost as diverse, if not more diverse, than the
number of scientific fields.
While many techniques and tools might be applicable across quantitative fields,
definitions, conventions, and implementation details may vary widely.
Before continuing with our take on the subject, we would therefore like to
point out similar projects and resources.
Please let us know if you feel that we should include your project here!

* **The Turing Way:** https://github.com/alan-turing-institute/the-turing-way,
an initiative by the Alan Turing national institute for data science and 
artificial intelligence.

[statement on sharing citing policy our license?]



## Our definition of 'Reproducible Research'

At the core of the scientific method stands the idea that evidence gathered 
from experience can be used to refute hypotheses.
By eliminating all hypotheses not compatible with the experimental data,
the remaining explanation (alternative hypotheses) must be accepted.

In order to convince fellow scientists - and ultimately the society at large -
of ones findings,
experiments must be replicable in the sense that anybody interested in
validating the results could set up the same or a similar experiment, again
collect data, and - agreeing on the methods used - would need to reach the same 
qualitative conclusions.
Obviously, replicability of results remains a promise up to the point that 
somebody actually attempts to do so.
Often, replication studies are not realistic due to the high associated costs.
Just think about the effort of building an entirely new particle accelerator
like CERN just to replicate its findings!
In medical research replication already plays a major role in the approval of
new drugs since the FDA usually requires convincing evidence from two independently
conducted randomized clinical trials to approve a new substance [REFERNCE].

An important caveat in the notion of replication is the fact that one needs to
agree on the methods before being truely able to replicate results by collecting
new data.
Since nowadays most analyses of empirical data require relatively complex 
statistical merthods which in turn rely on numerical computation on a computer
system, 
just describing the exact method of getting from the input data to the analysis
results - be it figures, numbers, tables - is daunting.
Anybody with experience in computer-based analyses is familiar with the fact
that these are essentially chaotic:
Even the smallest change (missed comma in script) may lead to a catastrophic 
error or even worse, altered results without raising and error!
A necessary but not sufficient prerequisite of replicability is thus 
reproducibility of results, i.e., the capability to get the exact same 
results from the exact same inputs.
This might sound like the most natural and self-evident thing but in practice 
merely reproducing the results in many scientific papers is not possible [REFS].

These considerations lead us to the same schematic definition of reprodcibility
as put forward in [The Turing Way](https://github.com/alan-turing-institute/the-turing-way/blob/master/chapters/reproducibility.md#the-turing-way-definition-of-reproducibility).

[TODO: nice table graph here]

We feel that reproducibility of scientific results should be the bare minimum
standard to strive for and want to collaborativel explore and advocated techniques,
tools, and best-practises for getting there.
