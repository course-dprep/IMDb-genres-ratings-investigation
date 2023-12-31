all: analysis_datasets.pdf
	
data_merged.csv: cleaning_the_datasets.R imdb_genres.csv imdb_ratings.csv
	Rscript cleaning_the_datasets.R

imdb_genres.csv imdb_ratings.csv: download_datasets.R
	Rscript download_datasets.R

analysis_datasets.pdf: analysis_datasets.Rmd data_merged.csv
	Rscript -e "rmarkdown::render('analysis_datasets.Rmd')"
	
clean: 
	R -e "unlink('*.gz')"
	R -e "unlink('*.csv')"