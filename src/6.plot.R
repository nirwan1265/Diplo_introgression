# Load necessary library
library(ggplot2)

# Get the list file 
diplo <- readRDS("/Users/nirwantandukar/Documents/BZea_files/diplo.RDS")

# Open a new PNG device
png(file = "genotype_histograms.png", width = 1200, height = 3000)

# Total number of chromosomes
n_chromosomes <- length(results)

# Set up plot layout: 10 rows (one for each chromosome) and 3 columns (one for each percentage type)
par(mfrow = c(n_chromosomes, 3))

# Loop through each chromosome and plot histograms
for (chr_name in names(results)) {
  # Extract the genotype counts data frame
  genotype_counts_df <- results[[chr_name]]$genotype_counts_df
  
  # Histogram for homo_ref_perc
  hist(genotype_counts_df$homo_ref_perc, main = paste("Histogram of homo_ref_perc", chr_name), xlab = "homo_ref_perc", breaks = seq(70, 100, by = 0.5), col = "blue")
  
  # Histogram for homo_alt_perc
  hist(genotype_counts_df$homo_alt_perc, main = paste("Histogram of homo_alt_perc", chr_name), xlab = "homo_alt_perc", breaks = seq(0, 28, by = 0.2), col = "red")
  
  # Histogram for hetero_perc
  hist(genotype_counts_df$hetero_perc, main = paste("Histogram of hetero_perc", chr_name), xlab = "hetero_perc", breaks = seq(0, 4, by = 0.5), col = "green")
}

# Close the PNG device
dev.off()



# Initialize a data frame to store the averages
average_df <- data.frame(chromosome = character(), avg_homo_ref = numeric(), avg_hetero = numeric(), avg_homo_alt = numeric(), stringsAsFactors = FALSE)

# Loop through each chromosome and calculate averages
for (chr_name in names(results)) {
  # Extract the genotype counts data frame
  genotype_counts_df <- results[[chr_name]]$genotype_counts_df
  
  # Calculate averages
  avg_homo_ref <- mean(genotype_counts_df$homo_ref_perc)
  avg_hetero <- mean(genotype_counts_df$hetero_perc)
  avg_homo_alt <- mean(genotype_counts_df$homo_alt_perc)
  
  # Add to the data frame
  average_df <- rbind(average_df, data.frame(chromosome = chr_name, avg_homo_ref = avg_homo_ref, avg_hetero = avg_hetero, avg_homo_alt = avg_homo_alt))
}

# Display the resulting data frame
print(average_df)

average_df[11,] <- c("All_chrom", mean(average_df[,2]),mean(average_df[,3]),mean(average_df[,4]))
print(average_df)
# Optionally, write the data frame to a CSV file
#write.csv(average_df, "average_genotype_counts.csv", row.names = FALSE)