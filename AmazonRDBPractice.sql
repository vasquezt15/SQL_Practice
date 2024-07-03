SELECT 
  COUNT(ServiceType)  
  AS TotalServices
FROM servicerecordsunit5
WHERE ServiceDate BETWEEN '2023-01-01' AND '2023-12-31';

SELECT 
  EXTRACT(MONTH FROM ServiceDate) AS Month, 
  COUNT(ServiceType) AS TotalServices
FROM servicerecordsunit5
WHERE ServiceDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY Month
ORDER BY Month;


SELECT 
  EmployeeName, 
  EmployeeID, 
  COUNT(ServiceType) AS TotalServices
FROM servicerecordsunit5
WHERE ServiceDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY EmployeeName, EmployeeID
ORDER BY TotalServices;


SELECT 
  EmployeeName, 
  EmployeeID,
  COUNT(ServiceType) AS TotalServices,
  ROUND(AVG(ServiceRating),2 )AS AvgRating
FROM servicerecordsunit5
WHERE 
  ServiceDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY EmployeeName, EmployeeID
HAVING AVG(ServiceRating) >= 7
ORDER BY AvgRating;


SELECT * 
FROM servicerecordsunit5
WHERE ServiceRating = (SELECT MAX(ServiceRating) 
                                    FROM servicerecordsunit5
                                );

SELECT * 
FROM servicerecordsunit5
WHERE ServiceRating = (SELECT MIN(ServiceRating) 
                                    FROM servicerecordsunit5
                                );
