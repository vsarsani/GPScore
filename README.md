# GenePrioritization ( Under Construction)
A Gene Prioritization Framework designed for the summary GWAS Studies of the complex traits.

Accompanying paper:



## Overview

Genome-Wide Association Studies(GWAS) for complex traits typically result in the many significant loci across the genome. Translating these GWAS findings into treatments may require an understanding of causal variants, target genes, and their biological mechanisms. 

Identifying the underlying target genes for significant GWAS loci has the following challenges :a) Causal SNPs do not necessarily regulate the closest genes. b) Using only gene expression quantitative trait loci (eQTL)  or functional genomics approaches may explain the limited proportion of heritability. c) Locus-specific identification is challenging given the annotation quality. 


Here we propose a gene prioritization framework to overcome this challenges. 


## Dependencies

Recommended OS: Linux. Mac OS is not supported but should be compatible.

The following software should be available from your user path:

- [Nextflow](https://www.nextflow.io/)
- [PLINK 1.9](https://www.cog-genomics.org/plink/1.9/)
- [MAGMA](https://ctg.cncr.nl/software/magma)
- [PoPS](https://github.com/FinucaneLab/pops)

The following [R](https://www.r-project.org/) (version 4.2.0) packages are required:

   - [tidyverse](https://www.tidyverse.org/) 
   - [devtools](https://CRAN.R-project.org/package=devtools) 



## Installation

Clone this repository on your system and install any missing dependencies. Estimated installation time (dependencies): 5-15 minutes.

## Example dataset

A dataset is taken from Asian Genetic Epidemiology Network (AGEN : https://blog.nus.edu.sg/agen/).
GWAS meta-analysis (imputed to HapMap2) for adiponectin levels in up to 7,825 East Asians.


```{bash}
zcat data/AGEN_adiponectin_hapmap.txt.gz|head -5
```

This script will also verify whether required R packages are available and install them otherwise.



The expected results for the analysis of this toy dataset are provided in the directory `results/` 

## Tutorial

A guided step-by-step analysis of the above toy dataset will be available soon:


## Large-scale applications

Our Nextflow pipeline allows the code contained in each of the R and shell scripts to be easily deployed on a computing cluster for large-scale applications.



## Authors

   - [Vishal Sarsani]((https://vishalsarsani.com) (University of Massachusetts Amherst).



## License

This software is distributed under the [GPLv3 license](https://www.gnu.org/licenses/gpl-3.0.en.html).

## Further references

Read more about the broader framework of .

