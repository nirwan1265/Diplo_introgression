library(vroom)

setwd("/Users/nirwantandukar/Library/Mobile Documents/com~apple~CloudDocs/Github/Introgression_Map")

system("ls")
diplo=readRDS("diplo.RDS")
str(diplo$diplo_chr1$homo_hzygots)
head(str(diplo$diplo_chr1$homo_hzygots))
diplo$diplo_chr1$homo_hzygots
diplo$diplo_chr1$genotype_counts_df
diplo$diplo_chr1$genotype_counts_df$chromosome="chr1"
diplo$diplo_chr2$genotype_counts_df$chromosome="chr2"
diplo$diplo_chr3$genotype_counts_df$chromosome="chr3"
diplo$diplo_chr4$genotype_counts_df$chromosome="chr4"
diplo$diplo_chr5$genotype_counts_df$chromosome="chr5"
diplo$diplo_chr6$genotype_counts_df$chromosome="chr6"
diplo$diplo_chr7$genotype_counts_df$chromosome="chr7"
diplo$diplo_chr8$genotype_counts_df$chromosome="chr8"
diplo$diplo_chr9$genotype_counts_df$chromosome="chr9"
diplo$diplo_chr10$genotype_counts_df$chromosome="chr10"
str(diplo$diplo_chr2$genotype_counts_df)

df_list <- list(
  diplo$diplo_chr1$genotype_counts_df,
  diplo$diplo_chr2$genotype_counts_df,
  diplo$diplo_chr3$genotype_counts_df,
  diplo$diplo_chr4$genotype_counts_df,
  diplo$diplo_chr5$genotype_counts_df,
  diplo$diplo_chr6$genotype_counts_df,
  diplo$diplo_chr7$genotype_counts_df,
  diplo$diplo_chr8$genotype_counts_df,
  diplo$diplo_chr9$genotype_counts_df,
  diplo$diplo_chr10$genotype_counts_df
)

# Combining all data frames into one
combined_df <- do.call(rbind, df_list)
head(combined_df)
tail(combined_df)


#install.packages("dplyr")
library(reshape2)
library(dplyr)
#install.packages("vctrs")
#library(vctrs)

# First, make sure the row names (sample names) are a column in the data frame
combined_df$sample_name <- rownames(combined_df)

# Use melt to convert to long format
long_format_df <- melt(combined_df, id.vars = c("sample_name", "chromosome"))
str(long_format_df)
head(long_format_df)

# Sorting the long_format_df by sample_name and then by chromosome
sorted_long_format_df <- long_format_df %>% 
  arrange(sample_name, chromosome)
sorted_long_format_df[1:20,]


library(tidyr)


# Transforming the long format data frame into a wide format
wide_format_df <- sorted_long_format_df %>%
  spread(key = variable, value = value)
str(wide_format_df)
head(wide_format_df)
wide_format_df[1:20,]
write.csv(wide_format_df,"diplo_allele_freq.csv", row.names = F)




