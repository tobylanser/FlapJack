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
cat("\n")
if(!require(devtools)) install.packages("devtools")
if(!require(fastqcr)) install.packages("fastqcr")
library(fastqcr)
cat( "\n" )
cat("please enter path to your folder with fastq files: ");
reads_path <- readLines("stdin",n=1)
cat( "\n" )
fastqc(fq.dir = reads_path, # FASTQ files directory
       qc.dir = paste0(path, "/FASTQC"), # Results direcory
       threads = parallel::detectCores()                    # Number of threads
)
qc.dir <- system.file(paste0(path, "/FASTQC"), package = "fastqcr")
qc_report(qc.dir, result.file = paste0(path, "/multi-qc-result"),
          experiment = exp_name)
cat( "\n" )
cat( "\n" )
cat("your results have been stored in : ", paste0(path, "/multi-qc-result"));
cat( "\n" )
cat( "\n" )
cat("please check out the quality control of your sample before continuing. When finished, type 'done' ");
cat( "\n" )
cat( "\n" )
cat("please enter an organism name (human or mouse): ");
a <- readLines("stdin",n=1);
cat("You entered '")
cat(a)
cat("' as your organism");
cat( "\n" )
cat( "\n" )

cat("please enter path to your reference file: ");
ref_path <- readLines("stdin",n=1)
cat( "\n" )
cat( "\n" )
cat("please enter path to your folder with fastq files: ");
reads_path <- readLines("stdin",n=1)

if (!require("BiocManager", quietly = F))
  install.packages("BiocManager")



if (!require("Rsubread", quietly = F))
  BiocManager::install("Rsubread")

reads <- system.file("extdata", reads_path, package="Rsubread")
#align reads to the ref
list.files(path)
align.stat <- align(index="reference_index",
                    readfile1=reads,
                    output_file="alignResults.BAM",
                    phredOffset=64)

??align
# steady plot code:
# while(!is.null(dev.list())) Sys.sleep(1)