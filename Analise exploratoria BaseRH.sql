Analisando a base 

SELECT
  SUM(CASE WHEN [Age] IS NULL THEN 1 ELSE 0 END) AS nulos_Age,
  SUM(CASE WHEN [Attrition] IS NULL THEN 1 ELSE 0 END) AS nulos_Attrition,
  SUM(CASE WHEN [BusinessTravel] IS NULL THEN 1 ELSE 0 END) AS nulos_BusinessTravel,
  SUM(CASE WHEN [DailyRate] IS NULL THEN 1 ELSE 0 END) AS nulos_DailyRate,
  SUM(CASE WHEN [Department] IS NULL THEN 1 ELSE 0 END) AS nulos_Department,
  SUM(CASE WHEN [EmployeeNumber] IS NULL THEN 1 ELSE 0 END) AS nulos_EmployeeNumber,
  SUM(CASE WHEN [MonthlyIncome] IS NULL THEN 1 ELSE 0 END) AS nulos_MonthlyIncome,
  SUM(CASE WHEN [TotalWorkingYears] IS NULL THEN 1 ELSE 0 END) AS nulos_TotalWorkingYears
FROM BaseRH

--nao tem valores nulos

--Valores Duplicados 

select EmployeeNumber,
count(*)
from BaseRH
Group by 
EmployeeNumber
having COUNT(*) >1

-- verificar inconsistencia no dados categoricos

SELECT
  MIN([Age]) AS IdadeMinima,
  MAX([Age]) AS IdadeMaxima,
  MIN([MonthlyIncome]) AS SalarioMinimo,
  MAX([MonthlyIncome]) AS SalarioMaximo,
  MIN([YearsAtCompany]) AS AnosNaEmpresaMinimo,
  MAX([YearsAtCompany]) AS AnosNaEmpresaMaximo,
  Min ([YearsInCurrentRole]) As AnosNoCargoMinimo,
  Max ([YearsInCurrentRole]) As AnosNoCargoMaximo
FROM BaseRH

Analise exploratoria 

-- Tenho mais Homens ou mulheres trabalhando na empresa?

SELECT
  Gender,
  COUNT(*) AS Total
FROM BaseRH
GROUP BY
  Gender;

 --- Contar Homens e mulheres por idade 

 SELECT
  [Age],
  [Gender],
  COUNT(*) AS Total
FROM BaseRH
GROUP BY
  [Age],
  [Gender]
ORDER BY
  [Age],
  [Gender];

  --- Quantos Funcion�rios sairam por idade e g�nero?
Select
  [Age],
  [Gender],
  COUNT(*) AS TotalDemissoes
FROM BaseRH
WHERE
  [Attrition] = 'Yes'
GROUP BY
  [Age],
  [Gender]
ORDER BY
  [Age] ASC,
  TotalDemissoes ASC;

-- Quantos funcionarios temos por departamento e genero?
SELECT
  Department,
  Gender,
  COUNT(*) AS total_funcionarios
FROM BaseRH
GROUP BY
  Department, Gender
ORDER BY
  Department, total_funcionarios DESC;

--- Qual departamento tem o maior problema de demissoes?

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

  ---Analisar Sal�rio M�dio por Attrition
  --- Funcion�rios que sa�ram da empresa ganhavam um sal�rio menor, em m�dia, do que os que ficaram?
  
  SELECT
  Attrition,
  AVG(MonthlyIncome) AS SalarioMedio
FROM BaseRH
GROUP BY
  Attrition;

  ----------------------------------------
  -- Existe algum departamento onde a diferen�a salarial entre quem saiu e quem ficou � maior?
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



 --  Dentro do departamento de Vendas, quais cargos (JobRole) s�o mais afetados por essa diferen�a salarial?

 SELECT
  [JobRole],
  [Attrition],
  AVG([MonthlyIncome]) AS SalarioMedio
FROM BaseRH
WHERE
  [Department] = 'Sales'
GROUP BY
  [JobRole],
  [Attrition]
ORDER BY
  [JobRole],
  [Attrition];

 -- Analisar a M�dia de Satisfa��o de Quem Saiu vs. Quem Ficou
-- Quem saiu do departamento de Vendas estava menos satisfeito com o trabalho?

SELECT
  [Attrition],
  AVG([JobSatisfaction]) AS SatisfacaoMedia,
  AVG([EnvironmentSatisfaction]) AS AmbienteMedia
FROM BaseRH
WHERE
  [Department] = 'Sales'
GROUP BY
  [Attrition];



  --- A rotatividade no departamento de Vendas est� relacionada a sobrecarga ou falta de equil�brio?

SELECT
  [Attrition],
  AVG([WorkLifeBalance]) AS EquilibrioMedio,
  SUM(CASE WHEN [OverTime] = 1 THEN 1 ELSE 0 END) AS TotalComHorasExtras
FROM [BaseRH]
WHERE
  [Department] = 'Sales'
GROUP BY
  [Attrition];

  --- proporcao de horas extras 

  SELECT
  [Attrition],
  COUNT(CASE WHEN [OverTime] = 1 THEN 1 ELSE NULL END) AS TotalComHorasExtras,
  COUNT(*) AS TotalGrupo,
  CAST(COUNT(CASE WHEN [OverTime] = 1 THEN 1 ELSE NULL END) AS FLOAT) * 100 / COUNT(*) AS ProporcaoHorasExtras
FROM BaseRH
WHERE
  [Department] = 'Sales'
GROUP BY
  [Attrition];

 -- An�lise da M�dia, M�nimo e M�ximo

 SELECT
  AVG([YearsAtCompany]) AS AnosMedio,
  MIN([YearsAtCompany]) AS AnosMinimo,
  MAX([YearsAtCompany]) AS AnosMaximo
FROM BaseRH
WHERE
  [Attrition] = 'YES' 

  ---distribui��o exata das sa�das por ano de casa:

  SELECT
  [YearsAtCompany],
  COUNT(*) AS TotalSaidas
FROM BaseRH
WHERE
  [Attrition] = 'YES' -- Filtra apenas para quem saiu
GROUP BY
  [YearsAtCompany]
ORDER BY
  TotalSaidas DESC; -- Ordena para ver os anos com mais sa�das primeiro









 




