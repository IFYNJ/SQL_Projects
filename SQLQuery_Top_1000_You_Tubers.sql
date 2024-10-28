SELECT TOP (1000) [Rank]
      ,[Channel_Name]
      ,[Category]
      ,[Subscribers]
      ,[Country]
      ,[Average_Views]
      ,[Average_Likes]
      ,[Average_Comments]
      ,[Content_Type]
  FROM [You_Tubers_db].[dbo].[Youtuber]



     /* 
  # Data Cleaning Steps
  A. Remove Unneccessary Columns 
  B. Extract youtube channel names from the first column
  C. Rename Useful Columns

 */




 Select  Channel_Name,
		Category,
		Subscribers,
		Country,
		Average_Comments,
		Average_Likes,
		Average_Views
			   		 	  
from dbo.Youtuber




  SELECT
  COLUMN_NAME,
  DATA_TYPE

  FROM	
		INFORMATION_SCHEMA.COLUMNS
  WHERE 
		TABLE_NAME = 'Youtuber'



Alter Table Youtuber
Alter Column Average_Comments nVarchar (255)


-- Charindex --


 --select charindex ('M',Subscribers),Subscribers from dbo.Youtuber

 --select charindex ('M',Average_Likes),Average_Likes from dbo.Youtuber
 
 --select charindex ('M',Average_Views),Average_Views from dbo.Youtuber
 

 
 --select charindex ('K',Subscribers),Subscribers from dbo.Youtuber

 --select charindex ('K',Average_Likes),Average_Likes from dbo.Youtuber
 
 --select charindex ('K',Average_Views),Average_Views from dbo.Youtuber
 

 -- SUBSTRING--

  SELECT SUBSTRING(Subscribers, 1,CHARINDEX('M',Subscribers)) As Total_Subscribers_M,
		 SUBSTRING(Average_Likes, 1,CHARINDEX('M',Average_Likes)) As Average_Likes_M,
		 SUBSTRING(Average_Views, 1,CHARINDEX('M',Average_Views)) As Average_Views_M,



		 SUBSTRING(Subscribers, 1,CHARINDEX('K',Subscribers)) As Total_Subscribers_K,
		 SUBSTRING(Average_Likes, 1,CHARINDEX('K',Average_Likes)) As Average_Likes_K,
		 SUBSTRING(Average_Views, 1,CHARINDEX('K',Average_Views)) As Average_Views_K
  

 from dbo.Youtuber



 SELECT 
    CAST(SUBSTRING(Subscribers, 1, CHARINDEX('M', Subscribers)) AS VARCHAR(100)) AS Total_Subscribers_M, 
    CAST(SUBSTRING(Average_Likes, 1, CHARINDEX('M', Average_Likes)) AS VARCHAR(100)) AS Average_Likes_M,
    CAST(SUBSTRING(Average_Views, 1, CHARINDEX('M', Average_Views)) AS VARCHAR(100)) AS Average_Views_M,

    CAST(SUBSTRING(Subscribers, 1, CHARINDEX('K', Subscribers)) AS VARCHAR(100)) AS Total_Subscribers_K,
    CAST(SUBSTRING(Average_Likes, 1, CHARINDEX('K', Average_Likes)) AS VARCHAR(100)) AS Average_Likes_K,
    CAST(SUBSTRING(Average_Views, 1, CHARINDEX('K', Average_Views)) AS VARCHAR(100)) AS Average_Views_K

FROM dbo.Youtuber




