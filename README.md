# Rmarkdown to CV template

A reproducible and easy-enough to use CV builder with `Rmarkdown`, `knitr` and `snakemake.`

A semi-recent (that depends on how often I update my webpage) version of the final pdf is available [here](https://lachlandeer.github.io/files/lachlandeer-cv.pdf).

## How to Use

* Ensure Snakemake is installed (you need a python install to do this)
```
pip install snakemake
```
* Install R and Rstudio, see [here](https://pp4rs.github.io/installation-guide/r/).
* Install the R package `packrat` if you haven't already:
```
snakemake packrat_install
```
* Restore the R environment I use to build this repository
```
snakemake packrat_restore
```
* In the `Snakefile` update the variable `YOUR_NAME` at the top as required
*  Modify the Rmd file `Rmarkdown/cv.Rmd` as required
* Build the pdf using snakemake
```
snakemake
```
* If you want to remove the pdf you built, use the clean rule
```
snakemake clean
```

## Acknowledgements
* **@svmiller**: his blog post and [source code](http://svmiller.com/blog/2016/03/svm-r-markdown-cv/)
* **@maelle** and **@ryanpeek** from who I borrowed the original template

## LICENSE

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />


Tested on: Ubuntu: 16.04

Last Run: Feb 19, 2018
