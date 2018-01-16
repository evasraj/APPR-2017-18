library(knitr)
library(dplyr)
library(readr)
library(rvest)
library(gsubfn)
library(ggplot2)
library(reshape2)
library(shiny)
library(httr)
library(readxl)
library(tidyr)
library(sp)
library(maptools)

library(gridExtra) #združi 2 zemljevida


# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding = "UTF-8")

