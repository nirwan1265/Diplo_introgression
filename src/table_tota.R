
system("ls")
diplo <- readRDS("diplo.RDS")
diplo_prior <- readRDS("diplo_prior.RDS")
diplo_hetero_0.015 <- readRDS("diplo_hetero.RDS")
diplo_hetero_0.15 <- readRDS("diplo_hetero0.15.RDS")

# x1 <- diplo$diplo_chr1$genotype_counts_df
# x2 <- diplo_prior$diplo_chr1$genotype_counts_df
# x3 <- diplo_hetero_0.015$diplo_chr1$genotype_counts_df
# x4 <- diplo_hetero_0.15$diplo_chr1$genotype_counts_df

##### ALTERNATE

x1_R_alt_chr1 <- sum(diplo$diplo_chr1$genotype_counts_df$homo_alt)
x2_R_alt_chr1 <- sum(diplo_prior$diplo_chr1$genotype_counts_df$homo_alt)
x3_R_alt_chr1 <- sum(diplo_hetero_0.015$diplo_chr1$genotype_counts_df$homo_alt)
x4_R_alt_chr1 <- sum(diplo_hetero_0.15$diplo_chr1$genotype_counts_df$homo_alt)

x1_R_alt_chr2 <- sum(diplo$diplo_chr2$genotype_counts_df$homo_alt)
x2_R_alt_chr2 <- sum(diplo_prior$diplo_chr2$genotype_counts_df$homo_alt)
x3_R_alt_chr2 <- sum(diplo_hetero_0.015$diplo_chr2$genotype_counts_df$homo_alt)
x4_R_alt_chr2 <- sum(diplo_hetero_0.15$diplo_chr2$genotype_counts_df$homo_alt)

x1_R_alt_chr3 <- sum(diplo$diplo_chr3$genotype_counts_df$homo_alt)
x2_R_alt_chr3 <- sum(diplo_prior$diplo_chr3$genotype_counts_df$homo_alt)
x3_R_alt_chr3 <- sum(diplo_hetero_0.015$diplo_chr3$genotype_counts_df$homo_alt)
x4_R_alt_chr3 <- sum(diplo_hetero_0.15$diplo_chr3$genotype_counts_df$homo_alt)

x1_R_alt_chr4 <- sum(diplo$diplo_chr4$genotype_counts_df$homo_alt)
x2_R_alt_chr4 <- sum(diplo_prior$diplo_chr4$genotype_counts_df$homo_alt)
x3_R_alt_chr4 <- sum(diplo_hetero_0.015$diplo_chr4$genotype_counts_df$homo_alt)
x4_R_alt_chr4 <- sum(diplo_hetero_0.15$diplo_chr4$genotype_counts_df$homo_alt)

x1_R_alt_chr5 <- sum(diplo$diplo_chr5$genotype_counts_df$homo_alt)
x2_R_alt_chr5 <- sum(diplo_prior$diplo_chr5$genotype_counts_df$homo_alt)
x3_R_alt_chr5 <- sum(diplo_hetero_0.015$diplo_chr5$genotype_counts_df$homo_alt)
x4_R_alt_chr5 <- sum(diplo_hetero_0.15$diplo_chr5$genotype_counts_df$homo_alt)

x1_R_alt_chr6 <- sum(diplo$diplo_chr6$genotype_counts_df$homo_alt)
x2_R_alt_chr6 <- sum(diplo_prior$diplo_chr6$genotype_counts_df$homo_alt)
x3_R_alt_chr6 <- sum(diplo_hetero_0.015$diplo_chr6$genotype_counts_df$homo_alt)
x4_R_alt_chr6 <- sum(diplo_hetero_0.15$diplo_chr6$genotype_counts_df$homo_alt)

x1_R_alt_chr7 <- sum(diplo$diplo_chr7$genotype_counts_df$homo_alt)
x2_R_alt_chr7 <- sum(diplo_prior$diplo_chr7$genotype_counts_df$homo_alt)
x3_R_alt_chr7 <- sum(diplo_hetero_0.015$diplo_chr7$genotype_counts_df$homo_alt)
x4_R_alt_chr7 <- sum(diplo_hetero_0.15$diplo_chr7$genotype_counts_df$homo_alt)

