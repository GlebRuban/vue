CREATE TABLE Containers (
    ID INT PRIMARY KEY,
    Number INT,
    Type VARCHAR(255),
    Length INT,
    Width INT,
    Height INT,
    Weight INT,
    IsEmpty BIT,
    ArrivalDate DATETIME
);
CREATE TABLE Operations (
    ID INT PRIMARY KEY,
    ContainerID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    OperationType VARCHAR(255),
    OperatorName VARCHAR(255),
    InspectionPlace VARCHAR(255)
);
SELECT CONCAT(
    '{"ID":', CONVERT(VARCHAR, ID), ',',
    '"Number":', CONVERT(VARCHAR, Number), ',',
    '"Type":"', Type, '",',
    '"Length":', CONVERT(VARCHAR, Length), ',',
    '"Width":', CONVERT(VARCHAR, Width), ',',
    '"Height":', CONVERT(VARCHAR, Height), ',',
    '"Weight":', CONVERT(VARCHAR, Weight), ',',
    '"IsEmpty":', CONVERT(VARCHAR, IsEmpty), ',',
    '"ArrivalDate":"', CONVERT(VARCHAR, ArrivalDate, 120), '"}'
) AS JSONData
FROM Containers;
DECLARE @ContainerID INT;
SET @ContainerID = 1;
SELECT CONCAT(
    '{"ID":', CONVERT(VARCHAR, ID), ',',
    '"ContainerID":', CONVERT(VARCHAR, ContainerID), ',',
    '"StartDate":"', CONVERT(VARCHAR, StartDate, 120), '",',
    '"EndDate":"', CONVERT(VARCHAR, EndDate, 120), '",',
    '"OperationType":"', OperationType, '",',
    '"OperatorName":"', OperatorName, '",',
    '"InspectionPlace":"', InspectionPlace, '"}'
) AS JSONData
FROM Operations
WHERE ContainerID = @ContainerID;