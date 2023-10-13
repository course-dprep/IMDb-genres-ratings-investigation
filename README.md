[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11726081&assignment_repo_type=AssignmentRepo)
# The influence of the genre on the average rating of a movie 

_"Is there an effect of the genre of a movie on the rating of a movie?"_


## Motivation of research question

We would like to know if there is an effect of movie genres on the ratings of a movie. To 
answer this question, we will compare the average rating of two genres with each other. The 
result of this can be interesting for filmmakers, so they know which genre will get the highest 
ratings, which can influence how big of a financial success the movie will be. For example, a 
higher rating will lead to higher viewer satisfaction, leading people to recommend it to their 
friends. This leads to higher ticket sales and, thus, to a higher box office. 


To answer our research question, we want to know if there is a significant difference between 
the rating of genres. Genres are the independent variable, and they are categorial, and most 
of the time, ANOVA is used when dealing with categorical variables. Furthermore, we want to 
know if there is a significant difference between groups that can not be concluded with the 
results of a linear regression and can with the results of an ANOVA. If there are significant 
differences between groups, post hoc tests will be used to examine these differences further

# Method and results

## Datasets
We used the following two datasets from IMDb:

-  title.basics.tsv.gz
  
-  title.ratings.tsv.gz


The two datasets were merged into a single dataset to answer the research question.  

## Variables 

The merged dataset consists of four variables, two of which were relevant for answering the research question: 

| Variables | Description                                              |
| ----------|----------------------------------------------------------|
| Genre     | The genre of the movie (27 different levels)             |
| Rating    | The rating that users of IMDb gave to the movie          | 

## Research Method 

An One-way Anova will be performed on the dataset to reach a conclusion about the influence of genres on ratings. We chose this form of analysis because we looking for differences in means of groups (genres) which is exactly what Anova can be used for. Genre will be used as the independent variable and rating as the dependent variable. To furhter invest the differences between the genres, the Anova was followed up with the function emmeans. 

## Results and interpretation 

The ANOVA showed that there is a significant difference in ratings between genres (p <0.001). This result answered our research question already but we wanted to know which genres had the most posstive effect on ratings. The emmeans function compares the mean of one genre with the mean of another genre. For every combination it becomes clear which one of the genres has the biggest influence on the ratings. From the results of the emmeans it becomes clear that Game-Show has the highest average rating, followed by Documentary and History. When looking at the emmeans between genres, it also becomes clear that the genre Game-Show has the biggest influence on the ratings of movies where other genres exists next to Game-Show. 


## Repository Structure 
```

└── src
   ├── data-analysis
   ├── data-preparation
├── README.md
├── makefile
```
# Running instructions 

To run the code provided in this repository, the following instructions can be followed:

1. Open the terminal (MacOS) or open Gitbash (Windows)
   
2. Clone this repository by typing in the following command in the terminal or command line:
```
    git clone https://github.com/course-dprep/IMDb-genres-ratings-investigation
```
3. Set the working directory to the repository by typing the following command in the terminal or command line:
```
   cd IMDB-genres-ratings-investigation
```
4. To run the code, type the following command:
```
    make
```
5. When the code is running, multiple files will appear in the working directory. One of these files is a .pdf file and includes the final analysis of the data as a knitted Rmarkdown file to a pdf.

6. To remove any of the raw data files, the following command can be typed in the terminal or the command line:
```
    make clean 
```
## Dependencies
- R 
- R packages: `install.packages("data.table")`, `install.packages("dplyr")`, `install.packages("tidyverse")`, `install.packages("car")`, `install.packages("emmeans")`, `install.packages("reporttools")`, `install.packages("readr")`
- IMDb dataset for genres: title.basics.tsv.gz
- IMDb dataset for ratings: title.ratings.tsv.gz
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)

## Running the code 

## Resources 
IMDb Non-commercial Datasets: <https://developer.imdb.com/non-commercial-datasets/>  

## Authors 
This repository was created by team 5 for the course Data Preperation and Workflow Management taugth by Hannes Datta, at Tiburg university, as part of the Master's program Marketing Analytics. The repository is maintained by the members of Team 5: 

-  Maurits van Elteren
  
-  Iris Berkvens
   
-  Hugo Snijders



## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!
Research question 
- The preliminary research question is if the genre of a movie has an influence on the rating of a movie. 
Testing
