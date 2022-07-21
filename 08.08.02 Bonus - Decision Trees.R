# Decision Trees

# Definindo o diretorio de trabalho
setwd("D:/Data_Science/Cursos/DSA/Formacao_Cientista_de_Dados/Big_Data_Analytics_com_R_e_Microsoft_Azure_Machine_Learning/Modulo8")

# Existem diversos pacotes para arvores de recisao em R. Usaremos aqui o rpart.
#install.packages('rpart')
library(rpart)

# Vamos utilizar um dataset que eh disponibilizado junto com o pacote rpart
str(kyphosis)
head(kyphosis)

# Ussamos a funcao rpart para criar a arvore de decisao
arvore <- rpart(Kyphosis ~ . , method = 'class', data = kyphosis)
class(arvore)
arvore

# Para examinar o resultado de uma arvore de decisao, existem diversas funcoes
printcp(arvore)

# Visualizando a arvore (execute uma funcao para o plot e outra para o texto no plot)
# Utilize o zoom para visualizar melhor o grafico
plot(arvore, uniform = TRUE, main = "Arvore de Decisao em R")
text(arvore, use.n = TRUE, all = TRUE)

# Este outro pacote faz a visualizaco ficar mais legivel
#install.packages('rpart.plot')
library(rpart.plot)
prp(arvore)
