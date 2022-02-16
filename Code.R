library(basedosdados)
library(tidyverse)
library(dplyr)
library(ggplot2)

#### Carregando dados
basedosdados::set_billing_id("resonant-petal-287222")

query <- basedosdados::bdplyr('br_ibge_pib.municipio')
df <- basedosdados::bd_collect(query)

clbo <- 4105805
ctba <- 4106902
parag <- 4118204
ant <- 4101200
bh <- 3106200
flor <- 2204006

df %>%
  filter(id_municipio == 3550308)
