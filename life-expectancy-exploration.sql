SELECT *
FROM life_expectancy.global;

SELECT *
FROM life_expectancy.age_group;

SELECT *
FROM life_expectancy.men_to_65;

SELECT *
FROM life_expectancy.women_to_65;

-- Life expectancy
SELECT Entity, Year, `Life expectancy at birth (historical)`
FROM life_expectancy.global
ORDER BY 1, 2;

-- Life expectancy in 2021 in descending order
SELECT Entity, `Life expectancy at birth (historical)`
FROM life_expectancy.global
WHERE Year = "2021"
ORDER BY 2 DESC;

-- Average life expectancy in the last 5 years in descending oreder
SELECT Entity, AVG(`Life expectancy at birth (historical)`) AS AverageLifeExpectancy
FROM life_expectancy.global
WHERE Year > 2016
GROUP BY Entity
ORDER BY 2 DESC;

-- Age less than 5 death in descending order 2019
SELECT Entity, `Deaths - All causes - Sex: Both - Age: Under 5 (Number)`
FROM life_expectancy.age_group
WHERE Year = 2019
AND Code != ""
AND Entity != "World"
ORDER BY 2 DESC;

-- Age 5-14 years deaths in descending order 2019
SELECT Entity, `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)`
FROM life_expectancy.age_group
WHERE Year = 2019
AND Code != ""
AND Entity != "World"
ORDER BY 2 DESC;

-- Age 15-49 years deaths in descending order 2019
SELECT Entity, `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)`
FROM life_expectancy.age_group
WHERE Year = 2019
AND Code != ""
AND Entity != "World"
ORDER BY 2 DESC;

-- Age 50-69 years deaths in descending order 2019
SELECT Entity, `Deaths - All causes - Sex: Both - Age: 50-69 years (Number)`
FROM life_expectancy.age_group
WHERE Year = 2019
AND Code != ""
AND Entity != "World"
ORDER BY 2 DESC;

-- Age 70+ years deaths in descending order 2019
SELECT Entity, `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`
FROM life_expectancy.age_group
WHERE Year = 2019
AND Code != ""
AND Entity != "World"
ORDER BY 2 DESC;

-- Total deaths in descending order 2019
SELECT Entity, (`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`) AS TotalDeathsIn2019
FROM life_expectancy.age_group
WHERE Year = 2019
AND Code != ""
AND Entity != "World"
ORDER BY 2 DESC;

-- Total world death percentage per age group
SELECT  Entity,
		Year,
		(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageUnder5,
        (`Deaths - All causes - Sex: Both - Age: 5-14 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage5to14,
        (`Deaths - All causes - Sex: Both - Age: 15-49 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage15to49,
        (`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage50to69,
        (`Deaths - All causes - Sex: Both - Age: 70+ years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageAbove70,
        (`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`) AS TotalDeaths
FROM life_expectancy.age_group
WHERE Entity = "World";

-- Percentage of death per age group globally
SELECT  Entity,
		Year,
		(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageUnder5,
        (`Deaths - All causes - Sex: Both - Age: 5-14 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage5to14,
        (`Deaths - All causes - Sex: Both - Age: 15-49 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage15to49,
        (`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage50to69,
        (`Deaths - All causes - Sex: Both - Age: 70+ years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageAbove70,
        (`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`) AS TotalDeaths
FROM life_expectancy.age_group
WHERE Code != ""
AND Entity != "World"
ORDER BY 1, 2;

-- Percentage of death per age group in Indonesia
SELECT  Entity,
		(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageUnder5,
        (`Deaths - All causes - Sex: Both - Age: 5-14 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage5to14,
        (`Deaths - All causes - Sex: Both - Age: 15-49 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage15to49,
        (`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage50to69,
        (`Deaths - All causes - Sex: Both - Age: 70+ years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageAbove70,
        (`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`) AS TotalDeathsIn2019Indonesia
FROM life_expectancy.age_group
WHERE Year = 2019
AND Entity = "Indonesia";

-- Percentage of survival to age 65 by gender
SELECT women.Entity, women.Year, men.`Survival to age 65, male (% of cohort)`, women.`Survival to age 65, female (% of cohort)`
FROM life_expectancy.men_to_65 men
JOIN life_expectancy.women_to_65 women
	ON men.Entity = women.Entity
    AND men.Year = women.Year
WHERE men.Code != ""
AND women.Entity != "World"
ORDER BY 1, 2;

-- Percentage of survival to age 65 by gender in 2020
SELECT women.Entity, women.Year, men.`Survival to age 65, male (% of cohort)`, women.`Survival to age 65, female (% of cohort)`
FROM life_expectancy.men_to_65 men
JOIN life_expectancy.women_to_65 women
	ON men.Entity = women.Entity
    AND men.Year = women.Year
WHERE men.Year = 2020;

-- Creating View to store data for later visualization
-- Age Group
CREATE VIEW AgeGroupDeathPercentage AS
SELECT  Entity,
		(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageUnder5,
        (`Deaths - All causes - Sex: Both - Age: 5-14 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage5to14,
        (`Deaths - All causes - Sex: Both - Age: 15-49 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage15to49,
        (`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentage50to69,
        (`Deaths - All causes - Sex: Both - Age: 70+ years (Number)`/(`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`))*100 AS DeathPercentageAbove70,
        (`Deaths - All causes - Sex: Both - Age: Under 5 (Number)` + `Deaths - All causes - Sex: Both - Age: 5-14 years (Number)` + `Deaths - All causes - Sex: Both - Age: 15-49 years (Number)` +`Deaths - All causes - Sex: Both - Age: 50-69 years (Number)` + `Deaths - All causes - Sex: Both - Age: 70+ years (Number)`) AS TotalDeathsIn2019
FROM life_expectancy.age_group
WHERE Year = 2019
AND Code != ""
AND Entity != "World"
ORDER BY 7 DESC;

-- Gender
CREATE VIEW GenderTo65Percentage AS
SELECT women.Entity, women.Year, men.`Survival to age 65, male (% of cohort)`, women.`Survival to age 65, female (% of cohort)`
FROM life_expectancy.men_to_65 men
JOIN life_expectancy.women_to_65 women
	ON men.Entity = women.Entity
    AND men.Year = women.Year
WHERE men.Year = 2020;

-- Global Life Expectancy 2021
CREATE VIEW LifeExpectancy2021 AS
SELECT Entity, `Life expectancy at birth (historical)`
FROM life_expectancy.global
WHERE Year = "2021"
ORDER BY 2 DESC;

-- Average Global Life Expectancy 2017 - 2021
CREATE VIEW Last5YearsLifeExpectancy AS
SELECT Entity, AVG(`Life expectancy at birth (historical)`) AS AverageLifeExpectancy
FROM life_expectancy.global
WHERE Year > 2016
GROUP BY Entity
ORDER BY 2 DESC;