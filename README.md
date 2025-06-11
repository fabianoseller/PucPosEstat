# PucPosEstat
Lista de Exercícios  - Estatística [Avaliação Final Estatística Descritiva]


**Avaliação Final Estatística Descritiva (0 \- 6\)**:	

**OBS:** Apresentar um **relatório** **gerado no Rmarkdown** com todas as **Análises** e o **Dashboard** pode ser entregue o próprio código gerado em **flexdashboard**.

	

**A)** Faça a **importação** para o **R** do arquivo do **ENADE 2017** Utilizado em nosso curso **(MICRODADOS ENADE 2017.txt)**  (**Valor: 0,5 Pontos)** 

**B)** Faça um **filtro** **escolhendo** as **seguintes variáveis** e as classifique quanto ao tipo de variável (EX: **Qualitativa nominal, Quantitativa contínua**...): N**T\_OBJ\_FG, CO\_GRUPO, CO\_REGIAO\_CURSO, QE\_I02, CO\_TURNO\_GRADUACAO (Valor 0,5 Pontos)** 

**C)** **Escolha** um **curso do Enade (Não pode ser análise e desenvolvimento de sistemas (ADS) )** e **filtre só esse curso** para a nossa **análise**: **(Valor 0,5 Pontos)** 

**Variável área de enquadramento do curso no Enade**: **co\_grupo**

**D)** **Transforme** as variáveis colocando os seus **devidos rótulos**, para que facilite a **análise descritiva:** (**Valor 0,5 Pontos)** 

**Exemplo**: **Estado civil "A", vai virar "Solteiro"**	

**E)** Faça as **estatísticas descritivas** do seu banco **(Resumo geral)**, **avaliando** se há **variáveis faltantes** ou não, e se existirem, **elimine-as.** (**Valor 0,5 Pontos)** 

**F)** **Escolha** **uma** das variáveis **ou ambas**: **Turnos (CO\_TURNO\_GRADUACAO)** ou **RAÇA ( QE\_I02)** e **estude o comportamento** das notas dos **alunos**, **faça** o **cruzamento de variáveis**, elabore **gráficos adequados para cada tipo de variável**, se há razão para desconfiar que há uma **diferença significativa entre as categorias,** de forma geral e entre **regiões**. (Valor 3,0 Pontos) 

Exemplo: Há razão para desconfiar que pessoas brancas têm melhores notas que amarelos? 

Exemplo: Há razão para desconfiar que pessoas que estudam no turno da manhã têm notas maiores que os que estudam à noite?  	

Exemplo: Há razão para desconfiar que pessoas pretas da região sul têm notas maiores que pessoas pretas da região norte?	

G) Elaborar um **Dashboard** usando **Flexdashboard** para que alguém responsável por **elaborar políticas públicas**, fosse capaz de **evidenciar insights** na elaboração das **mesmas**  (0,5) (Pode ser **publicado** ou só com os **códigos no flexdashboard)**

**OBS**: Utilize **todas as técnicas** ensinadas para chegar nesse objetivo **(Medidas de tendência central, Medidas de dispersão, Histograma, Box-Plot...Etc)**

**Avaliação Final Probabilidade (0-4):**

Escolher uma **distribuição de Probabilidade** e mostrar a aplicação do **teorema central do limite (TCL)** para a mesma:

**NOME           Distribuição de probabilidade escolhida**

1) 	**Exponencial**   
2)      	**Poisson**   
3) 	**Weibull**  
4) 	**Binomial (NÃO PODE)**  
5)              **Uniforme**   
6) 	**Geométrica**   
7)              **Beta**   
8)              **Uniforme**   
9)              **Hipergeométrica**    
10)              **T de Student**   
11)              **Qui-quadrado**   
12)             **Gama**  
13)             **Binomial Negativa**   
14)             **Log-Normal**   
15)             **F-Snedecor**  
16)             **Gumbel**

**Avaliação TOTAL (0 \- 10\)**

**(Composição das notas de Estatística Descritiva \+ Cálculo das Probabilidades)**

**Vou sinalizar em verde os que entregaram o trabalho final até o momento, caso seu nome não esteja em verde e já tenha enviado, me comunique por gentileza no ZAP BUSINESS: 21 97623205**

