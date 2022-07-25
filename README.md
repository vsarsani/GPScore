# GenePrioritization
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

