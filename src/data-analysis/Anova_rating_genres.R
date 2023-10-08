library(car)
install.packages("carData")



FocalTrust_lm0 <- lm(Average_Rating ~ genres, data_merged_1_, contrasts=list(genres=contr.sum))
FocalTrust_aov0 <- Anova(FocalTrust_lm0, type=3)
FocalTrust_aov0






install.packages("emmeans")
library(emmeans)
emmeans(FocalTrust_lm0, pairwise ~ genres, adjust="bonferroni")
