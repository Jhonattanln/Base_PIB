library(basedosdados)
library(tidyverse)
library(dplyr)
library(ggplot2)

#### Carregando dados
basedosdados::set_billing_id("resonant-petal-287222")

query <- basedosdados::bdplyr('br_ibge_pib.municipio')
df <- basedosdados::bd_collect(query)

## Códigos das cidades
clbo <- 4105805
ctba <- 4106902
parag <- 4118204
ant <- 4101200
bh <- 3106200
flor <- 2204006

antonina <- df %>%
  filter(id_municipio == ant) %>%
  arrange(desc(ano)) %>%
  mutate(va_agro_pib = (va_agropecuaria/pib)*100)

View(antonina)
