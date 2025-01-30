
################################################################################
# Lab 2
# Caroline Devine
################################################################################

################################################################################
# Task 1: Build a Batch File for Data Processing
################################################################################

# Step 0
install.packages("stringr")
library("stringr")
help("stringr")

### Step 1 ###
# list all of the directories in Music
all.directories <- list.dirs("Music", recursive = TRUE)

### Step 2 ###

# count number of slashes in each directory
num.of.forwardslashes <- str_count(all.directories, "/")

# used count to subset all album 
  album.directories <- all.directories[num.of.forwardslashes == 2 ]

### Step 3 ###
# empty vector 
code.to.process <- c()
output.file <- c()
#first for loop here
for (i in 1:length(album.directories)){
  # album 
  curr.album <- album.directories[i]
  # get all files from first album
  all.files <- list.files(curr.album, recursive = TRUE)
  # count the number of files in the test album that are wav.
  num.wav.files <- str_count(all.files, ".wav")
  # make a subset of all of the .wav files
  track.files <- all.files[num.wav.files > 0]
  
  # start second for loop here 
  for (i in 1:length(track.files)) {
    # first track file 
    curr.track <- track.files[i]
    track.location <- paste(curr.album, "/", curr.track, sep = "")
        
    track.name <- str_sub(curr.track, start = 1, end = str_length(curr.track)-4)
    # character matrix of file number, artist, name
    split.track.name <- str_split(track.name, "-", simplify = TRUE)
    # track name (only the name not the number etc)
    only.track.name <- split.track.name[3]
    # artist name 
    artist.name <- split.track.name[2]
        
    # album name 
    split.test.album <- str_split(curr.album, "/", simplify = TRUE)
    album.name <- split.test.album[3]
        
    # [artist name]-[album name]-[track name].json
    desired.output.file <- paste(artist.name,"-",album.name,"-",only.track.name, ".json", sep = "")
    output.file <- c(output.file, desired.output.file)
    
    # command line (2.3.3.d)
    command.line <- paste("streaming_extractor_music.exe", " ", '"', curr.track,'"', " ",'"', desired.output.file,'"', sep = "")
    code.to.process <- c(code.to.process, command.line)
    
    # end second for loop here 
    }
} # end first for loop here 

### Step 4 ###
writeLines(code.to.process, "batfile.txt")
code.to.process. # for checking 
output.file  # for checking 


################################################################################
# Task 2: Process JSON Output
################################################################################

# Step 0 
install.packages("jsonlite")
library("jsonlite")
library("stringr")
help("jsonlite")

# Step 1

# storage of file names
file.name.storage <- c()
json.storage <- c()

# start for loop here 
for (i in 1:length(output.file)) {
  file <- output.file[i]
  file.parts <- str_split(file, "-", simplify = TRUE)
  artist.file <- file.parts[1]
  album.file <- file.parts[2]
  track.file <- file.parts[3]
  
  json.storage[[i]] <- fromJSON(file)
  
}
# end for loop here 
json.storage
  

