library(devtools)

#install_github('slidify', 'ramnathv')
#install_github('slidifyLibraries', 'ramnathv')

library(slidify)
library(knitr)   # allows use of browseURL to view presentation html file

author('projectPresent')   # populates a bare bones instantiation of a slidify presentation

slidify('index.rmd')   # use this to update after changes to index.Rmd

browseURL('index.html')
