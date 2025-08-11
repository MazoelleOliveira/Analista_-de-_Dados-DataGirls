# Analista_de_Dados_DataGirls
# Análise de Rotatividade de Funcionários (Employee Attrition Analysis)

### **Visão Geral**
Este projeto apresenta um dashboard de Power BI para analisar os fatores que influenciam a rotatividade de funcionários em uma empresa. O objetivo é transformar esses dados em insights acionáveis para a gestão de recursos humanos, com foco em identificar as principais causas por trás da saída de talentos.

### **Dados**
A análise foi desenvolvida com base no conjunto de dados **“IBM HR Analytics Attrition & Performance”**, disponível na plataforma Kaggle.

* **Exploração de Dados:** Ferramentas como o Excel foram utilizadas para a leitura e exploração inicial dos dados.
* **Dicionário de Dados:** Para uma melhor interpretação de cada variável, um dicionário de dados detalhado foi criado, servindo como guia durante toda a análise.
* **Limpeza e Preparação de Dados:** Utilizei o SQL Server para a limpeza, preparação e análise exploratória dos dados.
* **Visualização de Dados**
Para demonstrar os resultados das análises, utilizei o **Power BI**. Através de visuais como gráficos de barras, tabelas e KPIs, criei um dashboard que permite uma interpretação rápida e clara dos insights sobre a rotatividade.

### **Limpeza e Preparação de Dados**
Para garantir a qualidade dos dados, realizei as seguintes verificações utilizando consultas SQL:

#### **1. Verificação de Valores Nulos e Duplicados**
Iniciei o processo com uma verificação minuciosa para garantir a ausência de valores nulos em colunas-chave e de registros duplicados, que poderiam comprometer a análise.
#### **2. Validação de Inconsistências (Dados Numéricos)**
Em seguida, foram analisados os valores mínimos e máximos das principais colunas numéricas para identificar possíveis inconsistências ou valores atípicos.

### **Análise Exploratória (EDA)**

As seguintes consultas SQL foram utilizadas para explorar a base de dados, identificar padrões e gerar os principais insights que foram visualizados no dashboard.

#### **Análise de Rotatividade por Departamento**

A consulta abaixo foi usada para calcular a taxa de rotatividade por departamento, identificando qual deles enfrenta os maiores desafios.

<img width="663" height="265" alt="image" src="https://github.com/user-attachments/assets/f3d2d331-8602-4958-8532-fd89b969accd" />

#### **Análise de Salário Médio e Rotatividade**
As consultas a seguir exploram a relação entre o salário (`MonthlyIncome`) e a rotatividade, com um foco especial na segmentação por cargo.

* **Salário Médio por Cargo no Departamento de Vendas:**
<img width="662" height="339" alt="image" src="https://github.com/user-attachments/assets/4758c190-1806-43c3-9b5d-0ed9e89fd3fd" />

#### **Análise de Satisfação e Horas Extras**
As consultas a seguir investigam como a satisfação no trabalho e a carga de trabalho (`OverTime`) se relacionam com a rotatividade.

* **Satisfação Média de Quem Saiu vs. Quem Ficou:**
<img width="655" height="188" alt="image" src="https://github.com/user-attachments/assets/d4e38bd9-2a16-4957-b700-a8e46668470c" />

* **Proporção de Horas Extras por Rotatividade:**
<img width="673" height="246" alt="image" src="https://github.com/user-attachments/assets/d75c0057-5776-4592-8e8a-21603b6e0fd3" />

#### **Análise do Tempo de Casa (YearsAtCompany)**
Esta consulta foi crucial para identificar se a rotatividade segue um padrão temporal e para entender o momento crítico para a saída de funcionários.

* **Distribuição das Saídas por Anos de Empresa:**
<img width="667" height="284" alt="image" src="https://github.com/user-attachments/assets/4f7139c3-c637-44b5-baa8-32aa4461f6ce" />

### **Principais Descobertas da Análise Exploratória (EDA)**

As consultas realizadas no SQL Server permitiram extrair os seguintes insights preliminares, que serviram de base para a construção do dashboard no Power BI:

* **Identificação de Departamentos de Alto Risco:** A análise da taxa de rotatividade por departamento revelou que a área de **Vendas (`Sales`)** apresenta um índice de saída superior aos demais, merecendo uma atenção especial.

* **Rotatividade e Salário:** A exploração da renda mensal (`MonthlyIncome`) mostrou que, embora o salário médio geral de quem saiu seja menor, essa relação varia por cargo. Para `Sales Representatives`, por exemplo, a diferença salarial entre quem fica e quem sai é mais acentuada.

* **Influência de Fatores Comportamentais:** Houve uma clara identificação da correlação entre a realização de **horas extras (`OverTime`)** e a rotatividade. Além disso, a satisfação no trabalho (`JobSatisfaction`) de quem saiu era consistentemente menor.

* **Padrão Temporal de Saídas:** A análise do tempo de casa (`YearsAtCompany`) revelou que o **primeiro ano de empresa é o período mais crítico para a rotatividade**, com um número significativamente alto de saídas.

