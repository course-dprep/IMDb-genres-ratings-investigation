[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=11726081&assignment_repo_type=AssignmentRepo)
# The influence of the genre on the average rating of a movie 

## Motivation of research question
Why this research question? 
We are interested if there are movie genres that get higher ratings then other movie genres. This can
be interesting for film makers so they know which genre will gets the highest ratings, which can have
influence in how big of a success the movie will be financially.
Why this research method?
We are going to choose for an one-way ANOVA because we only have two variables and the
independent variable is a non-numeric variable, so an ANOVA is possible. Because the independent
variable has more than two levels a t-test is not an option. 

## Method and results
https://tilburgsciencehub.com/building-blocks/store-and-document-your-data/document-data/readme-best-practices/ 


This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("data.table")`, install.packages("dplyr"), install.packages("tidyverse")
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
