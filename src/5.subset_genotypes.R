#Get the samples
results <- readRDS(paste0(getwd(),"/diplo_all_het_alt.RDS"))

# List of columns to extract
# Reference Alternate and the 
columns_to_extract <- c("REF","ALT","AD.PN14_SID1274")

# Initialize an empty data frame to store the combined results
combined_df <- data.frame()

# Loop through each result and extract the desired columns
for (chr_name in names(results)) {
  # Extract the allele_info_df from the current result
  allele_info_df <- results[[chr_name]][["allele_info_df"]]
  #allele_info_df[1:5,1:5]
  # Check if all the desired columns are present
  if(all(columns_to_extract %in% colnames(allele_info_df))) {
    # Extract the desired columns and add a chromosome identifier
    subset_df <- allele_info_df[, columns_to_extract]
    subset_df$Chromosome <- gsub("diplo_", "", chr_name)  # remove "diplo_" prefix
    
    # Combine with the main data frame
    combined_df <- rbind(combined_df, subset_df)
  }
}

# Rename the data frame
combined_df <- setNames(combined_df, c("REF","ALT","SID1274", "Chromosome"))

# Output the combined data frame
head(combined_df)
nrow(combined_df)

# Remove the 'Chromosome' column
combined_df <- combined_df[, -ncol(combined_df)]

# Split the row names into 'chr' and 'position'
row_names_split <- strsplit(rownames(combined_df), "_")
combined_df$chr <- sapply(row_names_split, function(x) x[1])
combined_df$position <- sapply(row_names_split, function(x) x[2])

# Move 'chr' and 'position' to the first two columns
combined_df <- combined_df[, c("chr", "position", setdiff(names(combined_df), c("chr", "position")))]

# Output the modified data frame
rownames(combined_df) <- NULL
head(combined_df)


# Creating separate data frames for each SID
df_SID1274 <- combined_df[, c("chr", "position", "REF","ALT","SID1274")]
#df_SID1328 <- combined_df[, c("chr", "position", "REF","ALT","SID1328")]
#df_SID1319 <- combined_df[, c("chr", "position","REF","ALT", "SID1319")]
#df_PN14_SID1304 <- combined_df[, c("chr", "position","REF","ALT", "PN14_SID1304")]

# Displaying the head of each data frame
head(df_SID1274)

# Removing rows with '0,0' in SID1274
df_SID1274 <- df_SID1274[df_SID1274$SID1274 != "0,0", ]

# Removing rows with '0,0' in SID1328
#df_SID1328 <- df_SID1328[df_SID1328$SID1328 != "0,0", ]

# Removing rows with '0,0' in SID1319
#df_SID1319 <- df_SID1319[df_SID1319$SID1319 != "0,0", ]

# Removing rows with '0,0' in PN14_SID1304
#df_PN14_SID1304 <- df_PN14_SID1304[df_PN14_SID1304$PN14_SID1304 != "0,0", ]

# Displaying the head of each data frame
head(df_SID1274)



# Splitting the 'SID1274' column into two separate columns
df_SID1274_split <- strsplit(as.character(df_SID1274$SID1274), ",")
#df_SID1328_split <- strsplit(as.character(df_SID1328$SID1328), ",")
#df_SID1319_split <- strsplit(as.character(df_SID1319$SID1319), ",")
#df_PN14_SID1304_split <- strsplit(as.character(df_PN14_SID1304$PN14_SID1304), ",")

df_SID1274$REF_COUNT <- sapply(df_SID1274_split, function(x) x[1])
#df_SID1328$REF_COUNT <- sapply(df_SID1328_split, function(x) x[1])
#df_SID1319$REF_COUNT <- sapply(df_SID1319_split, function(x) x[1])
#df_PN14_SID1304$REF_COUNT <- sapply(df_PN14_SID1304_split, function(x) x[1])

df_SID1274$ALT_COUNT <- sapply(df_SID1274_split, function(x) x[2])
#df_SID1328$ALT_COUNT <- sapply(df_SID1328_split, function(x) x[2])
#df_SID1319$ALT_COUNT <- sapply(df_SID1319_split, function(x) x[2])
#df_PN14_SID1304$ALT_COUNT <- sapply(df_PN14_SID1304_split, function(x) x[2])

# Rearrange the columns and remove the original 'SID1274' column
df_SID1274 <- df_SID1274[, c("chr", "position", "REF", "REF_COUNT", "ALT", "ALT_COUNT")]
#df_SID1328 <- df_SID1328[, c("chr", "position", "REF", "REF_COUNT", "ALT", "ALT_COUNT")]
#df_SID1319 <- df_SID1319[, c("chr", "position", "REF", "REF_COUNT", "ALT", "ALT_COUNT")]
#df_PN14_SID1304 <- df_PN14_SID1304[, c("chr", "position", "REF", "REF_COUNT", "ALT", "ALT_COUNT")]

# Displaying the head of the modified data frame
head(df_SID1274)
df_SID1274 <- na.omit(df_SID1274)
head(df_SID1274)

getwd()
write.table(df_SID1274,"data/SID1274_joint_genotype_basic_althetero.tsv",sep="\t",row.names = F, col.names=F, quote=F)
#write.table(df_SID1328,"data/SID1328.tsv",sep="\t",row.names = F, col.names=F, quote=F)
#write.table(df_SID1319,"data/SID1319.tsv",sep="\t",row.names = F, col.names=F, quote=F)
#write.table(df_PN14_SID1304,"data/SID1304.tsv",sep="\t",row.names = F, col.names=F, quote=F)
