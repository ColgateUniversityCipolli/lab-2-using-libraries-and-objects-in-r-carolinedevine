
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

#first for loop here

# first album 
test.album <- album.directories[1]
# get all files from first album
all.files <- list.files(test.album, recursive = TRUE)
# count the number of files in the test album that are wav.
num.wav.files <- str_count(all.files, ".wav")
# make a subset of all of the .wav files
track.files <- all.files[num.wav.files == 1]

# empty vector 
code.to.process <- c()

# start second for loop here 

# first track file 
test.track <- track.files[1]
track.location <- paste(test.album, "/", test.track, sep = "")

track.name <- str_sub(test.track, start = 1, end = str_length(test.track)-4)
# character matrix of file number, artist, name
split.track.name <- str_split(track.name, "-", simplify = TRUE)
# track name (only the name not the number etc)
only.track.name <- split.track.name[3]
# artist name 
artist.name <- split.track.name[2]

# album name 
split.test.album <- str_split(test.album, "/", simplify = TRUE)
album.name <- split.test.album[3]

# [artist name]-[album name]-[track name].json
desired.output.file <- paste(artist.name,"-",album.name,"-",only.track.name, ".json", sep = "")

# command line (2.3.3.d)
command.line <- paste("streaming_extractor_music.exe", test.track, desired.output.file)

code.to.process <- c(code.to.process, command.line)

#end second for loop here 
# end first for loop here 

### Step 4 ###
