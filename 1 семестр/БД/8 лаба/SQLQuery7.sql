/*7. ������� ��������� ��������� ������� �� ���� �������� � 10 �����, ��������� �� � ������� ����������. 
������������ �������� WHILE.*/
CREATE TABLE #MYTABLE(
����� INT,
����� NVARCHAR(50),
[��� �����] NVARCHAR(50)
);

DECLARE @I INT = 1;
WHILE @I <11
BEGIN
INSERT INTO #MYTABLE VALUES
(CAST(@I AS INT), CAST(@I AS NVARCHAR(10)) + ' - ���� ','�� ' + CAST(@I AS NVARCHAR(10)))
SET @I +=1;
END
SELECT * FROM #MYTABLE
ORDER BY ����� DESC

DROP TABLE #MYTABLE;