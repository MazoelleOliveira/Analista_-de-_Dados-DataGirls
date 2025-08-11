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

Limpeza e Preparação de Dados
Para garantir a qualidade e a confiabilidade da análise, as seguintes etapas de limpeza e validação de dados foram realizadas utilizando SQL Server.

1. Verificação de Valores Nulos e Duplicados
Iniciou-se o processo verificando a existência de valores nulos em colunas críticas e a presença de dados duplicados, que poderiam distorcer os resultados.

-- Verificação de valores nulos
SELECT
  SUM(CASE WHEN [Age] IS NULL THEN 1 ELSE 0 END) AS nulos_Age,
  SUM(CASE WHEN [Attrition] IS NULL THEN 1 ELSE 0 END) AS nulos_Attrition,
  SUM(CASE WHEN [BusinessTravel] IS NULL THEN 1 ELSE 0 END) AS nulos_BusinessTravel,
  SUM(CASE WHEN [DailyRate] IS NULL THEN 1 ELSE 0 END) AS nulos_DailyRate,
  SUM(CASE WHEN [Department] IS NULL THEN 1 ELSE 0 END) AS nulos_Department,
  SUM(CASE WHEN [EmployeeNumber] IS NULL THEN 1 ELSE 0 END) AS nulos_EmployeeNumber,
  SUM(CASE WHEN [MonthlyIncome] IS NULL THEN 1 ELSE 0 END) AS nulos_MonthlyIncome,
  SUM(CASE WHEN [TotalWorkingYears] IS NULL THEN 1 ELSE 0 END) AS nulos_TotalWorkingYears
FROM BaseRH;

-- Resultado: Não foram encontrados valores nulos.

-- Verificação de valores duplicados por EmployeeNumber
SELECT EmployeeNumber,
COUNT(*)
FROM BaseRH
GROUP BY
EmployeeNumber
HAVING COUNT(*) > 1;

-- Resultado: Não foram encontrados registros duplicados com base no EmployeeNumber.

2. Validação de Inconsistências (Dados Numéricos)
Em seguida, foram analisados os valores mínimos e máximos das principais colunas numéricas para identificar possíveis inconsistências ou valores atípicos (outliers).

SELECT
  MIN([Age]) AS IdadeMinima,
  MAX([Age]) AS IdadeMaxima,
  MIN([MonthlyIncome]) AS SalarioMinimo,
  MAX([MonthlyIncome]) AS SalarioMaximo,
  MIN([YearsAtCompany]) AS AnosNaEmpresaMinimo,
  MAX([YearsAtCompany]) AS AnosNaEmpresaMaximo,
  Min ([YearsInCurrentRole]) As AnosNoCargoMinimo,
  Max ([YearsInCurrentRole]) As AnosNoCargoMaximo
FROM BaseRH;

Análise Exploratória (EDA)
As consultas SQL abaixo foram utilizadas para explorar a base de dados, identificar padrões e gerar os principais insights que foram visualizados no dashboard.

Análise da Rotatividade por Departamento
A consulta abaixo foi usada para calcular a taxa de rotatividade por departamento, identificando qual deles enfrenta os maiores desafios.

SELECT
  [Department],
  COUNT(*) AS TotalFuncionarios,
  SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) AS TotalDemissoes,
  CAST(SUM(CASE WHEN [Attrition] = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) * 100 / COUNT(*) AS TaxaRotatividade
FROM BaseRH
GROUP BY
  [Department]
ORDER BY
  TaxaRotatividade DESC;

Análise de Salário Médio
As consultas a seguir exploram a relação entre o salário (MonthlyIncome) e a rotatividade.

Salário Médio por Attrition:

SELECT
  Attrition,
  AVG(MonthlyIncome) AS SalarioMedio
FROM BaseRH
GROUP BY
  Attrition;

Salário Médio por Departamento e Attrition:

SELECT
  [Department],
  [Attrition],
  AVG([MonthlyIncome]) AS SalarioMedio
FROM BaseRH
GROUP BY
  [Department],
  [Attrition]
ORDER BY
  [Department],
  [Attrition];



