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
Para garantir a qualidade e a confiabilidade da análise, as seguintes etapas de limpeza e validação de dados foram realizadas utilizando SQL.

1. Verificação de Valores Nulos e Duplicados
Iniciou-se o processo verificando a existência de valores nulos em colunas críticas e a presença de dados duplicados, que poderiam distorcer os resultados.

SQL

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
2. Validação de Inconsistências em Dados Categóricos e Numéricos
Em seguida, foram analisados os valores mínimos e máximos das principais colunas numéricas para identificar possíveis inconsistências ou valores atípicos (outliers).

SQL

SELECT
  MIN([Age]) AS IdadeMinima,
  MAX([Age]) AS IdadeMaxima,
  MIN([MonthlyIncome]) AS SalarioMinimo,
  MAX([MonthlyIncome]) AS SalarioMaximo,
  MIN([YearsAtCompany]) AS AnosNaEmpresaMinimo,
  MAX([YearsAtCompany]) AS AnosNaEmpresaMaximo,
  MIN([YearsInCurrentRole]) AS AnosNoCargoMinimo,
  MAX([YearsInCurrentRole]) AS AnosNoCargoMaximo
FROM BaseRH;
  




