
#Assignment 2 (Tug Simmons)


#Task 4 : find csv files and save as object
csv_files <- list.files (path = "Data",pattern = ".csv",recursive = TRUE)

# Task 5 : how many files match
length(csv_files)

# Task 6 : open wingmass.csv files and store as R object named "df" using read.csv

list.files(pattern = "wingspan_vs_mass.csv",recursive = TRUE)
df <- read.csv(list.files(pattern = "wingspan_vs_mass.csv",recursive = TRUE))

# Task 7 : inspect first 5 lines using head () function
head(df, n=5)

# Task 8 : find any files recursively in data file that begin with letter "b"

list.files (path = "Data",pattern ="^b",recursive =TRUE)

# Task 9 : Write command that displays the first line of each of those "b" files

bfiles <- list.files (path = "Data",pattern ="^b",recursive =TRUE,full.names = TRUE)

readLines(bfiles[1],n = 1)
readLines(bfiles[2],n = 1)
readLines(bfiles[3],n = 1)

# for-loop
for(i in bfiles){
print(readLines(i,n - 1))
}
x <- c("Cool","Boring","Stupid")
for(i in x){
  print(paste0("your mom is ",i))
}

# Task 10 : Do the same for all files that end in ".csv"