SELECT 
    CAST(CASE 
        WHEN CHARINDEX('M', Subscribers) > 0 
        THEN SUBSTRING(Subscribers, 1, CHARINDEX('M', Subscribers) - 1) 
        ELSE Subscribers 
    END AS VARCHAR(100)) AS Total_Subscribers_M, 

    CAST(CASE 
        WHEN CHARINDEX('M', Average_Likes) > 0 
        THEN SUBSTRING(Average_Likes, 1, CHARINDEX('M', Average_Likes) - 1) 
        ELSE Average_Likes 
    END AS VARCHAR(100)) AS Average_Likes_M,

    CAST(CASE 
        WHEN CHARINDEX('M', Average_Views) > 0 
        THEN SUBSTRING(Average_Views, 1, CHARINDEX('M', Average_Views) - 1) 
        ELSE Average_Views 
    END AS VARCHAR(100)) AS Average_Views_M,

    CAST(CASE 
        WHEN CHARINDEX('K', Subscribers) > 0 
        THEN SUBSTRING(Subscribers, 1, CHARINDEX('K', Subscribers) - 1) 
        ELSE Subscribers 
    END AS VARCHAR(100)) AS Total_Subscribers_K ,

    CAST(CASE 
        WHEN CHARINDEX('K', Average_Likes) > 0 
        THEN SUBSTRING(Average_Likes, 1, CHARINDEX('K', Average_Likes) - 1) 
        ELSE Average_Likes 
    END AS VARCHAR(100)) AS Average_Likes_K,

    CAST(CASE 
        WHEN CHARINDEX('K', Average_Views) > 0 
        THEN SUBSTRING(Average_Views, 1, CHARINDEX('K', Average_Views) - 1) 
        ELSE Average_Views 
    END AS VARCHAR(100)) AS Average_Views_K

FROM dbo.Youtuber







