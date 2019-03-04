# Build automation {#chptr-workflow-automation}

Large projects can be a pain to manage. Small changes may break your software, 
or may deem your previously obtained analysis results useless. Build 
automation refers to a collection of tools that atempt to automate steps
in your workflow, thereby simplifying your the whole process. Many processes may
be automated, but here we will mainly discuss build automation using Makefiles. 

## Makefiles

Most research projects consist of several different connected components. 
For example, the end product might be a manuscipt, which depends on intermediate
components such as a data analysis script and an R package. In this case, 
the manuscript depends on the data analysis script, which in turn depends on the
R package. Such a hierarchy implies that every time a file changes, all files 
downstream in the hierarchy should be updated as well. In the previous example, 
we might adjust a function in the R package, which might change the outcome of 
the data analysis, and as a result, we'd have to re-run the data analysis 
script. The outcome of the data analysis might change the manuscript, so we'd 
have to re-compile that as well. In large projects, this quickly becomes tedious
and difficult to maintain by hand. Luckily there is software available to 
streamline this process.

Consider the more complicated example in Figure \@ref(fig:workflow-diagram) with 
the following corresponding project directory:


```bash
./
├── rpackage
│   ├── DESCRIPTION
│   └── functions.R
├── code
│   ├── analysis.R
│   └── simulation.R
├── docs
│   ├── manuscript.Rnw
│   ├── presentation.Rnw
│   └── refs.bib
└── README.md
```

[to do: make diagram with DiagrammeR]

<div class="figure">
<img src="10-build-automation_files/figure-epub3/workflow-diagram-1.png" alt="Example project workflow"  />
<p class="caption">(\#fig:workflow-diagram)Example project workflow</p>
</div>

Re-running, -building, and -compiling all the files after we made a change to 
the anyone of the intermediate files would be a tedious task. Ideally, we would
like to have a command that re-runs/compiles/builds the different files 
everytime an upstream change is made. This is exactly what the GNU software Make 
does. Make works through a Makefile, a file that describes how a target file,
depends on its dependencies, and how these in turn on their dependencies, and so
on. If a Makefile is run, a file is compiled if any of its dependencies has 
changed since the last time the file was compiled. In other words, the Makefile
starts at the top of the hierarchy and updates a file if its creation time is 
older than the creation time of its dependencies. In our example in Figure
\@ref(fig:workflow-diagram), if we make a change to the functions.R file, we
trigger the recompilation of the recompilation of the r-package.tar.gz file, 
which in turn triggers a rerunning of the analysis.R and simulation.R scripts,
and so on, until all files are up to date again.

[add example Makefile]
