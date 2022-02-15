library(basedosdados)
library(tidyverse)
library(dplyr)
library(ggplot2)

#### Carregando dados
set_billing_id("resonant-petal-287222")

query <- bdplyr('br_ibge_pib.municipio')
df <- bd_collect(query)

View(df)