x1_R_alt_chr8 <- sum(diplo$diplo_chr8$genotype_counts_df$homo_alt)
x2_R_alt_chr8 <- sum(diplo_prior$diplo_chr8$genotype_counts_df$homo_alt)
x3_R_alt_chr8 <- sum(diplo_hetero_0.015$diplo_chr8$genotype_counts_df$homo_alt)
x4_R_alt_chr8 <- sum(diplo_hetero_0.15$diplo_chr8$genotype_counts_df$homo_alt)

x1_R_alt_chr9 <- sum(diplo$diplo_chr9$genotype_counts_df$homo_alt)
x2_R_alt_chr9 <- sum(diplo_prior$diplo_chr9$genotype_counts_df$homo_alt)
x3_R_alt_chr9 <- sum(diplo_hetero_0.015$diplo_chr9$genotype_counts_df$homo_alt)
x4_R_alt_chr9 <- sum(diplo_hetero_0.15$diplo_chr9$genotype_counts_df$homo_alt)

x1_R_alt_chr10 <- sum(diplo$diplo_chr10$genotype_counts_df$homo_alt)
x2_R_alt_chr10 <- sum(diplo_prior$diplo_chr10$genotype_counts_df$homo_alt)
x3_R_alt_chr10 <- sum(diplo_hetero_0.015$diplo_chr10$genotype_counts_df$homo_alt)
x4_R_alt_chr10 <- sum(diplo_hetero_0.15$diplo_chr10$genotype_counts_df$homo_alt)

x1_diplo_alt_tot <- sum(x1_R_alt_chr1,x1_R_alt_chr2,x1_R_alt_chr3,x1_R_alt_chr4,
                         x1_R_alt_chr5,x1_R_alt_chr6,x1_R_alt_chr7,x1_R_alt_chr8,
                         x1_R_alt_chr9,x1_R_alt_chr10)
x2_diplo_prior_alt_tot <- sum(x2_R_alt_chr1,x2_R_alt_chr2,x2_R_alt_chr3,x2_R_alt_chr4,
                              x2_R_alt_chr5,x2_R_alt_chr6,x2_R_alt_chr7,x2_R_alt_chr8,
                              x2_R_alt_chr9,x2_R_alt_chr10)
x3_diplo_hetero_0.05_alt_tot <- sum(x3_R_alt_chr1,x3_R_alt_chr2,x3_R_alt_chr3,x3_R_alt_chr4,
                                x3_R_alt_chr5,x3_R_alt_chr6,x3_R_alt_chr7,x3_R_alt_chr8,
                                x3_R_alt_chr9,x3_R_alt_chr10)
x4_diplo_hetero_0.15_alt_tot <- sum(x4_R_alt_chr1,x4_R_alt_chr2,x4_R_alt_chr3,x4_R_alt_chr4,
                                x4_R_alt_chr5,x4_R_alt_chr6,x4_R_alt_chr7,x4_R_alt_chr8,
                                x4_R_alt_chr9,x4_R_alt_chr10)



# REF:
x1_R_ref_chr1 <- sum(diplo$diplo_chr1$genotype_counts_df$homo_ref)
x2_R_ref_chr1 <- sum(diplo_prior$diplo_chr1$genotype_counts_df$homo_ref)
x3_R_ref_chr1 <- sum(diplo_hetero_0.015$diplo_chr1$genotype_counts_df$homo_ref)
x4_R_ref_chr1 <- sum(diplo_hetero_0.15$diplo_chr1$genotype_counts_df$homo_ref)

x1_R_ref_chr2 <- sum(diplo$diplo_chr2$genotype_counts_df$homo_ref)
x2_R_ref_chr2 <- sum(diplo_prior$diplo_chr2$genotype_counts_df$homo_ref)
x3_R_ref_chr2 <- sum(diplo_hetero_0.015$diplo_chr2$genotype_counts_df$homo_ref)
x4_R_ref_chr2 <- sum(diplo_hetero_0.15$diplo_chr2$genotype_counts_df$homo_ref)

x1_R_ref_chr3 <- sum(diplo$diplo_chr3$genotype_counts_df$homo_ref)
x2_R_ref_chr3 <- sum(diplo_prior$diplo_chr3$genotype_counts_df$homo_ref)
x3_R_ref_chr3 <- sum(diplo_hetero_0.015$diplo_chr3$genotype_counts_df$homo_ref)
x4_R_ref_chr3 <- sum(diplo_hetero_0.15$diplo_chr3$genotype_counts_df$homo_ref)

