-- Кількість закладів дошкільної освіти

SELECT  Terytorialnyi_rozriz,
        SUM(Year_2019) AS Institutions_2019,
        SUM(Year_2020) AS Institutions_2020,
        SUM(Year_2021) AS Institutions_2021,
        SUM(Year_2022) AS Institutions_2022,
        SUM(Year_2023) AS Institutions_2023,
        SUM(Year_2024) AS Institutions_2024,
        SUM(Year_2025) AS Institutions_2025
FROM `preschool-education-506217.my_dataset.v_preschool_institutions` 
WHERE Terytorialnyi_rozriz != 'Україна' AND
      Terytorialnyi_rozriz != 'Севастополь' AND
      Terytorialnyi_rozriz != 'Автономна Республіка Крим'
GROUP BY Terytorialnyi_rozriz
ORDER BY COLLATE(Terytorialnyi_rozriz, 'und:ci') ASC;

--Кількість місць у закладах дошкільної освіти

SELECT  Terytorialny_rozriz,
        SUM(Year_2019) AS Places_2019,
        SUM(Year_2020) AS Places_2020,
        SUM(Year_2021) AS Places_2021,
        SUM(Year_2022) AS Places_2022,
        SUM(Year_2023) AS Places_2023,
        SUM(Year_2024) AS Places_2024,
        SUM(Year_2025) AS Places_2025
FROM `preschool-education-506217.my_dataset.Кількість місць у закладах дошкільної освіти` 
WHERE Terytorialny_rozriz != 'Україна' AND
      Terytorialny_rozriz != 'Севастополь' AND
      Terytorialny_rozriz != 'Автономна Республіка Крим'
GROUP BY Terytorialny_rozriz
ORDER BY COLLATE(Terytorialny_rozriz, 'und:ci') ASC;

-- Кількість дітей у закладах дошкільної освіти

SELECT  Terytorialny_rozriz,
        SUM(Year_2019) AS Children_2019,
        SUM(Year_2020) AS Children_2020,
        SUM(Year_2021) AS Children_2021,
        SUM(Year_2022) AS Children_2022,
        SUM(Year_2023) AS Children_2023,
        SUM(Year_2024) AS Children_2024,
        SUM(Year_2025) AS Children_2025
FROM `preschool-education-506217.my_dataset.Кількість дітей у закладах дошкільної освіти`
WHERE Terytorialny_rozriz != 'Україна' AND
      Terytorialny_rozriz != 'Севастополь' AND
      Terytorialny_rozriz != 'Автономна Республіка Крим'
GROUP BY Terytorialny_rozriz
ORDER BY COLLATE(Terytorialny_rozriz, 'und:ci') ASC;

-- Oб'єднання даних

SELECT  pi.Terytorialnyi_rozriz,
        Institutions_2019,
        Institutions_2020,
        Institutions_2021,
        Institutions_2022,
        Institutions_2023,
        Institutions_2024,
        Institutions_2025,
        Places_2019,
        Places_2020,
        Places_2021,
        Places_2022,
        Places_2023,
        Places_2024,
        Places_2025,
        Children_2019,
        Children_2020,
        Children_2021,
        Children_2022,
        Children_2023,
        Children_2024,
        Children_2025       
FROM `preschool-education-506217.my_dataset.preschool_institutions` AS pi 
JOIN `preschool-education-506217.my_dataset.preschool_places` AS pp ON pp.Terytorialny_rozriz = pi.Terytorialnyi_rozriz
JOIN `preschool-education-506217.my_dataset.preschool_children` AS pc ON pc.Terytorialny_rozriz = pp.Terytorialny_rozriz
ORDER BY COLLATE(Terytorialnyi_rozriz, 'und:ci') ASC;


