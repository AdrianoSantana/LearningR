# DPLYR
library(dplyr)
options(width = 105)
df <- readRDS('./data/chicago.rds')
dim(df)
str(df)
names(df)

# Selecionar nomes usando dplyr
# Usamos a função select
head(select(df, city:dptp))

# Filtrando dados por uma condição

dfFiltered <- filter(df, (pm25tmean2 > 30 & pm10tmean2 > 20))

# Caso ocorra a necessidade de escolher determinadas colunas deste novo dataFrame filtrado
select(dfFiltered , city:dptp)

# Ordenando um dataframe pelos dados de uma determinada coluna
df <- arrange(df, date)
head(df, 10)

# Renomeando colunas
df <- rename(df, pm25 = pm25tmean2, dewpoint = dptp)

# Para criar modificar e deletar colunas usamos a função mutate
df <- mutate(df, pm25detrend = pm25 - mean(pm25, na.rm = TRUE))

# Usando a função groupby
df <- mutate(df, tempcat = factor(1 * (tmpd > 80), labels = c('cold', 'hot')))
hotCold <- group_by(df, tempcat)
head(hotCold)

# O R um caractere especial que permite fazer encadeamentos de funções
# df %>% mutate(month = as.POsixlt(date)$mon + 1) %>% group_by(month) %>% summarize(pm25 = mean(pm25))

# Merging data
# Baixando arquivos csv

reviewsUrl <- 'www.sharecsv.com/dl/e70e9c289adc4b87c900fdf69093f996/reviews.csv'
solutionUrl <- 'www.sharecsv.com/dl/0863fd2414355555be0260f46dbe937b/solutions.csv'
reviewsFile <- './data/reviews.csv'
solutionsFile <- './data/solutions.csv'

if (!file.exists(reviewsFile)) {
  download.file(reviewsUrl, destfile = reviewsFile)
}
if (!file.exists(solutionsFile)) {
  download.file(solutionUrl, destfile = solutionsFile)
}

reviews <- read.csv(reviewsFile)
solutions <- read.csv(solutionsFile)

mergedData <- merge(reviews, solutions, by.x = 'solution_id', by.y = 'id', all = TRUE)

