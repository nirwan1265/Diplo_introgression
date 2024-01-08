# Set the directory path to your data folder
data_folder <- paste0(getwd(), "/data")
data_folder <- "~/Documents//BZea_files/rafael_RTIGER/allelic_count/"
# Create the "data/filtered" directory if it doesn't exist
filtered_folder <- file.path(data_folder, "filtered")
if (!dir.exists(filtered_folder)) {
  dir.create(filtered_folder)
}

# List all .tsv files in the data folder with full paths
tsv_files <- list.files(path = data_folder, pattern = "\\.tsv$", full.names = TRUE)

# Define the valid chromosome names you want to keep
valid_chromosomes <- paste0("chr", c(1))

# Loop through each .tsv file, remove header lines, reorder columns, remove the first row, and save as .txt separately
# Loop through each .tsv file
for (file_path in tsv_files) {
  # Read the .tsv file
  data <- read.delim(file_path, header = FALSE, sep = "\t", stringsAsFactors = FALSE, row.names = NULL, comment.char = "@")
  
  # Preprocess the data as before
  data <- data[!grepl("^@", data[, 1]), ]
  data <- data[, c(1, 2, 5, 3, 6, 4)]
  data <- data[-1, ]
  data <- data[!(data[,4] == 0 & data[,6] == 0), ]
  
  # Get the base file name without extension
  file_name <- tools::file_path_sans_ext(basename(file_path))
  
  # Get unique chromosomes present in the data
  unique_chromosomes <- unique(data[, 1])
  
  # Loop through each unique chromosome
  for (chromosome in unique_chromosomes) {
    # Filter data for the current chromosome
    chromosome_data <- data[data[, 1] == chromosome, ]
    
    # Define the save path with chromosome in the file name
    save_path <- file.path(filtered_folder, paste0(file_name, "_", chromosome, ".txt"))
    
    # Save the chromosome-specific data
    write.table(chromosome_data, file = save_path, sep = "\t", col.names = FALSE, row.names = FALSE, quote = FALSE)
    
    # Print a message indicating the file has been processed and saved
    cat(paste("Processed and saved:", save_path), "\n")
  }
}
rm(data)
