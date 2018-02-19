## Building a Rmd CV with Snakemake
##
## Contributors @lachlandeer

# --- Variable Declarations ---- #
runR = "Rscript --no-save --no-restore --verbose"
logAll = "2>&1"

# --- Build Rules --- #
## run_rmd:  knits the Rmd file into output
rule run_rmd:
    input:
        runner   = "utils/knit_rmd.R",
        rmd_file = "Rmarkdown/lachlandeer-cv.Rmd",
        tex_sty  = "Rmarkdown/svm-latex-cv.tex"
    output:
        pdf = "out/lachlandeer-cv.pdf"
    log:
        "logs/lachlandeer-cv.Rout"
    shell:
        "{runR} {input.runner} {input.rmd_file} {output.pdf} \
            > {log} {logAll}; \
            cp {output.pdf} ."

# --- Packrat Rules --- #
rule packrat_install:
    shell:
        "R -e 'install.packages(\"packrat\", repos=\"http://cran.us.r-project.org\")'"

rule packrat_init:
    shell:
        "R -e 'packrat::init()'"

rule packrat_snap:
    shell:
        "R -e 'packrat::snapshot()'"

rule packrat_restore:
    shell:
        "R -e 'packrate::restore()'"

# --- Clean Rules --- #
rule clean:
    shell:
        "rm -rf out/* *.pdf"