x1_R_ref_chr4 <- sum(diplo$diplo_chr4$genotype_counts_df$homo_ref)
x2_R_ref_chr4 <- sum(diplo_prior$diplo_chr4$genotype_counts_df$homo_ref)
x3_R_ref_chr4 <- sum(diplo_hetero_0.015$diplo_chr4$genotype_counts_df$homo_ref)
x4_R_ref_chr4 <- sum(diplo_hetero_0.15$diplo_chr4$genotype_counts_df$homo_ref)

x1_R_ref_chr5 <- sum(diplo$diplo_chr5$genotype_counts_df$homo_ref)
x2_R_ref_chr5 <- sum(diplo_prior$diplo_chr5$genotype_counts_df$homo_ref)
x3_R_ref_chr5 <- sum(diplo_hetero_0.015$diplo_chr5$genotype_counts_df$homo_ref)
x4_R_ref_chr5 <- sum(diplo_hetero_0.15$diplo_chr5$genotype_counts_df$homo_ref)

x1_R_ref_chr6 <- sum(diplo$diplo_chr6$genotype_counts_df$homo_ref)
x2_R_ref_chr6 <- sum(diplo_prior$diplo_chr6$genotype_counts_df$homo_ref)
x3_R_ref_chr6 <- sum(diplo_hetero_0.015$diplo_chr6$genotype_counts_df$homo_ref)
x4_R_ref_chr6 <- sum(diplo_hetero_0.15$diplo_chr6$genotype_counts_df$homo_ref)

x1_R_ref_chr7 <- sum(diplo$diplo_chr7$genotype_counts_df$homo_ref)
x2_R_ref_chr7 <- sum(diplo_prior$diplo_chr7$genotype_counts_df$homo_ref)
x3_R_ref_chr7 <- sum(diplo_hetero_0.015$diplo_chr7$genotype_counts_df$homo_ref)
x4_R_ref_chr7 <- sum(diplo_hetero_0.15$diplo_chr7$genotype_counts_df$homo_ref)

x1_R_ref_chr8 <- sum(diplo$diplo_chr8$genotype_counts_df$homo_ref)
x2_R_ref_chr8 <- sum(diplo_prior$diplo_chr8$genotype_counts_df$homo_ref)
x3_R_ref_chr8 <- sum(diplo_hetero_0.015$diplo_chr8$genotype_counts_df$homo_ref)
x4_R_ref_chr8 <- sum(diplo_hetero_0.15$diplo_chr8$genotype_counts_df$homo_ref)

x1_R_ref_chr9 <- sum(diplo$diplo_chr9$genotype_counts_df$homo_ref)
x2_R_ref_chr9 <- sum(diplo_prior$diplo_chr9$genotype_counts_df$homo_ref)
x3_R_ref_chr9 <- sum(diplo_hetero_0.015$diplo_chr9$genotype_counts_df$homo_ref)
x4_R_ref_chr9 <- sum(diplo_hetero_0.15$diplo_chr9$genotype_counts_df$homo_ref)

x1_R_ref_chr10 <- sum(diplo$diplo_chr10$genotype_counts_df$homo_ref)
x2_R_ref_chr10 <- sum(diplo_prior$diplo_chr10$genotype_counts_df$homo_ref)
x3_R_ref_chr10 <- sum(diplo_hetero_0.015$diplo_chr10$genotype_counts_df$homo_ref)
x4_R_ref_chr10 <- sum(diplo_hetero_0.15$diplo_chr10$genotype_counts_df$homo_ref)

x1_diplo_ref_tot <- sum(x1_R_ref_chr1,x1_R_ref_chr2,x1_R_ref_chr3,x1_R_ref_chr4,
                        x1_R_ref_chr5,x1_R_ref_chr6,x1_R_ref_chr7,x1_R_ref_chr8,
                        x1_R_ref_chr9,x1_R_ref_chr10)
x2_diplo_prior_ref_tot <- sum(x2_R_ref_chr1,x2_R_ref_chr2,x2_R_ref_chr3,x2_R_ref_chr4,
                              x2_R_ref_chr5,x2_R_ref_chr6,x2_R_ref_chr7,x2_R_ref_chr8,
                              x2_R_ref_chr9,x2_R_ref_chr10)
