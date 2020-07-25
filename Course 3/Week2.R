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
 
# Web Scrapping
 