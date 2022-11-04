/*
5. ����������� ��������� � ������ SUB-JECT_REPORT, ����������� � ����������� ��-������ ����� ����� �� ������� ��������� �� ���-������� �������. � ����� ������ ���� �������� ������� �������� (���� SUBJECT) �� ������� SUBJECT � ���� ������ ����� ������� (������������ ���������� ������� RTRIM). ��������� ����� ������� �������� � ������ @p ���� CHAR(10), ����-��� ������������ ��� �������� ���� �������.
� ��� ������, ���� �� ��������� �������� @p ��-�������� ���������� ��� �������, ��������� ������ ������������ ������ � ���������� ������ � ����-������. 
��������� SUBJECT_REPORT ������ ������-���� � ����� ������ ���������� ���������, ������-������ � ������. 
*/
USE UNIVER;

CREATE PROCEDURE SUBJECT_REPORT @P NVARCHAR(10) AS
BEGIN
DECLARE @COUNTER INT = 0;
BEGIN TRY
DECLARE @SUB NVARCHAR(10), @LINE_SUB NVARCHAR(500) = ''
DECLARE SUBJECTS CURSOR LOCAL STATIC FOR
SELECT SUBJECT FROM SUBJECT WHERE PULPIT = @P ORDER BY PULPIT
IF NOT EXISTS (SELECT PULPIT FROM SUBJECT WHERE PULPIT = @P)
BEGIN
RAISERROR('������, ��� ����� ������', 11, 1);
END
ELSE
BEGIN
OPEN SUBJECTS
FETCH SUBJECTS INTO @SUB
SET @LINE_SUB = TRIM(@SUB)
SET @COUNTER +=1
FETCH SUBJECTS INTO @SUB
WHILE @@FETCH_STATUS = 0
BEGIN
SET @LINE_SUB = '' + TRIM(@SUB) + ', ' + @LINE_SUB
SET @COUNTER +=1
FETCH SUBJECTS INTO @SUB
END
PRINT '�������� �� ������� ' + @P + ': ' + @LINE_SUB
RETURN @COUNTER
END
END TRY
BEGIN CATCH
PRINT '������ � ����������'
IF ERROR_PROCEDURE() IS NOT NULL
PRINT '��� ��������� : ' + ERROR_PROCEDURE()
RETURN @COUNTER
END CATCH
END
GO

DECLARE @C INT
EXEC @C = SUBJECT_REPORT @P = '����'
PRINT '���������� ��������� �� �������������: ' + CAST(@C AS NVARCHAR)

DROP PROCEDURE SUBJECT_REPORT;