**Colocar aqui: Grupo |Curso escolhido para analisar | Nome e sobrenome dos Integrantes do Grupo**

**\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_**

**Padrão Envio da Avaliação Estatistica Descritiva e Probabilidade:**

**E-MAIL: profestathimarques@gmail.com**

**NOME SOBRENOME \- AVALIACÃO \- PÓS ESTAT DS PUC MG \- TURMA 4**

**(MUITO IMPORTANTE SEGUIR ESSE PADRÃO PARA EU ENCONTRAR O SEU PROJETO FINAL)**

**Arquivo HTML RELATÓRIO: nome\_sobrenome\_arquivo.html** 

**Arquivo HTML DASHBOARD: nome\_sobrenome\_arquivo.html** 

**Arquivo RMD RELATÓRIO: nome\_sobrenome\_arquivo.rmd**

**Arquivo RMD DASHBOARD: nome\_sobrenome\_arquivo.rmd**

**ou** 

**Arquivo NOTEBOOK: nome\_sobrenome\_arquivo.ipynb**

**Links PÚBLICOS DOS NOTEBOOKs** 

**Padrão Envio da Avaliação Cálculo das Probabilidades:**

**Arquivo RMD RELATÓRIO: nome\_sobrenome\_arquivo.rmd**

**Arquivo RMD DASHBOARD: nome\_sobrenome\_arquivo.rmd**

**Arquivo RMD RELATÓRIO: nome\_sobrenome\_arquivo.html** 

**Arquivo RMD DASHBOARD: nome\_sobrenome\_arquivo.html** 

**ou**

**Arquivo NOTEBOOK: nome\_sobrenome\_arquivo.ipynb**

**Links PÚBLICOS DOS NOTEBOOKs**

**Os trabalhos também serão aceitos com os arquivos do colab com a linguagem R em formato notebook (ipynb) ou com o link público (Se certificar que o link está público para que eu consiga acessar)**

**Prazo de entrega:15 de junho (Domingo) (23:59)**

**Dicionário de Cursos:**

**\#area\_curso**

**\#Código da área de enquadramento do curso no Enade**

| 21 \= Arquitetura e Urbanismo 72 \= Tecnologia em Análise e Desenvolvimento de Sistemas (NÃO PODE) 76 \= Tecnologia em Gestão da Produção Industrial 79 \= Tecnologia em Redes de Computadores 701 \= Matemática (Bacharelado) 702 \= Matemática (Licenciatura) 903 \= Letras-Português (Bacharelado) 904 \= Letras-Português (Licenciatura) 905 \= Letras-Português e Inglês (Licenciatura) 906 \= Letras-Português e Espanhol (Licenciatura) 1401 \= Física (Bacharelado)  1402 \= Física (Licenciatura) 1501 \= Química (Bacharelado)0 1502 \= Química (Licenciatura) 1601 \= Ciências Biológicas (Bacharelado) 1602 \= Ciências Biológicas (Licenciatura) 2001 \= Pedagogia (Licenciatura) 2401 \= História (Bacharelado) 2402 \= História (Licenciatura) 2501 \= Artes Visuais (Licenciatura) 3001 \= Geografia (Bacharelado) 3002 \= Geografia (Licenciatura) 3201 \= Filosofia (Bacharelado) 3202 \= Filosofia (Licenciatura) 3502 \= Educação Física (Licenciatura) |
| :---- |
| **4003 \= Engenharia Da Computação 4004 \= Ciência Da Computação (Bacharelado)  4005 \= Ciência Da Computação (Licenciatura) 4006 \= Sistemas De Informação 4301 \= Música (Licenciatura) 5401 \= Ciências Sociais (Bacharelado)  5402 \= Ciências Sociais (Licenciatura) 5710 \= Engenharia Civil  5814 \= Engenharia de Controle e Automação 5902 \= Engenharia Mecânica 6002 \= Engenharia de Alimentos 6008 \= Engenharia Química 6208 \= Engenharia de Produção 6306 \= Engenharia 6307 \= Engenharia Ambiental 6405 \= Engenharia Florestal 6407 \= Letras \- Inglês 6409 \= Tecnologia em Gestão da Tecnologia da Informação** |

