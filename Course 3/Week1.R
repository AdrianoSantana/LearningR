# Checando se um diretorio existe e criando um caso não exista
if (!file.exists('Course 3')) {
  dir.create('Course 3')
}
# Url para download dos dados de camera da cidade de baltimore
destFilePath <- './data/cameras.csv'
fileUrl <- 'https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD'
if (!file.exists(destPath)) {
  dir.create('data')
  download.file(fileUrl, destfile = destFilePath)
  dateDownloaded <- date()
  list.files('./data')
} else {
  print('Arquivo já foi baixado')
}

#Lendo arquivos csv
df <- read.csv('./data/cameras.csv')
head(df)

#Lendo arquivos do excel
library(readxl)
df <- read_xlsx('./data/Andamento das atividade da plataforma de saldos.xlsx')

#Lendo arquivos xml
library(XML)
fileUrl <- 'https://www.w3schools.com/xml/simple.xml'
doc <- xmlTreeParse(fileUrl, useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)

#Lendo arquivos JSON
library(jsonlite)
jsonData <- fromJSON('https://api.github.com/users/adrianoSantana/repos')
names(jsonData)

#Transformando um dataframe em json
myJson <- toJSON(iris, pretty = TRUE)
cat(myJson)

#Transformando um json em dataframe
iris2 <- fromJSON(myJson)
head(iris2)

# O pacote data.table
  library(data.table)
  dt <- data.table(x=rnorm(5), y=c(letters[1:5]), z=rnorm(5))
  head(dt)
  
  # Consultas ao data table
  dt[dt$y == 'b', 1:2 ]
  
  # Usando expressões para calcular valores de um data table
  dt[, list(mean(x), sum(z))]
  
  # Adicionando novas colunas
  dt[, w:= z^2]
  dt[, a:= x>1]
  
  # Agrupando dados de um data table
  dt[, sum(x,z), by=a]
  
# Week 1 --- Quiz

fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
destPath <- './data/ams.csv'
if (!file.exists(destPath)) {
  download.file(fileUrl, destfile = destPath)
}
library(data.table)
df <- read.csv(destPath)
df <- data.table(df)

  # Question 1
   df[df$VAL == 24, .N]
   ## Alternativa usando .csv table(df[df$VAL == 24, VAL])
  
  # Question 2
   ## Tidy data has one variable per column
  
  # Question 3
   library(readxl)
   fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
   destFilePath <- './data/q3.xlsx'
   if (!file.exists(destFilePath)) {
     download.file(fileUrl, destfile = destFilePath)
   }
   df <- read_excel(destFilePath)
   dat <- df[18:23, 7:15]
   names(dat) <- c('Zip', 'CuCurrent', 'PaCurrent', 'PoCurrent' ,'Contact', 'Ext', 'Fax', 'email', 'Status')
   dat$Zip <- as.numeric(dat$Zip)
   dat$Ext <- as.numeric(dat$Ext)
   sum(dat$Zip*dat$Ext,na.rm=T)
   
   # Question 4
   
   library(XML)
   fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
   destFilePath <- './data/q4.xml'
   if (!file.exists(destFilePath)) {
     download.file(fileUrl, destfile = destFilePath)
   }
   doc <- xmlParseDoc(destFilePath)
   xpathSApply(doc,"/wvt/ergebnis",xmlAttrs) 
   xpathSApply(doc,"/wvt/ergebnis/stimmen",xmlValue)
   
   # Question 5
   
   fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
   destFilePath <- './data/q5.csv'
   if (!file.exists(destFilePath)) {
     download.file(fileUrl, destfile = destFilePath)
   }
   dt <- fread(destFilePath)
   dt[, mean(pwgtp15), by= SEX]
   
  