### **Insights da Visualização de Dados**

<img width="858" height="471" alt="image" src="https://github.com/user-attachments/assets/5e42dee3-8f12-475f-91f1-99e69d59edcb" />



* **Gráfico: Impacto das Horas Extras na Rotatividade**
    * **Insight:** A realização de horas extras (`OverTime`) está fortemente correlacionada com a rotatividade. Entre os funcionários que saíram (`Attrition: Yes`), uma proporção muito maior (53,59%) fazia horas extras do que entre os que ficaram (23,44%). Isso mostra que a sobrecarga de trabalho é um fator de risco significativo.

* **Tabela: Tempo de Casa (`YearsAtCompany`)**
    * **Insight:** A rotatividade é mais alta no primeiro ano de empresa. A maioria das saídas (59) ocorre com funcionários que têm apenas um ano na empresa, indicando que este é o período mais crítico para a retenção.

* **Gráfico: Média de Salário (`MonthlyIncome`) por Cargo (`JobRole`) e Rotatividade**
    * **Insight:** O salário tem um impacto diferente dependendo do cargo. Para cargos de entrada, como `Sales Representative`, a diferença salarial entre quem fica e quem sai é mais perceptível, sugerindo que o salário pode ser um fator determinante para a saída nesses cargos. Já para cargos de gerência (`Manager`), a média salarial é alta tanto para quem fica quanto para quem sai, o que indica que outros fatores podem estar influenciando a decisão.

* **Gráfico: Média de Satisfação por Rotatividade**
    * **Insight:** A satisfação no trabalho (`JobSatisfaction`) é um fator-chave. Os funcionários que saíram (`Attrition: Yes`) tinham, em média, um nível de satisfação menor (2,5) do que aqueles que permaneceram (2,8).

* **Gráfico: Média de Equilíbrio de Vida por Rotatividade**
    * **Insight:** O equilíbrio entre trabalho e vida pessoal (`WorkLifeBalance`) também afeta a decisão de sair. A média de equilíbrio é ligeiramente menor para os funcionários que saíram (2,7) do que para os que ficaram (2,8), reforçando a ideia de que a qualidade de vida no trabalho é importante.

### **5. Insights e Recomendações**
A análise dos dados de rotatividade permitiu identificar os principais fatores de risco e sugerir ações estratégicas para a gestão de pessoas.

#### **Perguntas Norteadoras de Negócio & Respostas**

**1. Qual perfil tem maior risco de rotatividade?**
* **Resumo:** O perfil com maior risco de saída são os funcionários com baixa satisfação no trabalho, que realizam horas extras de forma consistente e estão em cargos com remuneração inicial, como `Sales Representative`.

**2. Quais fatores (salário, idade, overtime etc.) mais influenciam na decisão de sair?**
* **Horas Extras (`OverTime`):** Este é um dos ofensores mais significativos. A análise mostrou que **53,59% dos funcionários que saíram faziam horas extras**, em comparação com apenas 23,44% dos que ficaram. Isso aponta para a sobrecarga de trabalho como um fator crítico.
* **Satisfação no Trabalho:** Há uma clara relação. A média de satisfação dos que saíram é consistentemente menor do que a dos que permaneceram, sugerindo que o engajamento e a qualidade do ambiente de trabalho são determinantes.
* **Salário:** O salário não é um fator isolado, mas a diferença salarial por cargo é relevante. Em posições como `Sales Representative`, a remuneração de quem sai é, em média, mais baixa.

**3. Qual departamento/cargo merece atenção imediata?**
* O departamento de **Vendas (`Sales`)** é a área mais crítica. A taxa de rotatividade é elevada e, dentro dele, o cargo de `Sales Representative` é o mais afetado pela combinação de salários mais baixos e outros fatores de insatisfação.

**4. Há padrão na duração do tempo de casa antes da saída?**
* Sim, a análise revela um padrão muito claro: o **primeiro ano de empresa é o período de maior risco**. O pico de saídas ocorre com funcionários que têm apenas um ano de casa, o que indica uma necessidade de reforçar programas de integração, acompanhamento e engajamento nos primeiros meses.

#### **Recomendações Acionáveis**
Com base nos insights, as seguintes políticas e programas são recomendados:

* **Controle de Horas Extras:** Implementar uma política rigorosa de monitoramento e compensação de horas extras para evitar a sobrecarga de trabalho, especialmente em departamentos de alto risco como Vendas.
* **Programas de Satisfação e Engajamento:** Desenvolver programas de satisfação e treinamentos que melhorem a qualidade do ambiente de trabalho e o equilíbrio entre vida profissional e pessoal.
* **Revisão Salarial para Cargos de Entrada:** Considerar uma revisão salarial para cargos como `Sales Representative`, garantindo que a remuneração seja competitiva e alinhada com o mercado, reduzindo o impacto financeiro na decisão de saída.
* **Estratégias de Retenção no Primeiro Ano:** Focar em programas de acompanhamento e mentoria para os novos funcionários durante o primeiro ano, garantindo que eles se sintam valorizados e integrados à cultura da empresa.





