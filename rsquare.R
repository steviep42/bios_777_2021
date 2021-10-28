library(tidyverse)
head(mtcars)

# predict mpg vs wt
lm(mpg~wt,mtcars) %>% summary() 

# Predict mpg vs wt + cyl
lm(mpg~wt+cyl,mtcars) %>% summary() 

# Let's add in every variable to the formula
modlist <- list()
cntr <- 1
for (ii in 2:(ncol(mtcars))) {
  form <- as.formula(paste(names(mtcars)[1],
                           paste(names(mtcars)[2:ii],collapse="+"),
                                 sep="~"))
  print(form)
  modlist[[cntr]] <- summary(lm(form,mtcars))[8:9]
  cntr <- cntr + 1
}

# Let's get the R-Squared and Adj R Squared
rsq <- data.frame(sapply(modlist,unlist) %>% t())
fac <- 0.01
plot(adj.r.squared~r.squared,
     rsq,
     type="b",
     ylim=c(min(rsq$adj.r.squared)-fac,
            max(rsq$adj.r.squared)+fac),
     xlim=c(min(rsq$r.squared)-fac,
            max(rsq$r.squared)+fac),
     main="Adj R-Squared vs R-squared for various mpg formulae")
grid()

text(rsq$r.squared,
     rsq$adj.r.squared,as.character(1:10),
     pos=4,
     adj=0,col="red")

