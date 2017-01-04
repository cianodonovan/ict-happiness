#Based in part on walk-through @ https://github.com/aiorazabala/qmethod/wiki/Cookbook#6-import-your-data-into-r
#This file performs analysis and graphing

### RUN THE Q SORT
results <- qmethod(thesorts, nfactors = 2, rotation = "varimax")

### SHOW SOME RESULTS
summary(results) #SUMMARISING
results #ALL THE RESULTS


###. LET'S DO SOME PLOTTING
title <- "Q method z scores, US hurricanes dataset"
subtitle <- paste0("Two factors, PCA, varimax. Printed on ", Sys.Date())
plot(results, main = title, sub = subtitle)


## MAKE CARDS - HASHED
make.cards( q.set, study.language = NULL, paper.format = "AveryZweckformC32010.Rnw", output.pdf = TRUE, manual.lookup = NULL, wording.font.size = "Large", file.name = "QCards", babel.language = NULL)

## MAKE CARDS - IDS
make.cards( q.set, study.language = NULL, paper.format = "AveryZweckformC32010.Rnw", output.pdf = TRUE, manual.ids, wording.font.size = "NULL", file.name = "QCards", babel.language = NULL)
