# Get paths to allele count files
file_paths = list.files(path = paste0(getwd(),"/data/filtered"), pattern = "\\.txt$", full.names=T)
#file_paths = list.files(path = paste0("/Users/nirwantandukar/Documents/BZea_files/rafael_RTIGER/allelic_count/filtered"), pattern = "\\.txt$", full.names=T)
file_paths = list.files(path = c("~/Desktop"), pattern = "\\.txt$", full.names=T)
file_paths <- file_paths[85]
# Get sample names
sampleIDs <- basename(file_paths)
# Remove the .txt extension and "allelicCounts" part from sampleIDs
sampleIDs <- gsub("\\.txt$", "", sampleIDs)
sampleIDs <- gsub("\\.allelicCounts$", "", sampleIDs)
#sampleIDs <- sampleIDs[1]
# Create the expDesign object
expDesign = data.frame(files=file_paths, name=sampleIDs)


# Get chromosome lengths for the example data included in the package
# chromosome length from the alleliccount file
# Create the "SN" and "chr" names
chr_len <- c(308452471,243675191,238017767,250330460,226353449,181357234,185808916,182411202,163004744,152435371)
chr_len <- c(182411202,163004744,152435371)
names(chr_len) <- c('chr1','chr2','chr3','chr4','chr5','chr6','chr7','chr8','chr9','chr10')
names(chr_len) <- c('chr8','chr9','chr10')

# Running the RTIGER function that identifies Introgression regions
output <- paste0(getwd(),"/results_trial/")
post_post.processing=TRUE
myres3 = RTIGER(expDesign = expDesign,
               outputdir = output,
               seqlengths = chr_len,
               rigidity = 350,
               autotune =F,
               average_coverage = 0.5,
               nstates = 3,
               #max.iter = 6,
               #crossovers_per_megabase = 0.01, 
               post.processing = post_post.processing,
               save.results = TRUE)
?RTIGER()
RTIGER::optimize_R(myres3,crossovers_per_megabase = 0.005, average_coverage = 0.5)

output <- paste0(getwd(),"/results/CO_0.05/")
post_post.processing=NULL
myres4 = RTIGER(expDesign = expDesign,
                outputdir = output,
                seqlengths = chr_len,
                rigidity = 400,
                autotune = F,
                average_coverage = 0.5,
                nstates = 3,
                #max.iter = 6,
                crossovers_per_megabase = 0.01, 
                post.processing = T,
                save.results = TRUE)



RTIGER::plotCOs(myres3)
RTIGER::calcCOnumber(myres3)