x3_diplo_hetero_0.05_ref_tot <- sum(x3_R_ref_chr1,x3_R_ref_chr2,x3_R_ref_chr3,x3_R_ref_chr4,
                                x3_R_ref_chr5,x3_R_ref_chr6,x3_R_ref_chr7,x3_R_ref_chr8,
                                x3_R_ref_chr9,x3_R_ref_chr10)
x4_diplo_hetero_0.15_ref_tot <- sum(x4_R_ref_chr1,x4_R_ref_chr2,x4_R_ref_chr3,x4_R_ref_chr4,
                                x4_R_ref_chr5,x4_R_ref_chr6,x4_R_ref_chr7,x4_R_ref_chr8,
                                x4_R_ref_chr9,x4_R_ref_chr10)



# Hetero:
x1_R_hetero_chr1 <- sum(diplo$diplo_chr1$genotype_counts_df$hetero)
x2_R_hetero_chr1 <- sum(diplo_prior$diplo_chr1$genotype_counts_df$hetero)
x3_R_hetero_chr1 <- sum(diplo_hetero_0.015$diplo_chr1$genotype_counts_df$hetero)
x4_R_hetero_chr1 <- sum(diplo_hetero_0.15$diplo_chr1$genotype_counts_df$hetero)

x1_R_hetero_chr2 <- sum(diplo$diplo_chr2$genotype_counts_df$hetero)
x2_R_hetero_chr2 <- sum(diplo_prior$diplo_chr2$genotype_counts_df$hetero)
x3_R_hetero_chr2 <- sum(diplo_hetero_0.015$diplo_chr2$genotype_counts_df$hetero)
x4_R_hetero_chr2 <- sum(diplo_hetero_0.15$diplo_chr2$genotype_counts_df$hetero)

x1_R_hetero_chr3 <- sum(diplo$diplo_chr3$genotype_counts_df$hetero)
x2_R_hetero_chr3 <- sum(diplo_prior$diplo_chr3$genotype_counts_df$hetero)
x3_R_hetero_chr3 <- sum(diplo_hetero_0.015$diplo_chr3$genotype_counts_df$hetero)
x4_R_hetero_chr3 <- sum(diplo_hetero_0.15$diplo_chr3$genotype_counts_df$hetero)

x1_R_hetero_chr4 <- sum(diplo$diplo_chr4$genotype_counts_df$hetero)
x2_R_hetero_chr4 <- sum(diplo_prior$diplo_chr4$genotype_counts_df$hetero)
x3_R_hetero_chr4 <- sum(diplo_hetero_0.015$diplo_chr4$genotype_counts_df$hetero)
x4_R_hetero_chr4 <- sum(diplo_hetero_0.15$diplo_chr4$genotype_counts_df$hetero)

x1_R_hetero_chr5 <- sum(diplo$diplo_chr5$genotype_counts_df$hetero)
x2_R_hetero_chr5 <- sum(diplo_prior$diplo_chr5$genotype_counts_df$hetero)
x3_R_hetero_chr5 <- sum(diplo_hetero_0.015$diplo_chr5$genotype_counts_df$hetero)
x4_R_hetero_chr5 <- sum(diplo_hetero_0.15$diplo_chr5$genotype_counts_df$hetero)

x1_R_hetero_chr6 <- sum(diplo$diplo_chr6$genotype_counts_df$hetero)
x2_R_hetero_chr6 <- sum(diplo_prior$diplo_chr6$genotype_counts_df$hetero)
x3_R_hetero_chr6 <- sum(diplo_hetero_0.015$diplo_chr6$genotype_counts_df$hetero)
x4_R_hetero_chr6 <- sum(diplo_hetero_0.15$diplo_chr6$genotype_counts_df$hetero)

x1_R_hetero_chr7 <- sum(diplo$diplo_chr7$genotype_counts_df$hetero)
x2_R_hetero_chr7 <- sum(diplo_prior$diplo_chr7$genotype_counts_df$hetero)
x3_R_hetero_chr7 <- sum(diplo_hetero_0.015$diplo_chr7$genotype_counts_df$hetero)
x4_R_hetero_chr7 <- sum(diplo_hetero_0.15$diplo_chr7$genotype_counts_df$hetero)

