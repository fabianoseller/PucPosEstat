# instalar dependencias 

library(readr)
library(ggplot2)
library(plotly)
library(e1071)
library(dplyr)
library(Hmisc)
library(DescTools)
library(esquisse)
library(kableExtra)
library(gridExtra)
library(devtools)


enade2017 <- read.csv2("C:/Users/fabiano-antunes_educ/Desktop/R/MICRODADOS_ENADE_2017.txt")
head(enade2017)
microdados_enade_filtrados <- enade2017 %>%
  select(CO_GRUPO,
         TP_SEXO,
         CO_TURNO_GRADUACAO,
         CO_REGIAO_CURSO,
         QE_I02,
         NT_OBJ_FG,
         QE_I08,
         QE_I23,
         NT_OBJ_CE,
         NT_GER)

# Visualizar os dados
head(microdados_enade_filtrados)


# variaveis

microdados_enade_filtrados <- enade2017 %>%
  select(CO_GRUPO,
         TP_SEXO,
         CO_TURNO_GRADUACAO,
         CO_REGIAO_CURSO,
         QE_I02,
         NT_OBJ_FG,
         QE_I08,
         QE_I23,
         NT_OBJ_CE,
         NT_GER)

head(microdados_enade_filtrados)

#código escolhido 6208

head(microdados_enade_filtrados)
microdados_enade_filtrados$CO_GRUPO == 6208
microdados_ti = microdados_enade_filtrados %>% filter(CO_GRUPO==6208)

dim (microdados_enade_filtrados)

table(microdados_ti$CO_GRUPO)

microdados_ti = microdados_enade_filtrados %>% filter(CO_GRUPO==6208)
head(microdados_ti)

# 1. Variáveis indicadas na questão:
# NT_OBJ_FG: Nota bruta na parte objetiva da formação geral -> Variável Quantitativa Contínua
# CO_GRUPO: Código da área de enquadramento do curso no Enade -> Variável Qualitativa Nominal
# CO_REGIAO_CURSO: Código da região de funcionamento do curso -> Variável Qualitativa Nominal
# QE_I02: Questionário de cor/raça -> Variável Qualitativa Nominal
# CO_TURNO_GRADUACAO: Código do turno de graduação -> Variável Qualitativa Ordinal

# 2. Outras variáveis utilizadas:
# TP_SEXO: Tipo de Sexo -> Variável Qualitativa Nominal
# QE_I08: Renda familiar -> Variável Qualitativa Ordinal
# QE_I23: Horas dedicadas aos estudos -> Variável Qualitativa Ordinal
# NT_OBJ_CE: Nota bruta na parte específica -> Variável Quantitativa Contínua
# NT_GER: Nota bruta da prova -> Variável Quantitativa Contínua




# Transformação variáveis colcoando os Rótulos

#Raça
microdados_ti = microdados_ti %>% mutate(raca = case_when( QE_I02 == "A" ~ "Branca",
                                                           QE_I02 == "B" ~ "Preta",
                                                           QE_I02 == "C" ~ "Amarela",
                                                           QE_I02 == "D" ~ "Parda",
                                                           QE_I02 == "E" ~ "Indígena",
                                                           QE_I02 == "E" ~ "Não quero declarar"
                                                           
))

#Região
microdados_ti = microdados_ti %>% mutate(regiao = case_when( CO_REGIAO_CURSO == 1 ~ "Norte",
                                                             CO_REGIAO_CURSO == 2 ~ "Nordeste",
                                                             CO_REGIAO_CURSO == 3 ~ "Sudeste",
                                                             CO_REGIAO_CURSO == 4 ~ "Sul",
                                                             CO_REGIAO_CURSO == 5 ~ "Centro-Oeste"
))

#sexo
microdados_ti = microdados_ti %>% mutate(sexo = case_when( TP_SEXO == "M" ~ "Masculino",
                                                           TP_SEXO == "F" ~ "Feminino"
))


