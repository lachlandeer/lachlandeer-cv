# knit_rmd2
#
# this script takes an Rmd file command line argument
# and complies it using knitr
#
# Author: @lachlandeer
#

# --- Command Line Unpack --- #
args <- commandArgs(trailingOnly = TRUE)
rmd_file = args[1]
out_file = basename(args[2])
out_path = dirname(args[2])

# --- Path where we want our pdf to end up --- #
final_pdf = here::here(out_path, out_file)
print(final_pdf)

# --- Build file --- #
## knit R likes to build to its own directory, let's assemble what the
## name of the output will be
tmp_pdf = here::here(dirname(rmd_file), out_file)
## knit
rmarkdown::render(input = rmd_file, output_file = out_file, quiet=FALSE)

# --- Move build file --- #
file.rename(tmp_pdf, final_pdf)
