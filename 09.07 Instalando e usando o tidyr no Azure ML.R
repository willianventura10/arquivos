# Este codigo contem comandos para filtrar e plotar os dados de aluguel de bikes, dados que estao em nosso dataset
# Este codigo foi criado para executar tanto no Azure, quanto no RStudio.
# Para executar no Azure, altere o valor da variavel Azure para TRUE. Se o valor for FALSE, o codigo sera executado no RStudio

# Variavel que controla a execucao do script
Azure <- FALSE


if(Azure){
  Pesquisa <- maml.mapInputPort(1)
  ## Instala o pacote tidyr e a dependência tibble a partir do arquivo zip
  install.packages("src/tibble_1.1.zip", lib = ".", repos = NULL, verbose = TRUE)
  install.packages("src/tidyr_0.5.1.zip", lib = ".", repos = NULL, verbose = TRUE)
  require(tibble, lib.loc = ".")
  require(tidyr, lib.loc = ".")
}else{
  Pesquisa <- read.csv("pesquisa.csv", sep = ",", header = T, stringsAsFactors = F )
  require(tidyr)
}

df <- spread(Pesquisa, Questao, Resposta)
df

Pesquisa2 <- gather(df, Resposta, value, 2:6)
Pesquisa2

if(Azure) maml.mapOutputPort("df")