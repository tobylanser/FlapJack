if (!require("BiocManager", quietly = F))
  install.packages("BiocManager")

if (!require("Rsubread", quietly = F))
  BiocManager::install("Rsubread")

library(Rsubread)
source("source/fastqcr.R")

reads <- system.file("extdata", reads_path, package="Rsubread")
#align reads to the ref
list.files(path)
align.stat <- align(index="reference_index",
                    readfile1=reads,
                    output_file="alignResults.BAM",
                    phredOffset=64)
reads1 <- list.files(path = file.path(reads), pattern = "*1.fq.gz$", full.names = TRUE)
reads2 <- list.files(path = file.path(reads), pattern = "*2.fq.gz$", full.names = TRUE)
all.equal(length(reads1),length(reads2))

align(index = "hg19_g1k",
      readfile1 = reads1,
      readfile2 = reads2,
      type = "rna",
      input_format = "gzFASTQ",
      output_format = "BAM",
      PE_orientation = "rf",
      phredOffset=64,
      nthreads = parallel::detectCores())

trimmed_dir <-"~/Path/To/Files"
bam.files <- list.files(trimmed_dir, pattern = "BAM$")
bam.files