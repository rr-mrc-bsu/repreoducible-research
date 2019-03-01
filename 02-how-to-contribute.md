# How to contribute

Since this book is a collaborative effort, the most important thing is 
enabling people to contribute!
This chapter is a hands-on tutorial and does not go into the details of the 
required steps.
Each of the techniques will be explained in more detail in the subsequent 
chapters.

---


## Before you start

In the following we will assume that you are working on a Linux or MacOS machine. 
The instructions are similar for Windows users, but we do not discuss the details here. 
Using an open source operating system such as Linux is preferable since all 
collaborators are able to use the exact same operating system that you are running. 

A great way to get started with Linux is [Ubuntu](https://www.ubuntu.com/download/desktop)
and the easiest way to install it on an existing Windows or MacOS machine might be
via a virtual machine. Detailed instructions on how to do so can be found [here](https://www.wikihow.com/Install-Ubuntu-on-VirtualBox). 

---

## Cloning: Getting the book's source code

The book is compiled from a collection of R markdown files which is a
special text file format that allows to combine code and text within the same 
file as well as basic markup[^1].
The motivation behind markdown is to separate the content entirely from the 
layout and stick to an absolute minimum number of markups (e.g. headings, 
enumeration, hyperlinks) to be able to compile the document to as many different
output formats as possible. 
The actual compilation will be done in 'pandoc' and will be explained
later [ref].

A very important pillar of reproducibility is version control, i.e., some
mechanism to keep track of changing files over time and enabling roll-backs
to previous versions.
For more details on why version control is so important in reproducible 
research and how to implement it, cf. [ref: version control chapter].
For now, we will just focus on how to install and use a specific program, **git**,
to obtain the source code for the book and make changes to it.
Assuming that you have a linux (we will assume an Ubuntu installation) or 
MacOS system running, you will need to install the version control system 
git [link to chapter]. The easiest way to do this is via the command line package 
manager 'apt' on linux ('homebrew' is the equivalent for MacOS).

On **linux**, open a terminal window and execute the command


```bash
sudo apt -y install git
```

On **MacOS**, the following command will prompt git installation 
if it is not already installed


```bash
git --version
```

This will download and install all required packages from the official 
repository.

You may now 'clone' the online repository of the book from its GitHub.com
website: [https://github.com/rr-mrc-bsu/reproducible-research](https://github.com/rr-mrc-bsu/reproducible-research).
Here 'cloning' does exactly what it says: it downloads an exact copy of
the entire source code including its complete history of previous changes to
your local computer to work on.

Assuming that you have a terminal window opened and the working directory is 
your home directory '~' you clone the repository by invoking


```bash
git clone https://github.com/rr-mrc-bsu/reproducible-research.git
```

This will create a new folder 'reproducible-research' in your current working
directory and download all necessary files.
You should then change the working directory to the new folder via


```bash
cd reproducible-research
```

Note that the source code only needs to be cloned **once**. 
After you have a local copy of the source code, you should ensure that 
this is kept up to date by 'pulling' from the remote master branch. 
This ensures that you are editing the most up-to-date version of the project.

The following command copies the remote master branch to your local device 
(this need not be done if you have just cloned the source code)


```bash
git pull origin master
```

---

## Creating a new 'branch'

Branches are different variants of the source code that may exist in 
parallel and one major job of git is making it possible to bring these branches
together.

By default your git repository will now be on its 'master' branch.

You may verify that via


```bash
git status
```

This is a useful command to check that you are never working on the master 
branch. 
For this project, we have envoked a branch protection rule meaning 
that you are not able to work on the local master and then push this directly 
to the remote master. 
Instead, you must first create a branch that you edit and then push back 
to the remote, before opening a pull request to merge with the remote master.

The master branch is special in that it is usually considered the current 'best'
variant of a project.
For most smaller projects, a single master branch might be sufficient but things
do get a bit hairy when many people could potentially change this common master
branch at the same time.
Also, for this book project, each time the master branch in the online repository
changes, the entire book is recompiled and published at
[https://rr-mrc-bsu.github.io/reproducible-research/](https://rr-mrc-bsu.github.io/reproducible-research/).
Therefore the books contributing guidelines require that no changes are 
made directly to the master branch.
Instead, all work is done on separate feature branches, e.g., on 'my-cool-new-chapter'
if you want to add a new chapter.

To create this branch you run the following git commands


```bash
git branch my-cool-new-chapter
git checkout my-cool-new-chapter
```

This creates the new branch and checks it out (activates it). 
All changes that you now make to files in the directory only affect the 
version of the book associated with your local branch 'my-cool-new-chapter'
(after you commit them, that is).

Of course, you can always check that you are on your new branch using


```bash
git status
```

---

## Creating a new chapter

You may now add a new chapter simply by placing a new numbered .Rmd file in
the top level of the book projects directory, 
e.g. the new file could be called '99-my-cool-new-chapter.Rmd'. 
Do feel free to browse the other chapters of the book already present to learn 
more about the R markdown syntax used to write the book.
Note that although R markdown relies on R to compile the files, the contents of
the file may not contain any R code at all.
For more details on R markdown see [link chapter].

Once the new chapter file is created and you added some content you should
check whether the altered book still compiles without errors.
This is critically important for any piece of source code since even small 
changes might break the entire thing.
Since you will not be able to incorporate you changes in the online version of
the book without passing some automated checks, you may just as well check
that everything is working locally before attempting to add your changes online.

To compile the book you will need R and some packages.
The easiest way to install everything is again via the icommand line.

Linux users should envoke 


```bash
sudo apt-get install r-base r-base-dev 
Rscript -e 'install.packages("bookdown")'
```

Whilst MacOS users should use the following, which installs XCode CLT and homebrew 
prior to the installation of R (if XCode and/or homebrew are already installed you 
will see a message warning and you can skip these steps)


```bash
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install r
Rscript -e 'install.packages("bookdown")'
```

You may then attempt to build the new book with your new chapter by invoking
the build script


```bash
bash _build.sh
```

which essentially runs the R command


```r
bookdown::render_book("index.Rmd")
```

to build the book and cleans up afterward.
You should now see a new folder '_book/' and be able to open '_book/index.html'
in your browser.
This just opens the newly build version of the book locally.
Make sure that everything is as you want it to be.

---

## Committing your changes

Next you will want to 'commit' your changes to your local 
'my-cool-new-chapter' branch.
Commiting means that you store your changes in the git repository thus creating
a snapshot in time that you may always return to irrespective of any further
changes to the repository.

The repository should be configured in such a way as to ignore the _book/ folder
that you created since this is just output.
You can therefore simply add all changes and commit them with a short description
of what you did


```bash
git add -A
git commit -m "added cool new chapter"
```

---

## Publishing your changes

Changes to the master branch in the online repository are organized as 
pull requests.
This is a feature on GitHub.com that allows you to publicly propose merging
a branch back to master.
Usually this is straight-forward to do since the master branch will change very 
slowly (cf. [ref merge conflicts]).
The pull request will then have to be reviewed by at least one other collaborator
to the repository before you are able to actually merge the changes into the
master branch - only at that point are they actually integrated in the published 
book.

To do so, you first have to be a contributor to the project 
[TODO: explain how to do that without being a contributor / how to become one]. 
Next, you will need to push your local branch to the online repository via


```bash
git push -u origin my-cool-new-chapter
```

Switch to a browser and open [https://github.com/rr-mrc-bsu/reproducible-research](https://github.com/rr-mrc-bsu/reproducible-research).
In the top/middle you then need to switch from the '<> Code' tab to the 
pull requests tab.
Create a new pull request by clicking on the button.
This opens a panel where you can define your pull request. 
A pull request always proposes to merge one branch onto another. 
In our case we want to merge 'my-cool-new-chapter' onto 'master'. 
That meas that we leave the 'base:' branch master as it stands by default. 
However, in the rop-down menu for 'compare:' you can now select you new branch.
Note that the arrow between the two already indicates that the 'compare:' branch
is supposed to be merged onto the 'base:' branch.
In the panel below you will then see a git diff, i.e., a listing of all the 
differences between the two branches (gree: additions, red: deletions). 
Since you only added new stuff in this example and the master (probably) did not
change between you downloading the latest copy of the repository and creating your
changes, there are no merge conflicts.
Confirm by clicking on 'create pull request'.

This will first create the pull request and the immediately trigger a build
script on the continuous integration system Travis [reference to 
continuous integration].
The continuous integration system will spin up a virtual machine in the cloud,
install all required software, download the repository and check whether the
build script will still run without errors after merging you pull request.
This process will take a few minutes and once it is completed the status of the
build will be shown in your pull request.
Even if the build script ran perfetly fine on your local machine the Travis
build might fail if you introduced new dependencies without altering the
Travis build configuration.
For normal changes (only editing .Rmd files), the build should work without any errors. 
The advantage of having a CI system is that anybody reviewing your changes 
will immediately know that your pull request did not introduce any breaking 
changes and that the book can still be compiled on the default minimal build system
defined in the travis.yml file.

Once another contributor has reviwed your changes and approved them, your are
then free to merge your pull request.
Only this last action will actually change the master branch of the repository.
This change will again trigger a build on Travis, this time for the newly merged
master branch.
Since the pull request was already checked, there should not be any further 
problems.
Additionally, any build of the master branch will also execute the _deploy.sh
script which will take the compiled book and push the output to the
gh-pages branch of the repository.
This branch is special in that it only contains the generated output and not
the corresponding source code.
GitHub.com offers the possibility of hosting static html pages free of charge 
via GitHub pages and the project is configured such that the contents of
the gh-pages branch (feel free to inspect it) are used to populate the GitHub 
pages homepage of the project.
This means that the version of the book displayed at [https://rr-mrc-bsu.github.io/reproducible-research/](https://rr-mrc-bsu.github.io/reproducible-research/) should automatically corresponds to the version obtained from the last
commit to the repositories master branch. 




[^1]: Markups are simple meta information on text such as 'this is a headline' etc.
If you are familiar with LaTeX you are already a markup professional since LaTeX
supports a huge number of different markup expressions. HTML is also a markup language.
