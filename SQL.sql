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

-- Создание таблицы "Операции"
CREATE TABLE Operations (
    ID INT PRIMARY KEY,
    ContainerID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    OperationType VARCHAR(255),
    OperatorName VARCHAR(255),
    InspectionPlace VARCHAR(255)
);

-- Запрос на выбор всех данных из таблицы "Контейнеры" в формате JSON
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

-- Запрос на выбор всех данных из таблицы "Операции" для определенного контейнера в формате JSON
DECLARE @ContainerID INT;
SET @ContainerID = 1; -- Укажите здесь ID контейнера, для которого нужно выбрать операции

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