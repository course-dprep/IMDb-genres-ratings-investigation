# Download requered packages
library(dplyr)
library(data.table)
library(tidyverse)

# Create datasets that only include the variables needed
my_data_genres <- fread("imdb_genres.gz", header = TRUE, sep = "\t")

only_genres <- data.frame(
  tconst = my_data_genres$tconst, 
  genres = my_data_genres$genres
  )

my_data_ratings <- fread("imdb_ratings.gz", header = TRUE, sep = "\t")

only_ratings <- data.frame(
  tconst = my_data_ratings$tconst,
  average_ratings = my_data_ratings$averageRating
)

# Resize the only_genre dataset to match the id's of the only_ratings dataset
only_genres <- only_genres[1:1348135, ]

# Merge on id
merged_ratings_genres <- inner_join(only_genres, only_ratings, by = "tconst")

# Save merged data to current working directory
save(merged_ratings_genres, file = "data_merged.RData")
