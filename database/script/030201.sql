UPDATE [Application]
SET CreateTime=UpdateTime;

SELECT a.ApplicationID,row_number() over(order BY CreateTime) Seq INTO ##temp
  FROM [Application] a;
  
  UPDATE [Application]
  SET seq = (SELECT seq
  FROM ##temp a WHERE a.ApplicationID=[Application].ApplicationID);
  
  SELECT
  	a.ApplicationID,a.Seq
  FROM
  	[Application] a;