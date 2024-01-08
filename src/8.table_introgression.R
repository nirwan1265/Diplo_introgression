install.packages("magick")
install.packages("pdftools")
library(magick)
library(pdftools)

table <- read.table("/Users/nirwantandukar/Library/Mobile Documents/com~apple~CloudDocs/Github/Introgression_Map/results_allalt/PN14_SID1278/CompleteBlock-state-PN14_SID1278.bed")


# Assuming your data is in a variable called 'table'
library(dplyr)

# Group by chromosome and summarise
result <- table %>%
  group_by(V1) %>%
  summarise(CO_chr = sum(V4 == "AB"), 
            "avg_len_chr(Mb)" = ifelse(any(V4 == "AB"), ((sum(V3[V4 == "AB"]- V2[V4 == "AB"]))/10000000)/CO_chr, 0))

# Rename columns to match your format
names(result) <- gsub("V1", "CO", names(result))
names(result) <- gsub("V1", "len", names(result))

# Add sample name
result$Sample <- "PN14_SID1272"

# Reorder columns to place 'Sample' first
result <- result[, c("Sample", names(result)[1:ncol(result)-1])]

# View the result
print(result)







library(dplyr)

table <- read.table("/Users/nirwantandukar/Library/Mobile Documents/com~apple~CloudDocs/Github/Introgression_Map/results_allalt/PN14_SID1283/CompleteBlock-state-PN14_SID1283.bed")
table

# Process the data
result <- table %>%
  mutate(CO_mark = ifelse(V4 %in% c("AB", "BB"), 1, 0)) %>%
  group_by(V1) %>%
  do({
    tbl <- .
    co_lengths <- c()
    i <- 1
    while (i <= nrow(tbl)) {
      if (tbl$CO_mark[i] == 1) {
        j <- i
        while (j <= nrow(tbl) && tbl$CO_mark[j] == 1) {
          j <- j + 1
        }
        co_lengths <- c(co_lengths, (tbl$V3[j - 1] - tbl$V2[i]) / 1e6) # Length in Mb
        i <- j
      } else {
        i <- i + 1
      }
    }
    CO_lengths_str <- ifelse(length(co_lengths) > 0, paste(co_lengths, collapse = ", "), "0")
    data.frame(V1 = unique(tbl$V1), CO_count = length(co_lengths), CO_lengths_Mb = CO_lengths_str)
  })

# View the result
print(result)





############
# FOR MANY TABLES:
############
library(dplyr)

# Define the base directory
base_dir <- "/Users/nirwantandukar/Library/Mobile Documents/com~apple~CloudDocs/Github/Introgression_Map/results_new_filtered_and_alt"

# Get a list of sample directories
sample_dirs <- list.files(base_dir, full.names = TRUE)

# Loop through each sample directory and process the data
for (sample_dir in sample_dirs) {
  sample_name <- basename(sample_dir)
  file_path <- file.path(sample_dir, paste0("CompleteBlock-state-", sample_name, ".bed"))
  
  # Check if the file exists
  if (file.exists(file_path)) {
    # Read the data, assuming no header
    table <- read.table(file_path, header = FALSE)
    
    # Process the data
    result_df <- table %>%
      mutate(CO_mark = ifelse(V4 %in% c("AB", "BB"), 1, 0)) %>%
      group_by(V1) %>%
      do({
        tbl <- .
        co_lengths <- c()
        i <- 1
        while (i <= nrow(tbl)) {
          if (tbl$CO_mark[i] == 1) {
            j <- i
            while (j <= nrow(tbl) && tbl$CO_mark[j] == 1) {
              j <- j + 1
            }
            co_lengths <- c(co_lengths, (tbl$V3[j - 1] - tbl$V2[i]) / 1e6)
            i <- j
          } else {
            i <- i + 1
          }
        }
        CO_lengths_str <- ifelse(length(co_lengths) > 0, paste(co_lengths, collapse = ", "), "0")
        data.frame(Sample = rep(sample_name, length(unique(tbl$V1))), Chromosome = unique(tbl$V1), CO_count = length(co_lengths), CO_lengths_Mb = CO_lengths_str)
      }) %>%
      ungroup()
    result_df <- result_df[,-1]
    # Assign result to a dataframe named after the sample folder
    assign(sample_name, result_df)
  }
}

# Dataframes are now created in the global environment with names matching the sample folders

# Initialize an empty dataframe for combined results
introgression <- data.frame()

# Loop through the names of the created dataframes and bind them row-wise
for (sample_name in sample_dirs) {
  sample_name <- basename(sample_name)
  # Check if a dataframe with the sample name exists in the environment
  if (exists(sample_name)) {
    # Bind the dataframes row-wise
    introgression <- rbind(introgression, get(sample_name))
  }
}

# View the combined dataframe
print(introgression)
#introgression <- introgression[which(introgression$CO_count != 0), ]

introgression[11:20,]
head(introgression)
str(introgression)

library(tidyr)
library(stringr)

# Convert CO_lengths_Mb to a list of numeric values
introgression1 <- introgression %>%
  mutate(CO_lengths_Mb = sapply(CO_lengths_Mb, function(x) {
    # Handle NA and "0" cases
    if(is.na(x) || x == "0") return(NA_real_)
    # Convert string to numeric values
    numeric_values <- as.numeric(unlist(strsplit(x, ",\\s*")))
    # Handle cases where conversion results in NA
    if(any(is.na(numeric_values))) return(NA_real_)
    return(sum(numeric_values))
  }))
introgression[1:10,]

introgression <- introgression %>%
  mutate(CO_lengths_Mb = sapply(CO_lengths_Mb, function(x) {
    if (x == "0") return(0)  # Convert "0" to numeric 0
    # Split the string into individual numbers and sum them
    sum(as.numeric(unlist(strsplit(x, ",\\s*"))), na.rm = TRUE)
  }, USE.NAMES = FALSE))


# Group by Sample and calculate the averages
result <- introgression %>%
  group_by(Sample) %>%
  summarize(
    Avg_no_CO = sum(CO_count),
    Total_Lengths_Sum_Mb = sum(CO_lengths_Mb, na.rm = TRUE),
    Avg_length_CO_Mb = ifelse(Avg_no_CO > 0, Total_Lengths_Sum_Mb / Avg_no_CO, 0)
  )

result
write.csv(result,"diplo_introgression_with_alt.csv")
