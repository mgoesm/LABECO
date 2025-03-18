# AULA 3

A <- 1+1

#PACOTE tidyverse

install.packages("tidyverse")
library(tidyverse)

# WDI - WORLD DEVOLEPMENT INDICATORS
#install.packages("WDI")
library(WDI)

# vignettes = paginas com instrucoes dos pacotes
WDIsearch('gdp')
library(remotes)
install_github('vincentarelbundock/WDI')
# GDP (current US$)(NY.GDP.MKTP.CD)
# Código: NY.GDP.MKTP.CD

varpib <- WDIsearch("gdp")

options(scipen = 999)

dadospib <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD')

dadospib2023 <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD', start = 2023, end = 2023)


                
                