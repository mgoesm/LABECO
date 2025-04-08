# AULA 3

A <- 1+1

#PACOTE tidyverse

#install.packages("tidyverse")
#library(tidyverse)

# WDI - WORLD DEVOLEPMENT INDICATORS
#install.packages("WDI")
#library(WDI)

# vignettes = paginas com instrucoes dos pacotes

#WDIsearch('gdp')
#library(remotes)
install_github('vincentarelbundock/WDI')
# GDP (current US$)(NY.GDP.MKTP.CD)
# Código: NY.GDP.MKTP.CD
varpib <- WDIsearch("gdp")

# REMOVER A NOT. CIENT.
#options(scipen = 999)

# DADOS EM PAINEL
dadospib <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD')

# CORTE TRANSVERSAL
dadospib2023 <- WDI(country = 'all', indicator = 'NY.GDP.MKTP.CD', start = 2023, end = 2023)

# SÉRIE TEMPORAL
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')             

#ATIVIDADE  

# DADOS EM PAINEL
LuzAll <- WDI(country = 'all', indicator = 'EG.ELC.ACCS.ZS')

# CORTE TRANSVERSAL
LuzArg90 <- WDI(country = 'AR', indicator = 'EG.ELC.ACCS.ZS', start = 1990, end = 2000)

# SÉRIE TEMPORAL
LuzArg <- WDI(country = 'AR',
                  indicator = 'EG.ELC.ACCS.ZS') 

# GRÁFICOS
# BIBLIOTECA ggplot2 (tidyverse)

#Grafico Painel
grafpainel <- ggplot(dadospib, mapping = aes(y=NY.GDP.MKTP.CD,x= year)) + geom_point()

print(grafpainel)

#Grafico em Corte Transversal

grafcorte <- ggplot(dadospib2023, mapping = aes(y=NY.GDP.MKTP.CD, x= year)) + geom_point()

print(grafcorte)

#Grafico Serie Temporal

grafserie <- ggplot(dadospibbr, aes(x = year, y = NY.GDP.MKTP.CD)) +
  geom_line()

print(grafserie)

# ATIVIDADE 2

grafpainel.2 <- ggplot(LuzAll, mapping = aes(y=EG.ELC.ACCS.ZS,x= year)) + geom_line()
print(grafpainel.2)

grafcorte.2 <- ggplot(LuzArg90, mapping = aes(y=EG.ELC.ACCS.ZS, x= year)) + geom_point()
print(grafcorte.2)

grafserie.2 <- ggplot(LuzArg, aes(x = year, y = EG.ELC.ACCS.ZS)) +
  geom_line()
  
print(grafserie.2)
------------------------------------------------------------
07.04

#library(dplyr)
#library(ggplot2)

DADOS EM PAINEL
# Filtrar apenas dados da Argentina
dados_arg <- LuzAll %>% filter(iso2c == "AR")

# Criar o gráfico
graf_arg <- ggplot(dados_arg, aes(x = year, y = EG.ELC.ACCS.ZS)) +
  geom_line(color = "blue", size = 1.2) +
  labs(title = "Acesso à Eletricidade na Argentina",
       x = "Ano",
       y = "% da População com Acesso") +
  theme_minimal()

# Exibir o gráfico
print(graf_arg)

CORTE TRANSVERSAL

dados_corte <- LuzAll %>%
  filter(year == 2005,
         country %in% c("Brazil", "Argentina", "United States", "China", "South Africa"))

# Criar gráfico de barras
grafcorte.2 <- ggplot(dados_corte, aes(x = reorder(country, EG.ELC.ACCS.ZS), y = EG.ELC.ACCS.ZS)) +
  geom_col(fill = "steelblue") +
  labs(title = "Acesso à Eletricidade (% da População) em 2005",
       x = "País",
       y = "% da População com Acesso") +
  coord_flip() +
  theme_minimal()

print(grafcorte.2)

SERIE TEMPORAL

library(dplyr)
library(ggplot2)

# Filtrar os países e o período a partir de 1990
dados_temporal <- LuzAll %>%
  filter(country %in% c("Brazil", "Argentina", "United States", "China", "South Africa"),
         year >= 1990)

# Criar gráfico
grafserie.2 <- ggplot(dados_temporal, aes(x = year, y = EG.ELC.ACCS.ZS, color = country)) +
  geom_line(size = 1.2) +
  labs(title = "Acesso à Eletricidade (% da População)",
       subtitle = "De 1990 a 2023",
       x = "Ano",
       y = "% da População com Acesso",
       color = "País") +
  theme_minimal()

print(grafserie.2)

