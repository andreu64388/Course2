/*2. ����� ��������� PSUBJECT � ������� ���-��������� �������� (Object Explorer) 
SSMS � ����� ����������� ���� ������� �������� �� ��������� ���-������ ���������� ALTER.
�������� ��������� PSUBJECT, ��������� � ��-����� 1, ����� �������, ����� ��� ��������� 
��� ��-������� � ������� @p � @c. �������� @p �������� �������, ����� ��� VARCHAR(20) �
�������� �� ��������� NULL. �������� @� �������� ��������, ����� ��� INT.
��������� PSUBJECT ������ ����������� ��-������������ �����, ����������� ������,
��������-������� �� ������� ����, �� ��� ���� ��������� ������, ��������������� ���� �������
, ��������� ���������� @p. ����� ����, ��������� ������ ���-�������� �������� ��������� ��������� @�, 
������ ���������� ����� � �������������� ������, � ����� ���������� �������� � ����� ������,
������ ������ ���������� ��������� (���������� ����� � ������� SUBJECT). 
*/

USE UNIVER;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE PSUBJECT @P VARCHAR(20) = NULL, @C INT OUTPUT
AS
BEGIN
DECLARE @K INT = (SELECT COUNT(*) FROM SUBJECT WHERE PULPIT = @P);
PRINT '���������: @P = ' + @P + ', @C = ' + CAST(@C AS VARCHAR(3));
SELECT SUBJECT [���], SUBJECT_NAME [����������], PULPIT [�������] FROM SUBJECT WHERE PULPIT = @P;
SET @C = @@ROWCOUNT;
RETURN @K;
END;

DECLARE @Y INT = 0, @Z VARCHAR(20) = '����', @W INT = 0
EXEC @Y = PSUBJECT @P = @Z, @C = @W OUTPUT
PRINT '����� �����: ' + CAST(@Y AS NVARCHAR)
PRINT '����� � ����������� ' + @Z + ': '+ CAST(@W AS NVARCHAR)