SELECT Channel_Name,
		Country,
    -- Handling 'M' in Subscribers
    CAST(CASE 
        WHEN CHARINDEX('M', Subscribers) > 0 
        THEN SUBSTRING(Subscribers, 1, CHARINDEX('M', Subscribers) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Total_Subscribers_M, 

    ---- Handling 'K' in Subscribers
    --CAST(CASE 
    --    WHEN CHARINDEX('K', Subscribers) > 0 
    --    THEN SUBSTRING(Subscribers, 1, CHARINDEX('K', Subscribers) - 1) 
    --    ELSE NULL 
    --END AS VARCHAR(100)) AS Total_Subscribers_K, 

    ---- Handling 'M' in Average_Likes
    --CAST(CASE 
    --    WHEN CHARINDEX('M', Average_Likes) > 0 
    --    THEN SUBSTRING(Average_Likes, 1, CHARINDEX('M', Average_Likes) - 1) 
    --    ELSE NULL 
    --END AS VARCHAR(100)) AS Average_Likes_M,

    -- Handling 'K' in Average_Likes
    CAST(CASE 
        WHEN CHARINDEX('K', Average_Likes) > 0 
        THEN SUBSTRING(Average_Likes, 1, CHARINDEX('K', Average_Likes) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Average_Likes_K,

    -- Handling 'M' in Average_Views
    CAST(CASE 
        WHEN CHARINDEX('M', Average_Views) > 0 
        THEN SUBSTRING(Average_Views, 1, CHARINDEX('M', Average_Views) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Average_Views_M,

    -- Handling 'K' in Average_Views
    CAST(CASE 
        WHEN CHARINDEX('K', Average_Views) > 0 
        THEN SUBSTRING(Average_Views, 1, CHARINDEX('K', Average_Views) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Average_Views_K

FROM dbo.Youtuber







--Create View--

CREATE VIEW
  view_Top_1000_You_tubers_New AS 

SELECT Channel_Name,
		Country,
    -- Handling 'M' in Subscribers
    CAST(CASE 
        WHEN CHARINDEX('M', Subscribers) > 0 
        THEN SUBSTRING(Subscribers, 1, CHARINDEX('M', Subscribers) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Total_Subscribers_M, 

    ---- Handling 'K' in Subscribers
    --CAST(CASE 
    --    WHEN CHARINDEX('K', Subscribers) > 0 
    --    THEN SUBSTRING(Subscribers, 1, CHARINDEX('K', Subscribers) - 1) 
    --    ELSE NULL 
    --END AS VARCHAR(100)) AS Total_Subscribers_K, 

    ---- Handling 'M' in Average_Likes
    --CAST(CASE 
    --    WHEN CHARINDEX('M', Average_Likes) > 0 
    --    THEN SUBSTRING(Average_Likes, 1, CHARINDEX('M', Average_Likes) - 1) 
    --    ELSE NULL 
    --END AS VARCHAR(100)) AS Average_Likes_M,

    -- Handling 'K' in Average_Likes
    CAST(CASE 
        WHEN CHARINDEX('K', Average_Likes) > 0 
        THEN SUBSTRING(Average_Likes, 1, CHARINDEX('K', Average_Likes) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Average_Likes_K,

    -- Handling 'M' in Average_Views
    CAST(CASE 
        WHEN CHARINDEX('M', Average_Views) > 0 
        THEN SUBSTRING(Average_Views, 1, CHARINDEX('M', Average_Views) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Average_Views_M,

    -- Handling 'K' in Average_Views
    CAST(CASE 
        WHEN CHARINDEX('K', Average_Views) > 0 
        THEN SUBSTRING(Average_Views, 1, CHARINDEX('K', Average_Views) - 1) 
        ELSE NULL 
    END AS VARCHAR(100)) AS Average_Views_K

FROM dbo.Youtuber






SELECT TOP (1000) [Channel_Name]
		,[Country]
      ,[Total_Subscribers_M]
      ,[Average_Likes_K]
      ,[Average_Views_M]
      ,[Average_Views_K]
  FROM [You_Tubers_db].[dbo].[view_Top_1000_You_tubers_New]





  --# Data quality tests


  --A. Row Count Test (1000+ Rows)
  --B. Column Count Test (5 Feilds)
  --C. Data Type Test ('String' for Channel_Name ,'Int' for others)
  --D. Duplicate Count Test





 -- A. Row Count Test (1000+ Rows)


 
  select
		COUNT(*) as No_Of_Rows
  From
		dbo.view_Top_1000_You_tubers_New




  --B. Column Count Test (6 Feilds)


  SELECT
		COUNT(*) AS Column_Count 
  FROM	
		INFORMATION_SCHEMA.COLUMNS
  WHERE 
		TABLE_NAME = 'view_Top_1000_You_tubers_New'




--C. Data Type Test ('String' for Channel_Name ,'Int' for others)


  SELECT
  DATA_TYPE

  FROM	
		INFORMATION_SCHEMA.COLUMNS
  WHERE 
		TABLE_NAME = 'view_Top_1000_You_tubers_New'




 --D. Duplicate Count Test

SELECT 
    [Channel_Name],
	[Country],
    [Total_Subscribers_M],
    [Average_Likes_K],
    [Average_Views_M],
    [Average_Views_K],
    COUNT(*) AS Duplicate_Count
FROM 
    [You_Tubers_db].[dbo].[view_Top_1000_You_tubers_New]
GROUP BY 
    [Channel_Name],
	[Country],
    [Total_Subscribers_M],
    [Average_Likes_K],
    [Average_Views_M],
    [Average_Views_K]
HAVING 
    COUNT(*) > 1





	--Deleting Duplicates--


WITH CTE AS (SELECT 
        [Channel_Name],
        [Total_Subscribers_M],
        [Average_Likes_K],
        [Average_Views_M],
        [Average_Views_K],
        ROW_NUMBER() OVER (
            PARTITION BY [Channel_Name], [Total_Subscribers_M], [Average_Likes_K], [Average_Views_M], [Average_Views_K] 
            ORDER BY (SELECT NULL)
        ) AS row_num
    FROM 
        [You_Tubers_db].[dbo].[view_Top_1000_You_tubers]
)
-- Delete the duplicates
DELETE FROM CTE
WHERE row_num > 1



Select*
from dbo.view_Top_1000_You_tubers_New