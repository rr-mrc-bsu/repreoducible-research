# Build automation {#chptr-workflow-automation}

Large projects can be a pain to manage. Small changes may break your software, 
or may deem your previously obtained data analysis results useless. Build 
automation refers to a collection of processes that atempt to automate as many 
steps as possible. Automation can be done on several levels. Here, we will 
mainly discuss two ways of build automation: automating your project pipeline 
using Makefiles and automating software checks using continuous integratino 
tools.

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
have to re-compile that as well. In large projects, this quickly becomes very 
tedious and difficult to maintain by hand. Luckily there is software available 
to streamline this process.

Consider the previous example. The hierarchy of files may be represented as: 
r-package.tar.gz > analysis.R > manuscript.Rnw. A change higher up the hierarchy
might change the downstream files. Ideally, we would like to have a command that re-runs/compiles the different files everytime an upstream change is made. In 
our example, we would like to recompile the manuscript.Rnw file if something in 
the analysis.R file changes. And similarilly, if the R package changes, the 
analysis.R file should be re-run. This is exactly what the GNU software Make 
does.

## Continuous integration

Did you ever wonder what the green/yellow/red 'badges' in some Readme.md files 
on, e.g., Github.com actually mean? How are they created, what are they for and 
why should you care?

This section will hopefully shed light on the meaning of some of these badges 
(those refering to a 'build status') and you will learn how to use these 
techniques for you own repositories. The key term here is 'continuous 
integration' (CI) which refers to a concept in software development where all 
working copies  (in git one would refer to branches) of a project are frequently
integrated into the mainline (in git terms: the master branch). The rationale 
being that frequent/continuous integration prevents diverging development 
branches. Since the philosophy of git is to create feature branches for small, 
contained changes of master which are to be merged back as soon as possible CI 
and git are a natural fit.

In practice, however, frequent changes to master are dangerous.  After all, the 
master branch should maintain the last at least working if not stable version of
the project that other feature branches can be started from. It is thus crucial 
to prevent erroneous changes to be merged into the master branch too often. This
means that CI requires some kind of automated quality checks that preemptively 
check for new bugs/problems before a pull request from a feature branch on 
master is executed. It is this particular aspect of CI that is most interesting 
to collaborative work on scientific coding projects - being able to 
automatically run checks/tests on pull requests proposing changes to the master 
branch of the 
project.

[Random thought: we should have an example repository for demonstraiting the 
different states of PRs etc. instead of just including pictures. Readers could 
then inspect the 'frozen' repository directly and see the PRs etc.!]

To enable this kind of feature on Github, a cloud-based farm or build servers is
required where users can run build scripts in virtual machines and retrieve 
reports on the build status (0 worked, 1 failed). It is these build-statuses 
that the green/yellow/red badges report visually (yellow/gray being a pending 
build)! There are multiple companies offering these services (within reasonable 
bounds) for free for public repositories and as of 2018 the free academic 
account for GitHub also enables free builds using TravisCI for private 
repositories. It must be stressed though that, since everything is running in 
the cloud, the same constraints as for storing data on GitHub servers apply to 
downloading or processing data in buildscripts for CI services. [point to 
Jenkins as on-premis solution]

The obvious setting to use automated builds in is package development. This is 
by far the most common application and the current tools are definitely geared 
towards that use case. We will later discuss how to extend the scope to 
non-package situations. For instance, the repository containing the source code 
for this book also uses TravisCI for build automation even though it is not an 
R-package itself.
