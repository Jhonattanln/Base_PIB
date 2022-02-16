library(basedosdados)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(ggthemes)

#### Carregando dados
basedosdados::set_billing_id("resonant-petal-287222")

query <- basedosdados::bdplyr('br_ibge_pib.municipio')
df <- basedosdados::bd_collect(query)

View(df)

colSums(is.na(df)) ### analisando a quantidade de números ausentes

## Códigos das cidades
clbo <- 4105805
ctba <- 4106902
parag <- 4118204
ant <- 4101200
bh <- 3106200
flor <- 2204006

### Analizando uma cidade expecifíca
antonina <- df %>%
  filter(id_municipio == ant) %>% ## selecionando a cidade
  arrange(desc(ano)) %>%
  mutate(va_agro_pib = (va_agropecuaria/pib)*100) ## criando a razão entre o pib e agro


### Plotando gráfico
ggplot(antonina, aes(x=ano, y=va_agro_pib))+ 
  geom_col()+
  geom_line()+
  theme_pander()

################################ ##################################### #########################

### Analisando os dados por grupo
cidades <- df %>%
  group_by(id_municipio) %>%
  summarise(agr_sum = sum(va_agropecuaria),
            agr_max = max(va_agropecuaria),
            agr_min = min(va_agropecuaria)) %>%
  filter(agr_sum > 5000000000) %>%
  arrange(desc(agr_sum))

View(cidades)
### Plotando dados

ggplot(cidades, aes(x=id_municipio, y=agr_sum))+
  geom_col()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  theme_base()

?summarise
