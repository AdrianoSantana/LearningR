# Subsetting and Sorting

set.seed(13435)
df <- data.frame('var1'=sample(1:5), 'var2'=sample(6:10), 'var3'=sample(11:15))
df <- df[sample(1:5), ]
df$var2[c(1,3)] <- NA
# Fazendo procuras usando condicionais
df[(df$var1 > 3 & df$var2 < 7), ]

# Sorting

sort(df$var1)
sort(df$var1, decreasing = TRUE)

# Importante
# Ordenando um dataframe por uma coluna
df[order(df[,'var1']),]

# Ordenando um dataframe por multiplas coluna
df[order(df[, 'var1'], df[,'var3']), ]

# Adicionando linhas e colunas
df[, 'var4'] <- rnorm(5)

# Podemos adicionar colunas usando o cbind
# Ela pode ser usada para juntar data frames
df2 <- data.frame('var6'=sample(10:14), 'var7'=sample(30:34))
cbind(df,df2)

# Summarizing data
df <- read.csv('./data/Restaurants.csv')
head(df, n = 3)
# Função importante para resumo dos dados
summary(df)

# A função STR tambem pode ser usada para entender os dados
str(df)
# Quantis
quantile(df[, "councilDistrict"], na.rm = TRUE)

# A função table é importante pois relaciona as variáveis em uma tabela
table(df[, "zipCode"], df[, "councilDistrict"])

# Procurando por valores faltantes
# Existe algum valor NA em councilDistric ?
any(is.na(df[, "councilDistrict"]))

# Procurando valores especificos
table(df[, "zipCode"] %in% c('21212', '21213'))
df[df[, "zipCode"] %in% c('21212', '21213'), c("name","zipCode")]

# Criando novas variáveis
df <- read.csv('./data/Restaurants.csv')
# As vezes é necessario cria um indice para seu data frame
s1 <- seq(1,10, by=2)
s2 <- seq(1,10,length= 3)

# Subsetting Variable
df$nearMe <- df$neighborhood %in% c('Roland Park', 'Homeland')
table(df$nearMe)

# Creating binary variable
df$zipWrong <- ifelse(df$zipCode < 0, TRUE, FALSE)
table(df$zipWrong, df$zipCode < 0)

# Reshaping data

library(reshape2)
head(mtcars)

# Melting data frames IMPORTANTE

mtcars$carName <- rownames(mtcars)
carMelt <- melt(mtcars, id=c('carName', 'gear', 'cyl'), measure.vars = c('mpg','hp'))
head(carMelt, n = 3)

# Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData <- dcast(carMelt, cyl ~ variable, mean)

# Averaging Value
head(InsectSprays)
tapply(InsectSprays$count,InsectSprays$spray , sum)
# Outra maneira é usar a função split
split(InsectSprays$count, InsectSprays$spray)



