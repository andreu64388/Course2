/*1. ����������� �������� ��������� ��� ���������� � ������ PSUBJECT.
��������� ��������� ��������-������ ����� �� ������ ������� SUBJECT, �����-������ ������,
��������������� �� �������: 
� ����� ������ ��������� ������ ���������� ��-�������� �����, ���������� � �������������� �����.
*/
USE UNIVER;


CREATE PROCEDURE PSUBJECT
AS
BEGIN
DECLARE @K INT = (SELECT COUNT(*) FROM SUBJECT);
SELECT SUBJECT [���], SUBJECT_NAME [����������], PULPIT [�������] FROM SUBJECT;
RETURN @K;
END;

DECLARE @Y INT = 0;
EXEC @Y = PSUBJECT;
PRINT('���������� ����� = ') + CAST(@Y AS VARCHAR(3));

DROP PROCEDURE PSUBJECT;