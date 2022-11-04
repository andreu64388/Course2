/*2. ����������� ��������� ������� � ������ FSUB-JECTS, ����������� �������� @p ���� VARCHAR(20), �������� �������� ������ ��� ������� (������� SUB-JECT.PULPIT). 
������� ������ ���������� ������ ���� VARCHAR(300) � �������� ��������� � ������. 


������� � ��������� ��������, ������� ������� �����, ����������� ��������������� ����. 
����������: ������������ ��������� ����������� ������ �� ������ SELECT-������� � ������� SUBJECT.
*/


USE UNIVER;
CREATE FUNCTION FSUBJECTS (@P NVARCHAR(20)) RETURNS NVARCHAR(300) AS
BEGIN
DECLARE @LIST VARCHAR(300) = '����������: ', @SUB VARCHAR(20);
DECLARE SUBJECT_CURSOR CURSOR LOCAL FOR
SELECT SUBJECT.SUBJECT '����������'
FROM SUBJECT
WHERE SUBJECT.PULPIT = @P
OPEN SUBJECT_CURSOR
FETCH NEXT FROM SUBJECT_CURSOR INTO @SUB
WHILE @@FETCH_STATUS = 0
BEGIN
SET @LIST=@LIST+RTRIM(@SUB)+', ';
FETCH SUBJECT_CURSOR INTO @SUB
END;
RETURN @LIST;
END;
-- DROP FUNCTION FSUBJECTS;

PRINT DBO.FSUBJECTS('����');
-- ��������� � �������:
SELECT PULPIT '�������', DBO.FSUBJECTS(PULPIT) '����������' FROM PULPIT;