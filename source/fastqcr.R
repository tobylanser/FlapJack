
if(!require(devtools)) install.packages("devtools")
if(!require(fastqcr)) install.packages("fastqcr")
library(fastqcr)
cat( "\n" )
cat("please enter path to your folder with fastq files: ");
reads_path <- readLines("stdin",n=1)
cat( "\n" )
print(reads_path)
print(global_path)
fastqc(fq.dir = reads_path, # FASTQ files directory
       qc.dir = paste0(reads_path, "../FASTQC"), # Results direcory
       threads = parallel::detectCores()                    # Number of threads
)
qc.dir <- system.file(paste0(reads_path, "../FASTQC"), package = "fastqcr")
qc_report(qc.dir, result.file = paste0(reads_path, "../multi-qc-result"),
          experiment = exp_name)




