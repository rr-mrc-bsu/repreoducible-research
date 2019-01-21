#!/usr/bin/env bash
Rscript -e 'bookdown::render_book("index.Rmd")'
rm -rf _bookdown_files/
