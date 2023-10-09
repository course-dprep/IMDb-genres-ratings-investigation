library(readr)
library(tidyverse)
library(data.table)

# CLEANING

# Seperate the columns since all variables were shown in 1 column
imdb_ratings <- fread("imdb_ratings.csv", header = TRUE, sep = "\t")
imdb_genres <- fread("imdb_genres.csv", header = TRUE, sep = "\t", fill = TRUE, quote = "")

# When dividing the dataset into correct columns, some data started with a double quotation mark and this had to be removed in order to merge the datasets correctly
imdb_genres$tconst <- gsub("^\"", "", imdb_genres$tconst)

# Some variables in the dataset for genres included a double quotation mark and also had to be removed for correct results
imdb_genres$genres <- gsub('"', '', imdb_genres$genres)

# Only include the variables needed for our project
imdb_genres <- data.frame(
  tconst = imdb_genres$tconst, 
  genres = imdb_genres$genres
)

imdb_ratings <- data.frame(
  tconst = imdb_ratings$tconst,
  average_ratings = imdb_ratings$averageRating
)

# Merge the `ratings` and `genres` into a single dataset. Inner_join is used here, since the variable "tconst" has more observations in the genres dataset than in the ratings dataset. inner_join makes sure that only the values that are the same in both datasets are included and others are excluded.
merged_ratings_genres <- inner_join(imdb_genres, imdb_ratings, by = "tconst")

# Extract all the genres, split by a comma
all_genres <- unlist(strsplit(merged_ratings_genres$genres, ","))

# Remove any values that are "\\N"
all_genres <- all_genres[all_genres != "\\N"]

# Extract all the unique genres from all the genres
unique_genres <- unique(all_genres)

# Find the average ratings for each genre
average_ratings <- merged_ratings_genres %>%
  group_by(genres) %>%
  summarise(Average_Rating = mean(average_ratings, na.rm = TRUE))

# Split the cells including multiple genres into separate rows
average_ratings <- average_ratings %>%
  separate_rows(genres, sep = ",")

# Remove any values that are "\\N"
average_ratings <- average_ratings %>%
  filter(genres != "\\N")

# Store the final data of the datasets in "data_merged.csv"
write_csv(average_ratings, file = "data_merged.csv")