x1_R_hetero_chr8 <- sum(diplo$diplo_chr8$genotype_counts_df$hetero)
x2_R_hetero_chr8 <- sum(diplo_prior$diplo_chr8$genotype_counts_df$hetero)
x3_R_hetero_chr8 <- sum(diplo_hetero_0.015$diplo_chr8$genotype_counts_df$hetero)
x4_R_hetero_chr8 <- sum(diplo_hetero_0.15$diplo_chr8$genotype_counts_df$hetero)

x1_R_hetero_chr9 <- sum(diplo$diplo_chr9$genotype_counts_df$hetero)
x2_R_hetero_chr9 <- sum(diplo_prior$diplo_chr9$genotype_counts_df$hetero)
x3_R_hetero_chr9 <- sum(diplo_hetero_0.015$diplo_chr9$genotype_counts_df$hetero)
x4_R_hetero_chr9 <- sum(diplo_hetero_0.15$diplo_chr9$genotype_counts_df$hetero)

x1_R_hetero_chr10 <- sum(diplo$diplo_chr10$genotype_counts_df$hetero)
x2_R_hetero_chr10 <- sum(diplo_prior$diplo_chr10$genotype_counts_df$hetero)
x3_R_hetero_chr10 <- sum(diplo_hetero_0.015$diplo_chr10$genotype_counts_df$hetero)
x4_R_hetero_chr10 <- sum(diplo_hetero_0.15$diplo_chr10$genotype_counts_df$hetero)

x1_diplo_hetero_tot <- sum(x1_R_hetero_chr1,x1_R_hetero_chr2,x1_R_hetero_chr3,x1_R_hetero_chr4,
                           x1_R_hetero_chr5,x1_R_hetero_chr6,x1_R_hetero_chr7,x1_R_hetero_chr8,
                           x1_R_hetero_chr9,x1_R_hetero_chr10)
x2_diplo_prior_hetero_tot <- sum(x2_R_hetero_chr1,x2_R_hetero_chr2,x2_R_hetero_chr3,x2_R_hetero_chr4,
                                 x2_R_hetero_chr5,x2_R_hetero_chr6,x2_R_hetero_chr7,x2_R_hetero_chr8,
                                 x2_R_hetero_chr9,x2_R_hetero_chr10)
x3_diplo_hetero_0.05_heter_tot <- sum(x3_R_hetero_chr1,x3_R_hetero_chr2,x3_R_hetero_chr3,x3_R_hetero_chr4,
                                      x3_R_hetero_chr5,x3_R_hetero_chr6,x3_R_hetero_chr7,x3_R_hetero_chr8,
                                      x3_R_hetero_chr9,x3_R_hetero_chr10)
x4_diplo_hetero_0.15_heter_tot <- sum(x4_R_hetero_chr1,x4_R_hetero_chr2,x4_R_hetero_chr3,x4_R_hetero_chr4,
                                      x4_R_hetero_chr5,x4_R_hetero_chr6,x4_R_hetero_chr7,x4_R_hetero_chr8,
                                      x4_R_hetero_chr9,x4_R_hetero_chr10)

table_diplo <- data.frame(GATK_method=c("Default","GATK_prior_0.85_0.1","GATK_hetero_0.05","GATK_hetero_0.15"),
                          Homo_ref =c(x1_diplo_ref_tot,x2_diplo_prior_ref_tot,x3_diplo_hetero_0.05_ref_tot,x4_diplo_hetero_0.15_ref_tot),
                          Heter=c(x1_diplo_hetero_tot,x2_diplo_prior_hetero_tot,x3_diplo_hetero_0.05_heter_tot,x4_diplo_hetero_0.15_heter_tot),
                          Homo_alt=c(x1_diplo_alt_tot,x2_diplo_prior_alt_tot,x3_diplo_hetero_0.05_alt_tot,x4_diplo_hetero_0.15_alt_tot))
str(table_diplo)
library(dplyr)
table_diplo <- table_diplo %>%
  mutate(
    Total = Homo_ref + Heter + Homo_alt,
    Homo_ref_perc = (Homo_ref / Total) * 100,
    Heter_perc = (Heter / Total) * 100,
    Homo_alt_perc = (Homo_alt / Total) * 100
  )
