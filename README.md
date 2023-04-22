# GPScore 
The Gene Priority Score (GPScore) is a combinatorial likelihood scoring formalism based on measures derived from 11 gene prioritization strategies and the physical distance to the transcription start site (TSS). Using GPScore, you can prioritize the most probable target genes underlying the GWAS-associated variants.

Accompanying paper:

Sarsani, Vishal, Brotman, S. M., Yin Xianyong, Y., Lillian Fernandes Silva, L. F., Laakso,M., & Spracklen, C. N. (2023). A multi-ancestry genome-wide meta-analysis, fine-mapping, and gene prioritization approach to characterize the genetic architecture of adiponectin.

## Overview

Genome-Wide Association Studies(GWAS) for complex traits typically result in many significant loci across the genome. Translating these GWAS findings into treatments may require an understanding of target genes and their biological mechanisms. 

The genetic variants linked to a certain trait may not always affect the closest gene and can even impact protein levels located far away. Various methods exist to identify the genes affected by these variants, but they have limitations, such as not being customizable to relevant disease/tissue data and producing conflicting results. GPScore combines multiple gene prioritization strategies and the physical distance to transcription start sites, allowing for customization and unbiased scoring. It can be applied to complex traits with limited training data and does not have individual-level data.

![Gpscore](./work/gpscore.jpg)(height="20px" width="20px")


## Dependencies

Recommended OS: Any Linux. Mac OS is not supported but should be compatible.

Outputs from following software should be available in text or csv format to calculate GPScore:

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

