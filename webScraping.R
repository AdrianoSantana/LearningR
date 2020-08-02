# Pacote rvest - Para fazer web scrapping
library(stringr)
library(dplyr)
library(lubridate)
library(readr)
library(rvest)

urlPage <- 'https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html'

# Leitura da web page
webPage <- read_html(urlPage)

# Extraindo as chaves dos registros
# Olhando o código fonte da página pode-se ver que os dados estão dentro da classe html <span class="short-desc">
# Logo precisamos procurar os dados que estão dentro dessa classe
# ?html_nodes

results <- webPage %>% html_nodes('.short-desc')

# Criando uma lista para armazenar os dados
# Cada linha da lista irá virar uma linha do data frame usando a biblioteca dplyr
# Usando a função bind_rows

records <- vector("list", length = length(results))

# Criação dos campos do data set

for (i in seq_along(results)) {
  
  # Extraindo as datas que se encontram dentro da tag Strong
  # ?html_text
  # ?xml_contets <- retorna todos os conteudos dentro de uma tag em forma de lista
  # ?html_attr
  
  rawDate <- results[i] %>% html_nodes('strong') %>% html_text(trim = TRUE)
  date <- paste(rawDate, '2017')
  
  rawLie <- xml_contents(results[i])[2] %>% html_text(trim = TRUE)
  lie <- str_sub(rawLie, 2, -2)
  
  rawExplanation <- results[i] %>% html_nodes('.short-truth') %>% html_text(trim = TRUE)
  explanation <- str_sub(rawExplanation, 2, -2)
  
  url <- results[i] %>% html_nodes('a') %>% html_attr('href')
  
  records[[i]] <- data_frame(date = date, lie = lie, explanation = explanation, url = url)
}

# Data set Final
df <- bind_rows(records)

# Transformando campo date para o formato Date em R

df$date <- mdy(df$date)

# Exportando para csv
# write_csv(df, 'trumps_lie.csv')


