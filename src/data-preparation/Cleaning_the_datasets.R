library(readr)
library(tidyverse)
library(data.table)

# CLEANING

# Seperate the columns since all variables were shown in 1 column
imdb_ratings<- fread("imdb_ratings.csv", header = TRUE, sep = "\t")
imdb_genres <- fread("imdb_genres.csv", header = TRUE, sep = "\t", fill = TRUE, quote = "")

# When deviding the dataset in correct columns, some data started or with a double quotation mark and this had to be removed in order to merge the datasets correctly
imdb_genres$tconst <- gsub("^\"", "", imdb_genres$tconst)

# Some variables in the dataset for genres included a double quatation mark and also had to be removed for correct resulsts
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

# Merge the `ratings` and `genres` into a single dataset 'm. inner_join is used here, since the variable "tconst" has more observations in the genres dataset than in the ratings dataset. inner_join makes sure that only the values that are the same in both datasets are included and others are excluded.
merged_ratings_genres <- inner_join(imdb_genres, imdb_ratings, by = "tconst")

# Check for NA values in the dataset
anyNA(merged_ratings_genres)

# Extract all the genres, split by a comma
all_genres <- unlist(strsplit(merged_ratings_genres$genres, ","))

# Remove any values that are "\\N"
all_genres <- all_genres[all_genres != "\\N"]

# Extract all the unique genres from all the genres
unique_genres <- unique(all_genres)

# Group the dataset by genres for easy overview and create a column that has numeric values for the genres (needed for the next step)
Grouped_by_genres <- merged_ratings_genres %>% 
  group_by(genres) %>%  
  summarize (N_genres=n())

# Loop through the unique genres to obtain the number of movies per genre
number_per_genre <- c()

for (genre in unique_genres) { 
  total_of_genres <- Grouped_by_genres %>%  
    filter(grepl(genre, genres)) %>% 
    summarize (sum_of_N_genres = sum(N_genres))
  number_per_genre <- c(number_per_genre, total_of_genres$sum_of_N_genres)
}

# Create a dataset that includes the genres and the number of movies per genre
movie_count_per_genre <- data.frame(
  genres = unique_genres,
  number = number_per_genre
)

#Find the average ratings for each movie
average_ratings <- merged_ratings_genres %>%
  group_by(genres) %>%
  summarise(Average_Rating = mean(average_ratings, na.rm = TRUE))

#Merge the ratings with the genres to have them in one dataset
merged_average_ratings <- left_join(average_ratings, Grouped_by_genres, by = 'genres')

#Calculate the total ratings for further research
merged_average_ratings <- merged_average_ratings %>% 
  mutate(total_rating = Average_Rating * N_genres)

#Loop through the genres to obtain the total ratings per genre.
genre_ratings <- c()

for (genre in unique_genres) {
  total_rating <- sum(merged_average_ratings$total_rating[grepl(genre, merged_average_ratings$genres)], na.rm=TRUE)
  genre_ratings <- rbind(genre_ratings, data.frame(genres = genre, total_rating = total_rating))
}

#Merge the datasets to obtain a dataset that has the average ratings per genre
data_merged <- left_join(genre_ratings, movie_count_per_genre, by = 'genres')

data_merged <- data_merged %>% 
  mutate(average_rating_per_genre = total_rating / number)

# Remove the column with total ratings, since this was only used to obtain the average ratings per genre
data_merged <- data_merged %>% 
  select(-total_rating)

# Store the final data of the datasets in as 'data_merged.csv`
write_csv(data_merged, file = "data_merged.csv")

