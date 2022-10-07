library(margins)
library(marginaleffects)
library(ggplot2)
library(ordinal)
library(nnet)
library(modelsummary)


df <- read.csv("D:/D/Marc/SMS/STATA INED/Programmation/R/marginaleffect/nhanes.csv")

# logit

df$region = as.factor(df$region)

fit = glm(highbp ~ female + black + region + bmi, family=binomial, data=df)
fit
summary(fit)

ame = margins(fit)
summary(ame)

ame = marginaleffects(fit)
summary(ame)

#output = modelsummary(ame, output = "modelsummary_list", gof_map = NA)
#modelsummary(list("AME"= output), statistic = "{std.error} ({p.value})", shape = term ~ model + statistic)

# Ordinal Odds Proportionnel

df$hlthstat = as.factor(df$hlthstat)

fit = clm(hlthstat ~ female + black + bmi, family=binomial, data=df)
summary(fit)

ame = marginaleffects(fit)
summary(ame)


#modelplot(ame)
#modelplot(ame) + labs(x='AME', y="Variables", title="Calcul des AME avec marginaleffects", caption="Source: base nhanes21")


# logit multinomial

fit = multinom(hlthstat ~ female + black + bmi,  data=df)

ame = marginaleffects(fit)
summary(ame)


# logit stereotype (ame pas possible avec marginaleffects )

library(VGAM)
fit = rrvglm(hlthstat ~ female + black + bmi, multinomial, data=df)
summary(fit)

get_coef(fit)
get_predict(fit)
get_vcov(fit)

class(fit)


#output = modelsummary(ame, output = "modelsummary_list", gof_map = NA)
#modelsummary(list("AME"= output), statistic = "{std.error} ({p.value})", shape = term ~ model + statistic)

#modelplot(ame)

#modelplot(ame) + labs(x='AME', y="Variables", title="Calcul des AME avec marginaleffects", caption="Source: base nhanes21")


