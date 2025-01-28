
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




