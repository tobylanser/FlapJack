if(!require(remotes)) install.packages("remotes")
if(!require(sack2)) remotes::install_github("wepelham3/sack2")
library(sack2)

cat("\n")
cat("Welcome to bulk RNA-seq analysis pipeline!\n")
cat("\n")
cat( "\n" )
cat("please enter a unique name for your experiment w/o spaces (i.e. bulkRNA_seq_test1): ");
exp_name <- readLines("stdin",n=1)
cat( "\n" )
cat( "\n" )
cat("please enter global path to where you would like to work from: ");
global_path <- readLines("stdin",n=1)
setwd(global_path)
cat( "\n" )
cat("We're first going to fun fastQC on your files to determine quality\n")
source("source/aligner.R")


# source_lines("aligner.R", start = 1, end = 10)
# cat( "\n" )
# cat( "\n" )
# cat("your results have been stored in : ", paste0(path, "/multi-qc-result"));
# cat( "\n" )
# cat( "\n" )
# cat("please check out the quality control of your sample before continuing. When finished, type 'done' ");
# cat( "\n" )
# cat( "\n" )
# cat("please enter an organism name (human or mouse): ");
# a <- readLines("stdin",n=1);
# cat("You entered '")
# cat(a)
# cat("' as your organism");
# cat( "\n" )
# cat( "\n" )
# 
# cat("please enter path to your reference file: ");
# ref_path <- readLines("stdin",n=1)
# cat( "\n" )
# cat( "\n" )
# 
# 
# ??align
# # steady plot code:
# # while(!is.null(dev.list())) Sys.sleep(1)
