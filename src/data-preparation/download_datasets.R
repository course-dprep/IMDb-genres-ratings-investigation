library(readr)
library(tidyverse)

download.file("https://datasets.imdbws.com/title.ratings.tsv.gz", "imdb_ratings.gz")
download.file("https://datasets.imdbws.com/title.basics.tsv.gz", "imdb_genres.gz")


read_csv("imdb_ratings.gz") -> imdb_ratings
read_csv("imdb_genres.gz") -> imdb_genres

imdb_ratings %>% 
  write_csv("imdb_ratings.csv")

imdb_genres %>% 
  write_csv("imdb_genres.csv")