#file_paths = list.files(path = paste0("~/Desktop/BZea_files/mpileup/filtered"), pattern = "\\.txt$", full.names=T)
#file_paths = list.files(path = paste0("~/Documents/BZea_files/rafael_RTIGER/allelic_count/filtered/"), pattern = "\\.txt$", full.names=T)

file_paths = list.files(path = paste0(getwd(),"/data/filtered"), pattern = "\\.txt$", full.names=T)
# Define chromosome lengths and their names
chr_len_all <- c(chr1 = 308452471, chr2 = 243675191, chr3 = 238017767, chr4 = 250330460, chr5 = 226353449, chr6 = 181357234, chr7 = 185808916, chr8 = 182411202, chr9 = 163004744, chr10 = 152435371)

# Specify the output directory
output <- paste0(getwd(), "/results_new_filtered_and_alt_hetero/")


# Loop through each file
for (n in 1:length(file_paths)) {
  # Select the n-th file
  current_file_path <- file_paths[n]
  # Extract the sample ID
  sampleID <- gsub("\\.txt$", "", basename(current_file_path))
  sampleID <- gsub("\\.allelicCounts$", "", sampleID)
  
  # Create expDesign for the current file
  expDesign = data.frame(files = current_file_path, name = sampleID)
  
  # Extract the chromosome number and match the chromosome length
  #chr_num <- gsub(".*_chr(\\d+).*", "\\1", sampleID)
  #chr_len <- chr_len_all[paste0("chr", chr_num)]
  chr_len <- c(308452471,243675191,238017767,250330460,226353449,181357234,185808916,182411202,163004744,152435371)
  names(chr_len) <- c('chr1','chr2','chr3','chr4','chr5','chr6','chr7','chr8','chr9','chr10')
  # Run RTIGER for the current file
  myres3 <- RTIGER(expDesign = expDesign,
                   outputdir = output,
                   seqlengths = chr_len,
                   rigidity = 40,
                   autotune = T,
                   average_coverage = 0.5,
                   nstates = 3,
                   crossovers_per_megabase = 0.01, 
                   post.processing = F,
                   save.results = TRUE
                   )
  
  # Optional: Store results in a list or another structure
  # post_post.processing <- c(post_post.processing, myres3)
  
  # Optional: Print a message indicating the file has been processed
  cat(paste("Processed:", sampleID), "\n")
}

for (n in 1:length(file_paths)) {
  cat("Processing file number:", n, "\n")
  
  # Try-Catch block for error handling
  tryCatch({
    # Select the n-th file
    current_file_path <- file_paths[n]
    cat("Current file path:", current_file_path, "\n")
    
    # Extract the sample ID
    sampleID <- gsub("\\.txt$", "", basename(current_file_path))
    sampleID <- gsub("\\.allelicCounts$", "", sampleID)
    cat("Sample ID:", sampleID, "\n")
    
    # Create expDesign for the current file
    expDesign = data.frame(files = current_file_path, name = sampleID)
    
    # Extract the chromosome number and match the chromosome length
    #chr_num <- gsub(".*_chr(\\d+).*", "\\1", sampleID)
    #chr_len <- chr_len_all[paste0("chr", chr_num)]
    chr_len <- c(308452471,243675191,238017767,250330460,226353449,181357234,185808916,182411202,163004744,152435371)
    names(chr_len) <- c('chr1','chr2','chr3','chr4','chr5','chr6','chr7','chr8','chr9','chr10')
    
    # Run RTIGER for the current file
    myres3 <- RTIGER(expDesign = expDesign,
                     outputdir = output,
                     seqlengths = chr_len,
                     rigidity = 350,
                     autotune = T,
                     average_coverage = 0.5,
                     nstates = 3,
                     crossovers_per_megabase = 0.01, 
                     post.processing = T,
                     save.results = TRUE)
    
    cat("Processed:", sampleID, "\n")
  }, error = function(e) {
    cat("Error in processing file number", n, ": ", e$message, "\n")
  })
}