#Horas de estudo
microdados_ti = microdados_ti %>% mutate(hestudos = case_when( QE_I23 == "A" ~ "Nenhuma, apenas assisto as aulas",
                                                               QE_I23 == "B" ~ "De uma a três",
                                                               QE_I23 == "C" ~ "De quatro a sete",
                                                               QE_I23 == "D" ~ "De oito a doze",
                                                               QE_I23 == "E" ~ "Mais de doze"
))

#Renda familiar
microdados_ti = microdados_ti %>% mutate(hsalario = case_when(   QE_I08 == "A" ~ "Até 1,5 salário mínimo (até R$ 1.405,50)",
                                                                 QE_I08 == "B" ~ "De 1,5 a 3 salários mínimos (R$ 1.405,51 a R$ 2.811,00)",
                                                                 QE_I08 == "C" ~ "De 3 a 4,5 salários mínimos (R$ 2.811,01 a R$ 4.216,50)",
                                                                 QE_I08 == "D" ~ "De 4,5 a 6 salários mínimos (R$ 4.216,51 a R$ 5.622,00)",
                                                                 QE_I08 == "E" ~ "De 6 a 10 salários mínimos (R$ 5.622,01 a R$ 9.370,00)",
                                                                 QE_I08 == "F" ~ "De 10 a 30 salários mínimos (R$ 9.370,01 a R$ 28.110,00)",
                                                                 QE_I08 == "G" ~ "Acima de 30 salários mínimos (mais de R$ 28.110,00)"
))

#Turno
microdados_ti = microdados_ti %>% mutate(hturno = case_when(  CO_TURNO_GRADUACAO == 1 ~ "Matutino",
                                                              CO_TURNO_GRADUACAO == 2 ~ "Vespertino",
                                                              CO_TURNO_GRADUACAO == 3 ~ "Noturno",
                                                              CO_TURNO_GRADUACAO == 4 ~ "Integral",
                                                              CO_TURNO_GRADUACAO == 5 ~ "Não realizei estágio curricular obrigatório"
))

unique(microdados_ti$raca)
unique(microdados_ti$hturno)
unique(microdados_ti$sexo)
unique(microdados_ti$regiao)
unique(microdados_ti$hestudos)
unique(microdados_ti$hsalario)
        
#Removendo  Na
microdados_ti_sem_NA = microdados_ti %>% na.omit()


#Conferindo se NA's foram removidos
resumo_teste_variaveis= microdados_ti_sem_NA %>%
  select(everything()) %>%
  summarise_all(list(~sum(is.na(.))))
resumo_teste_variaveis


