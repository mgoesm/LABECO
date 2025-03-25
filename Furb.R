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

# REMOVER A NOT. CIENT.
options(scipen = 999)

# DADOS EM PAINEL
dadospib <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD')

# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD', start = 2023, end = 2023)

# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')                
                