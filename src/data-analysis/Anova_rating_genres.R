# ANALYSING THE DATA

library(car)
library(emmeans)
library(reporttools)
library(readr)

# Saving the data as a pdf file
pdf("anova_results.pdf")

# Import the cleaned dataset
data_merged <- read_csv("data_merged.csv")

# Perform an Anova with the two datasets, 'Average_Rating' being the dependent variable and 'genres' being the independent variable
dataset_lm <- lm(Average_Rating ~ genres, data_merged, contrasts=list(genres=contr.sum))
dataset_aov <- Anova(dataset_lm, type=3)

print(dataset_aov)

# Calculating estimated marginal means
emmeans_results <- emmeans(dataset_lm, pairwise ~ genres, adjust="bonferroni")

print(emmeans_results)

dev.off()