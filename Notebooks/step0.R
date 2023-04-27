

#' Find Lead Variants in a GWAS Summary Data 
#'
#' @param gwas_df  A Data Frame of GWAS Summary Statistics 
#' @param chr_col Column Name that contains CHROMOSOME
#' @param pos_col Column Name that contains SNP position
#' @param p_col Column Name that contains p-value 
#' @param p_cutoff A Genome-wide Significance cutoff (Default: 5E-08)
#' @param w_size  A window size to search Lead Variant(DEFAULT:500KB)
#'
#' @return A data frame of lead variants 
#' @export
#'
#' @examples 
#' #Reading  GWAS Summary Data 
#' gwas_df <-  read.table(gzfile("data/AGEN_adiponectin_hapmap.txt.gz"),
#' header=TRUE,fill=TRUE,row.names=NULL)
#' # Find Lead Variant
#'  lead_gwas_df <- leadVariants(gwas_df=gwas_df,chr_col="CHR",
#'  pos_col="POS",p_col="P",p_cutoff=5E-08,w_size=500000)


leadVariants <- function(gwas_df,chr_col,pos_col,p_col,
                         p_cutoff=5E-08,w_size=500000){
#Check if inputs are valid
checkmate::assertDataFrame(gwas_df,col.names = "named",min.cols = 3)
checkmate::assertCharacter(chr_col,len = 1,any.missing = FALSE )
checkmate::assertCharacter(pos_col,len = 1,any.missing = FALSE )
checkmate::assertCharacter(p_col,len = 1,any.missing = FALSE )
checkmate::assert_double(p_cutoff)
checkmate::assert_double(w_size)
#CHROM checks
if (inherits(try(str2lang(chr_col)),"try-error")){
  stop("`varName` must be a valid R expression",call. = FALSE)
}
.new <- intersect(names(gwas_df),chr_col )
if (length(.new) == 0L) stop("Column specified for Chromosome is not in original dataset")
#POS checks
if (inherits(try(str2lang(pos_col)),"try-error")){
  stop("`varName` must be a valid R expression",call. = FALSE)
}
.new <- intersect(names(gwas_df),pos_col )
if (length(.new) == 0L) stop("Column specified for POSITION is not in original dataset")
#PVALUE checks
if (inherits(try(str2lang(p_col)),"try-error")){
  stop("`varName` must be a valid R expression",call. = FALSE)
}
.new <- intersect(names(gwas_df),p_col )
if (length(.new) == 0L) stop("Column specified for P-Value is not in original dataset")


# Consider only significant variants 
gwas_new <- gwas_df%>%filter(get(p_col)<p_cutoff)

#CHROMSOME List 

chr_list <- unique(gwas_new[[chr_col]])

if (!is.numeric(chr_list)){ stop("Chromosome numbers in the data frame should be numeric.")}


lead_variants <- data.frame()
for (g in 1:length(chr_list)){
  
  pvalue_list <- (gwas_new%>%filter(get(chr_col)==chr_list[g])%>%
                    mutate(start=get(pos_col)-w_size,stop=get(pos_col)+w_size)%>%
                    arrange(start)%>% 
                    group_by(g = cumsum(cummax(lag(stop, default = first(stop))) < start)) %>% 
                    summarise(start = first(start), stop = max(stop),pvalue=min(get(p_col))))$pvalue
  l_df <- gwas_new %>%filter(get(chr_col)==chr_list[g])%>%filter(get(p_col) %in% pvalue_list)
  lead_variants  <- rbind(lead_variants,l_df)
}


return(lead_variants)

}





#' Construct Mapping Windows around the lead variant
#'
#' @param gwas_df  A Data Frame of Lead variants
#' @param chr_col Column Name that contains CHROMOSOME
#' @param pos_col Column Name that contains SNP position
#' @param p_col Column Name that contains p-value 
#' @param m_size A mapping window size in bp to pad lead variant(Default: 1.5MB upstream and 1.5MB downstream)
#' @return A data frame of lead variant Window sizes
#' @export
#'
#' @examples
.leadmapWindows <- function(gwas_df,chr_col,pos_col,p_col,m_size=1500000,...){
  #Check if inputs are valid
  checkmate::assertDataFrame(gwas_df,col.names = "named",min.cols = 3)
  checkmate::assertCharacter(chr_col,len = 1,any.missing = FALSE )
  checkmate::assertCharacter(pos_col,len = 1,any.missing = FALSE )
  checkmate::assertCharacter(p_col,len = 1,any.missing = FALSE )
  checkmate::assert_double(m_size)

  # Get lead variants
  lead_df <- leadVariants(gwas_df=gwas_df,chr_col=chr_col,
               pos_col=pos_col,p_col=p_col,p_cutoff=5E-08,w_size=500000)
  
# pad m_size 
lw_df <- lead_df%>%mutate(start=get(pos_col)-m_size,stop=get(pos_col)+m_size)%>%
  dplyr::select(chr_col,start,stop)%>%
  mutate(start=case_when(start<0~ 1,TRUE ~ as.double(start)))
return(lw_df)
  
}