#Estatistica Descritiva
#Analisando as notas méias
print(microdados_ti_sem_NA %>%
  group_by(raca, sexo, hturno) %>%
  summarise(
    media_NT_GER = mean(NT_GER),
    media_NT_OBJ_FG = mean(NT_OBJ_FG),
    media_NT_OBJ_CE = mean(NT_OBJ_CE),
    .groups = "drop" 
    print(
    # opcional: remove a estrutura de grupo do resultado
  )

describe(microdados_ti$raca)
describe(microdados_ti$hturno)

sum(is.na(microdados_ti$hturno))



#Comparar as médias por sexo e  renda total de sua família
microdados_ti_mod2 = microdados_ti_sem_NA %>%
  select(raca ,NT_GER,hsalario) %>%
  group_by(hsalario, raca) %>%
  summarise(  quantidade=n(),
              media = mean(NT_GER,na.rm = T),
              mediana = median(NT_GER,na.rm = T),
              cv=sd(NT_GER,na.rm=T)/media*100,
              terceiro_quartil = quantile(NT_GER, 0.75),
              amplitude_interquartil=IQR(NT_GER)) %>%
              arrange(desc(mediana))



microdados_ti_sem_NA=microdados_ti %>% na.omit()


#Removendo  Na´S De todas As variáveis que possuem NA
microdados_ti_sem_NA=microdados_ti %>% na.omit()

# Teste usando sumarize
microdados_ti_sem_NA %>%
  select(NT_OBJ_CE) %>%
  summarise(  quantidade=n(),
              media = mean(NT_OBJ_CE),
              mediana = median(NT_OBJ_CE),
              moda=Mode(NT_OBJ_CE),
              cv=sd(NT_OBJ_CE)/media*100,
              assimetria=skewness(NT_OBJ_CE),
              curtose=kurtosis(NT_OBJ_CE),
              primeiro_quartil = quantile(NT_OBJ_CE,0.25),
              terceiro_quartil = quantile(NT_OBJ_CE,0.75),
  ) %>%
  arrange(desc(mediana))

summary(microdados_ti_sem_NA$NT_OBJ_CE)



# Melhorias aplicadas:
#Substituído = por <- para seguir a convenção do R.

#Adicionado na.rm = TRUE nas funções quantile() e IQR(), o que é essencial para evitar erros se houver valores faltantes.

#Indentação organizada para facilitar leitura.



# Comparar as médias por sexo e renda total da família
microdados_ti_mod2 <- microdados_ti_sem_NA %>%
  select(raca, NT_GER, hsalario) %>%
  group_by(hsalario, raca) %>%
  summarise(
    quantidade = n(),
    media = mean(NT_GER, na.rm = TRUE),
    mediana = median(NT_GER, na.rm = TRUE),
    cv = sd(NT_GER, na.rm = TRUE) / media * 100,
    terceiro_quartil = quantile(NT_GER, 0.75, na.rm = TRUE),
    amplitude_interquartil = IQR(NT_GER, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(mediana))

microdados_ti_mod2





# Carregar o pacote ggplot2
#library(ggplot2)

#Esse gráfico permite comparar a distribuição das notas por faixa de renda (hsalario) 
#e também como elas variam entre grupos de raça (raca), tudo em um só painel.

# Criar o boxplot
ggplot(microdados_ti_sem_NA, aes(x = hsalario, y = NT_GER, fill = raca)) +
  geom_boxplot(outlier.shape = NA) +  # remove pontos extremos visuais
  coord_flip() +  # gira os eixos para melhor leitura
  labs(
    title = "Distribuição da Nota Geral (NT_GER) por Renda e Raça",
    x = "Renda Familiar",
    y = "Nota Geral (NT_GER)",
    fill = "Raça"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

#Esse gráfico mostra a comparação direta das médias entre os grupos, 
#facilitando a interpretação de diferenças por renda e raça.

#valores nas colunas, posso mostrar como fazer isso também — veja um exemplo com rótulos.

# Carregar o pacote ggplot2
#library(ggplot2)

# Calcular as médias antes de plotar
media_por_grupo <- microdados_ti_sem_NA %>%
  group_by(hsalario, raca) %>%
  summarise(media_NT_GER = mean(NT_GER, na.rm = TRUE), .groups = "drop")

# Criar o gráfico de barras
ggplot(media_por_grupo, aes(x = hsalario, y = media_NT_GER, fill = raca)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Média da Nota Geral (NT_GER) por Renda Familiar e Raça",
    x = "Renda Familiar",
    y = "Média da Nota Geral",
    fill = "Raça"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))





# Carregar o pacote ggplot2
#library(ggplot2)

# Calcular as médias antes de plotar
media_por_grupo <- microdados_ti_sem_NA %>%
  group_by(hsalario, raca) %>%
  summarise(media_NT_GER = mean(NT_GER, na.rm = TRUE), .groups = "drop")

# Criar o gráfico de barras
ggplot(media_por_grupo, aes(x = hsalario, y = media_NT_GER, fill = raca)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Média da Nota Geral (NT_GER) por Renda Familiar e Raça",
    x = "Renda Familiar",
    y = "Média da Nota Geral",
    fill = "Raça"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Carregar o pacote ggplot2
library(ggplot2)

# Calcular as médias por grupo
media_por_grupo <- microdados_ti_sem_NA %>%
  group_by(hsalario, raca) %>%
  summarise(media_NT_GER = mean(NT_GER, na.rm = TRUE), .groups = "drop")

# Criar gráfico com rótulos
ggplot(media_por_grupo, aes(x = hsalario, y = media_NT_GER, fill = raca)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
  geom_text(aes(label = round(media_NT_GER, 1)),
            position = position_dodge(width = 0.9),
            vjust = -0.5, size = 3) +
  labs(
    title = "Média da Nota Geral (NT_GER) por Renda Familiar e Raça",
    x = "Renda Familiar",
    y = "Média da Nota Geral",
    fill = "Raça"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#exemplo de gráfico de dispersão interativo com plotly, mostrando a relação entre NT_OBJ_CE 
#(nota da parte específica) e NT_OBJ_FG (nota da parte geral), com os pontos coloridos por raca:

# Carregar os pacotes necessários
#library(plotly)
#library(dplyr)

# Criar o gráfico de dispersão interativo

#O que esse gráfico mostra:   Cada ponto é um aluno.

#As cores indicam a raça (raca).

#Ao passar o mouse, você vê renda, sexo e nota geral.


plot_ly(data = microdados_ti_sem_NA,
        x = ~NT_OBJ_CE,
        y = ~NT_OBJ_FG,
        color = ~raca,
        type = 'scatter',
        mode = 'markers',
        marker = list(size = 7, opacity = 0.6),
        text = ~paste("Renda:", hsalario,
                      "<br>Sexo:", sexo,
                      "<br>Nota Geral:", round(NT_GER, 1)),
        hoverinfo = 'text') %>%
  layout(title = "Relação entre Nota Específica e Geral por Raça",
         xaxis = list(title = "Nota Objetiva - Componente Específico"),
         yaxis = list(title = "Nota Objetiva - Formação Geral"))


#ersão com regressão linear sobre os pontos, posso mostrar como adicionar uma linha de tendência com lm() + ggplotly.


# Carregar pacotes
#library(ggplot2)
#library(plotly)

# Criar o gráfico com ggplot2

#O que esse gráfico traz:
#Pontos: alunos individualmente.

#Linha de regressão: uma para cada grupo de raca.

#Interatividade completa com tooltip ao passar o mouse.

p <- ggplot(microdados_ti_sem_NA, aes(x = NT_OBJ_CE, y = NT_OBJ_FG, color = raca)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Regressão: Nota Específica vs. Nota Geral",
    x = "Nota Objetiva - Componente Específico",
    y = "Nota Objetiva - Formação Geral",
    color = "Raça"
  ) +
  theme_minimal()

# Tornar o gráfico interativo com plotly
ggplotly(p)

#usando facet_wrap() para separar o gráfico de dispersão por sexo (sexo), mantendo a 
#linha de regressão linear e a coloração por raça (raca) — com interatividade via ggplotly():


#O que esse gráfico faz:
#Cria painéis separados por sexo.

#Mostra a relação entre NT_OBJ_CE e NT_OBJ_FG com uma regressão para cada raça.

#É interativo (tooltip, zoom, exportação etc.).


# Carregar pacotes
library(ggplot2)
library(plotly)

# Criar o gráfico com facet_wrap por sexo
p <- ggplot(microdados_ti_sem_NA, aes(x = NT_OBJ_CE, y = NT_OBJ_FG, color = raca)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~sexo) +  # Facetar por sexo
  labs(
    title = "Regressão: Nota Específica vs. Geral por Sexo",
    x = "Nota Objetiva - Componente Específico",
    y = "Nota Objetiva - Formação Geral",
    color = "Raça"
  ) +
  theme_minimal()

# Tornar o gráfico interativo
ggplotly(p)





#assimetria e curtose
dados_casados = microdados_ti_sem_NA %>%
  select(regiao,NT_GER,sexo) %>%
  group_by(regiao, sexo) %>%
  #filter(estado_civil=="Casado(a)") %>%
  summarise(  quantidade=n(),
              media = mean(NT_GER),
              mediana = median(NT_GER),
              cv=sd(NT_GER)/media*100,
              amplitude_interquartil=IQR(NT_GER),
              assimetria=skewness(NT_GER),
              curtose=kurtosis(NT_GER)
  ) %>%
  
  arrange(desc(cv))

#dados_regiao_sexo
  

#Gráficos da análise descritiva para a variável nota dos alunos escolhido aleatoriamente o curso 6208 [6208 = Engenharia de Produção]

g_hist=ggplot(microdados_ti_sem_NA,aes(x=NT_OBJ_CE)) +
  geom_histogram(color = "black",fill="lightblue",bins =50,aes(y=(..count..)/sum(..count..)))+
  ggtitle("Histograma da nota dos Alunos Eng de Produção (ENGPROD) ")+
  xlab("nota") +
  ylab("Frequência relativa")

g_densidade=ggplot(microdados_ti_sem_NA,aes(x=NT_OBJ_CE))+
  geom_density(col=2,size = 1, aes(y = 27 * (..count..)/sum(..count..))) +
  ggtitle("Curva de densidade da nota dos Alunos Eng de Produção") +
  xlab("Nota dos alunos de ADS") +
  ylab("Frequência relativa")

g_hist_densidade = ggplot(microdados_ti_sem_NA,aes(x=NT_OBJ_CE)) +
  geom_histogram(color = "black",fill="lightblue",bins =50,aes(y=(..count..)/sum(..count..)))+
  geom_density(col=2,size = 1, aes(y = 27 * (..count..)/sum(..count..))) +
  ggtitle("Histograma e curva de densidade da nota dos Alunos Eng de Produção")+
  xlab("Nota dos alunos de ADS") +
  ylab("Frequência relativa")

grid.arrange( g_hist,
              g_densidade,
              g_hist_densidade,
              nrow=3,ncol=1)



#library(ggplot2)
#library(dplyr)
#library(scales) # Need to import scales for scales::percent_format

# Se já criou a variável com rótulos descritivos:
# microdados_ti_sem_NA$turno_estagio

# Caso ainda não tenha criado:
microdados_ti_sem_NA <- microdados_ti_sem_NA %>%
  # Replace QE_174 with CO_TURNO_GRADUACAO and adjust the cases
  mutate(turno_estagio = case_when(
    CO_TURNO_GRADUACAO == 1 ~ "Matutino",
    CO_TURNO_GRADUACAO == 2 ~ "Vespertino",
    CO_TURNO_GRADUACAO == 3 ~ "Noturno",
    CO_TURNO_GRADUACAO == 4 ~ "Integral"
    # Removed the "Não realizou estágio" case as it does not correspond to CO_TURNO_GRADUACAO values 1-4
  ))

# Gráfico de barras com frequência relativa
ggplot(microdados_ti_sem_NA, aes(x = turno_estagio, fill = turno_estagio)) +
  geom_bar(aes(y = after_stat(count) / sum(after_stat(count))), color = "black", width = 0.7) + # Use after_stat for newer ggplot2 versions
  scale_y_continuous(labels = scales::percent_format(accuracy = 1)) +
  labs(
    title = "Distribuição do Turno de Graduação", # Updated title to reflect the variable
    x = "Turno da Graduação", # Updated x-axis label
    y = "Frequência Relativa (%)",
    fill = "Turno"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "none")


#Tabulação cruzada proporção
prop.table(table(microdados_ti_sem_NA$raca,microdados_ti_sem_NA$sexo))


dados=microdados_ti_sem_NA
grafico_histograma1 = ggplot(dados, aes(x=NT_GER,fill=raca)) +
  geom_histogram() +
  ggtitle("Gráfico histograma da Nota por Raça") +
  xlab("Notas") +
  ylab("Frequência simples") +
  facet_grid(~raca)


#ggplotly(grafico_histograma1)
grafico_histograma1


library(ggplot2)

# Histograma das notas gerais por turno do curso
grafico_histograma_turno = ggplot(microdados_ti, aes(x = NT_GER, fill = hturno)) +
  geom_histogram(binwidth = 2, color = "black", alpha = 0.7, position = "identity") +
  ggtitle("Histograma da Nota Geral por Turno do Curso") +
  xlab("Nota Geral (NT_GER)") +
  ylab("Frequência Simples") +
  facet_grid(~hturno) +
  theme_minimal(base_size = 13) +
  scale_fill_brewer(palette = "Set2", name = "Turno")

#grafico_histograma_turno

unique(microdados_ti$raca)
unique(microdados_ti$hturno)
unique(microdados_ti$sexo)
unique(microdados_ti$regiao)
unique(microdados_ti$hestudos)
unique(microdados_ti$hsalario)



#box-plot
dados=microdados_ti_sem_NA
grafico_boxplot2 = ggplot(dados, aes(x=regiao,y=NT_GER,fill=regiao)) +
  geom_boxplot() +
  ggtitle("Gráfico boxplot da Nota por
          região e sexo")+
  ylab("Notas") +
  facet_grid(~sexo)+
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

grafico_boxplot2

#Arrumando dados

dados=microdados_ti_sem_NA
grafico_histograma1 = ggplot(dados, aes(x=NT_GER,fill=raca)) +
  geom_histogram() +
  ggtitle("Gráfico histograma da Nota por Raça") +
  xlab("Notas") +
  ylab("Frequência simples") +
  facet_grid(~raca)


#ggplotly(grafico_histograma1)
grafico_histograma1


## Novos graficos

g_hist=ggplot(microdados_ti_sem_NA,aes(x=NT_OBJ_CE)) +
  geom_histogram(color = "black",fill="lightblue",bins =50,aes(y=(..count..)/sum(..count..)))+
  ggtitle("Histograma da nota dos Alunos Eng de Produção (ENGPROD) ")+
  xlab("nota") +
  ylab("Frequência relativa")

g_densidade=ggplot(microdados_ti_sem_NA,aes(x=NT_OBJ_CE))+
  geom_density(col=2,size = 1, aes(y = 27 * (..count..)/sum(..count..))) +
  ggtitle("Curva de densidade da nota dos Alunos Eng de Produção") +
  xlab("Nota dos alunos de ADS") +
  ylab("Frequência relativa")

g_hist_densidade = ggplot(microdados_ti_sem_NA,aes(x=NT_OBJ_CE)) +
  geom_histogram(color = "black",fill="lightblue",bins =50,aes(y=(..count..)/sum(..count..)))+
  geom_density(col=2,size = 1, aes(y = 27 * (..count..)/sum(..count..))) +
  ggtitle("Histograma e curva de densidade da nota dos Alunos Eng de Produção")+
  xlab("Nota dos alunos de ADS") +
  ylab("Frequência relativa")

grid.arrange( g_hist,
              g_densidade,
              g_hist_densidade,
              nrow=3,ncol=1)

# Comparar as médias por sexo e renda total da família
# Comparar as médias por raça e renda total da família
microdados_ti_mod2 <- microdados_ti_sem_NA %>%
  select(raca, NT_GER, hsalario) %>%
  group_by(hsalario, raca) %>%
  summarise(
    quantidade = n(),
    media = mean(NT_GER, na.rm = TRUE),
    mediana = median(NT_GER, na.rm = TRUE),
    cv = sd(NT_GER, na.rm = TRUE) / media * 100,
    terceiro_quartil = quantile(NT_GER, 0.75, na.rm = TRUE),
    amplitude_interquartil = IQR(NT_GER, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  arrange(desc(mediana))

# Imprimir todas as linhas
print(microdados_ti_mod2, n = Inf)



#library(ggplot2)

#library(ggplot2)

# Histograma das notas gerais por turno do curso
grafico_histograma_turno = ggplot(microdados_ti, aes(x = NT_GER, fill = hturno)) +
  geom_histogram(binwidth = 2, color = "black", alpha = 0.7, position = "identity") +
  ggtitle("Histograma da Nota Geral por Turno do Curso") +
  xlab("Nota Geral (NT_GER)") +
  ylab("Frequência Simples") +
  facet_grid(~hturno) +
  theme_minimal(base_size = 13) +
  scale_fill_brewer(palette = "Set2", name = "Turno")

## teeseete

ggplot(microdados_ti_sem_NA, aes(x = raca, y = NT_OBJ_FG, fill = raca)) +
  geom_boxplot() +
  labs(
    title = "Distribuição das Notas por Raça",
    x = "Raça/Cor",
    y = "Nota"
  ) +
  theme_minimal(base_size = 13) +
  scale_fill_brewer(palette = "Set2", name = "Raça") 
# sem vírgula aqui!









