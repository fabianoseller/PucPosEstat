<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

# faça um resumo dos textos trabalhados nessa lista de perguntas, Lista de Exercícios 2

Inferência Estatística

Segue um resumo dos principais conceitos e conteúdos trabalhados na lista de exercícios sobre Inferência Estatística, baseado nos textos e referências estudadas:

---

## Resumo – Inferência Estatística

### 1. Estatísticas e Parâmetros

- **Parâmetros** são características da população, como média ($\mu$) e variância ($\sigma^2$).
- **Estatísticas** são calculadas a partir da amostra, como média amostral ($\bar{X}$) e variância amostral ($S^2$), usadas para estimar parâmetros populacionais.
- Estimativas são valores específicos obtidos para uma amostra, representados por letras minúsculas (ex: $x$, $s^2$).


### 2. Estimadores e suas Propriedades

- Um **estimador** é uma função dos dados amostrais que serve para inferir um parâmetro desconhecido.
- A **média amostral** é um estimador não viesado, consistente e eficiente para a média populacional, ou seja:
    - **Não viesado:** em média, estima corretamente o parâmetro.
    - **Consistente:** conforme a amostra cresce, a estimativa se aproxima do valor verdadeiro.
    - **Eficiente:** possui a menor variância entre estimadores não viesados.
- Estimadores baseados em apenas um elemento da amostra são não viesados, mas não consistentes nem eficientes.


### 3. Distribuição Amostral da Média

- A média amostral tem distribuição normal se a população for normal ou, para amostras grandes, pelo **Teorema Central do Limite (TCL)**, que garante a aproximação da distribuição da média para uma normal com média $\mu$ e variância $\sigma^2/n$.
- Conhecer essa distribuição permite quantificar a variabilidade da média amostral e construir intervalos de confiança.


### 4. Estimação Pontual e Intervalar

- **Estimação pontual:** fornece um único valor estimado para o parâmetro (ex: média amostral).
- **Intervalo de confiança:** fornece uma faixa de valores plausíveis para o parâmetro, com um nível de confiança associado (ex: 95%).
- O intervalo considera a variabilidade da amostra e o grau de confiança desejado.


### 5. Métodos de Estimação

- **Método dos Momentos:** iguala momentos teóricos da distribuição (média, variância) aos momentos amostrais para estimar parâmetros. Simples, mas pode ser menos eficiente.
- **Método da Máxima Verossimilhança:** busca os parâmetros que maximizam a probabilidade dos dados observados, geralmente produz estimativas mais precisas, porém com maior complexidade computacional.


### 6. Construção de Intervalos de Confiança para Proporções

- Para variáveis dicotômicas (ex: satisfeito/insatisfeito), o intervalo de confiança para a proporção populacional é construído usando a proporção amostral e a distribuição normal (quando a amostra é grande o suficiente).
- Fórmula básica:

$$
\hat{p} \pm z_{1-\alpha/2} \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}
$$


### 7. Eficiência e Erro Quadrático Médio (EQM)

- Um estimador mais eficiente tem menor variância.
- O EQM combina variância e viés para avaliar a qualidade do estimador; o estimador com menor EQM é preferível.

---

Esse resumo integra os conceitos fundamentais para entender como, a partir de uma amostra, podemos estimar parâmetros populacionais, avaliar a qualidade dessas estimativas e construir intervalos que refletem a incerteza inerente ao processo amostral.

Se desejar, posso ajudar a elaborar exemplos práticos, códigos em R ou Python, e relatórios para aprofundar esses conceitos.

<div style="text-align: center">⁂</div>

[^1]: https://www.professores.uff.br/anafarias/wp-content/uploads/sites/210/2020/09/inferencia-1pop-00.pdf

[^2]: https://www.ime.usp.br/~sandoval/mae5755/Inferencia estatistica.pdf

[^3]: https://pessoal.ect.ufrn.br/~rbatista/files/pe/aulas/Aula 7 - Distribuição da Média  Amostral.pdf

[^4]: http://leg.ufpr.br/~walmes/ensino/CEQ/slides/02-revisao-infer.pdf

[^5]: https://www.lampada.uerj.br/arquivosdb/_book/estimadores.html

[^6]: https://pt.wikipedia.org/wiki/Inferência_estat%C3%ADstica

[^7]: http://www.uel.br/pessoal/tiagodesantana/pages/arquivos/2STA061-Inferencia Estatistica/Slides/08-Estimacao.pdf

[^8]: https://www.ime.usp.br/~lane/home/MAE0261/aula_DistAmostrais_ICsimples.pdf

