#!/usr/bin/env bash

set -e

Rscript -e 'bookdown::render_book("index.Rmd", output_format = "all")'
rm -rf _bookdown_files/
