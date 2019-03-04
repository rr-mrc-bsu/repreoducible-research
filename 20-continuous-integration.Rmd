# Continuous Integration {#chptr-continuous-integration}

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
