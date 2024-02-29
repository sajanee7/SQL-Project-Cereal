Select * From cereal;

-- Count of total cereal names produced by each manufacturer

Select mfr, Count(*) as Total From cereal
Group by mfr 
Order by Total DESC;


-- Count of total cereal on the basis of type (cold or hot)

Select type, Count(*) as Total From cereal 
Group by type 
Order by Total Desc;


-- List of top ten cereals on the basis of ratings

Select TOP 10 name, mfr, rating From cereal 
Order by rating DESC;


-- List of cereals whose calories is greater than the average calories

Select name, mfr, calories From cereal 
Where calories > (
    Select AVG(calories) From cereal 
);


-- List of manufacturers with their average calories

Select mfr, Count(*) as TotalNum, AVG(calories) as AvgCal, AVG(protein) as AvgPro, AVG(carbo) as AvgCarb, 
AVG(potass) as AvgPotas, AVG(sugars) as AvgSug
From cereal 
Group by mfr
Order by TotalNum DESC;


-- List of cereal with 'wheat' as an ingredient

Select name, mfr, protein, fiber, vitamins From cereal 
Where name Like '%wheat%'
Order by mfr;


-- Is cereal's rating affected by its sugar, carbohydrate and fiber contents?

Select name, sugars, carbo, fiber, rating From cereal
Where rating > (
    Select AVG(rating) From cereal 
)
Order by rating DESC;


-- List of cereal with max calories for each mfr

Select mfr, MAX(calories) as MaxCal From cereal
Group by mfr
Order by MaxCal;
