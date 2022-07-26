# R e MongoDB

# Criando uma cole�a� no MongoDB (abrir o prompt e navegar at� o diret�rio bin dentro do diret�rio de instala��o do mongoDB e executar na linha de comando)
# ./mongoimport --db users --collection contatos --file /opt/DSA/RFundamentos/Parte3/zips.json

# O pacote rmongodb foi descontinuado e n�o receber� mais atualiza��o. Quando isso acontece, o pacote fica dispon�vel no 
# Archive do CRAN. O pacote ainda pode ser utilizado normalmente, mas precisa fazer o download do arquivo e instalar em sua m�quina. 
# O link para o download est� aqui: https://cran.r-project.org/src/contrib/Archive/rmongodb/. 
# O comando para instalar o pacote � install.packages("nome_completo_do_pacote", repos = NULL, type = "source"). 
# Coloque o pacote no mesmo diret�rio de trabalho da sua sess�o no RStudio. 
# O pacote pode ser usado normalmente, embora n�o seja mais atualizado pelo criador do pacote.


# RMongo
# RMongoDB
# Instalação do Pacote
# install.packages("rmongodb")
install.packages("nome_completo_do_pacote", repos = NULL, type = "source")
library(rmongodb)

# Criando a conexão
help("mongo.create")
mongo <- mongo.create()
mongo

# Checando a conexão
mongo.is.connected(mongo)

if(mongo.is.connected(mongo) == TRUE) {
  mongo.get.databases(mongo)
}

# Armazenando o nome de uma das coleções
coll <- "users.contatos"

# Contando os registros em uma coleção
help("mongo.count")
mongo.count(mongo, coll)

# Buscando um registro em uma coleção
mongo.find.one(mongo, coll)

# Obtendo um vetor de valores distintos das chaves de uma coleção
res <- mongo.distinct(mongo, coll, "city")
head(res)

# Obtendo um vetor de valores distintos das chaves de uma coleção
# E gerando um histograma
pop <- mongo.distinct(mongo, coll, "pop")
hist(pop)

# Contando os elementos
nr <- mongo.count(mongo, coll, list('pop' = list('$lte' = 2)))
print( nr )

# Buscando todos os elementos
pops <- mongo.find.all(mongo, coll, list('pop' = list('$lte' = 2)))
head(pops, 2)

# Encerrando a conexão
mongo.destroy(mongo)

# Criando e validando um arquivo json
library(jsonlite)
json_arquivo <- '{"pop":{"$lte":2}, "pop":{"$gte":1}}'
cat(prettify(json_arquivo))

validate(json_arquivo)















