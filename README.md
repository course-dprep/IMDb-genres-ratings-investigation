[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11726081&assignment_repo_type=AssignmentRepo)
# The influence of the genre on the average rating of a movie 

## Motivation of research question
Why this research question? 
We would like to know if there is an effect of movie genres on the ratings of a movie. To 
answer this question, we will compare the average rating of two genres with each other. The 
result of this can be interesting for filmmakers, so they know which genre will get the highest 
ratings, which can influence how big of a financial success the movie will be. For example, a 
higher rating will lead to higher viewer satisfaction, leading people to recommend it to their 
friends. This leads to higher ticket sales and, thus, to a higher box office. 
Why this research method? 
To answer our research question, we want to know if there is a significant difference between 
the rating of genres. Genres are the independent variable, and they are categorial, and most 
of the time, ANOVA is used when dealing with categorical variables. Furthermore, we want to 
know if there is a significant difference between groups that can not be concluded with the 
results of a linear regression and can with the results of an ANOVA. If there are significant 
differences between groups, post hoc tests will be used to examine these differences further

## Method and results
https://tilburgsciencehub.com/building-blocks/store-and-document-your-data/document-data/readme-best-practices/ 


This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("data.table")`, `install.packages("dplyr")`, `install.packages("tidyverse")`, `install.packages("car")`, `install.packages("emmeans")`, `install.packages("reporttools")`, `install.packages("readr")`
- IMDb dataset for genres: title.basics.tsv.gz
- IMDb dataset for ratings: title.ratings.tsv.gz
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!
Research question 
- The preliminary research question is if the genre of a movie has an influence on the rating of a movie. 
Testing
