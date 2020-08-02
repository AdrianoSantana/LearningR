# Trabalhando com o MySQL
  library(RMySQL)
  
  # Conectando ao banco de dados mysql online
  ucsDB <- dbConnect(MySQL(), user="genome", host='genome-mysql.soe.ucsc.edu')
  # Fazendo uma consulta para mostrar todos os databases
  result <- dbGetQuery(ucsDB, 'show databases;')
  # Fechando a conexão
  dbDisconnect(ucsDB)
  
  # Conectando a um database especifico e listando todas as tabelas do DB
  hg19 <- dbConnect(MySQL(), user="genome", db="hg19", host='genome-mysql.soe.ucsc.edu')
  allTables <- dbListTables(hg19)
  
  # Descobrindo todas as colunas de uma tabela
  dbListFields(hg19, 'affyU133Plus2')
  # Selecionando todos os dados de bin da tabela affyU133Plus2
  dbGetQuery(hg19, 'select qName from affyU133Plus2')

  # 
 eletivasDB <- dbConnect(MySQL(), user = 'ans3', password = '',
            host='localhost', port=5432, db = 'eletivas')
 eletivas <- dbGetQuery(eletivasDB, 'select * from eletivas')
 eletivas$nome
 
# Reading data from APIs
# Twiiter api
  library(httr)
  apiKey <- 'o74pMRLBxdtsXDChJvWYSf3iT'
  apiSecretKey <- 'n0Y84zJKBYXOGAzz9flzVPMipSj95cfY0gFdrD7SMEmBNywgjU'
  acessToken <- '914244142556950533-KeR3DmvFTbJqZpcxNktdYDU1pwvuPKC'
  acessTokenSecret <- 'lLAzMNmmq4HBH97JUMJttboVSem4RjpyNQBXC8ZI5VqFH'
  
  myApp <- oauth_app('twiiter',
                    key = apiKey,
                    secret = apiSecretKey
                    )
  sig <-sign_oauth1.0(
                    myApp,
                    token = acessToken,
                    token_secret = acessTokenSecret
                    )
  homeTL = GET('https://api.twitter.com/1.1/collections/list.json', sig)
  homeTL
  
  
  # Assignment
    # 1
    # 2
      library(sqldf)
      acs <- read.csv('./data/getdata_data_ss06pid.csv')
      sqldf('select pwgtp1 from acs where AGEP < 50')
    # 3
      sqldf('select distinct AGEP from acs')
    # 4
      library(XML)
      lines <- c(10,20,30,100)
      url <- 'http://biostat.jhsph.edu/~jleek/contact.html'
      html <- readLines(url)
      for (x in lines) {
        print(paste(x, nchar(html[x])))
      }
    # 5
      fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
      SST <- read.fwf(fileUrl, skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
      sum(SST[,4])