library(basedosdados)
library(tidyverse)
library(dplyr)
library(ggplot2)

#### Carregando dados
basedosdados::set_billing_id("resonant-petal-287222")

query <- basedosdados::bdplyr('br_ibge_pib.municipio')
df <- basedosdados::bd_collect(query)

View(df)

args(bdplyr)
