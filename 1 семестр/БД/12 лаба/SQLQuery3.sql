/*3. ������� ��������� ��������� ������� � ������ #SUBJECT. ������������ � ��� �������� ������� ������ ��������������� �������� ��������������� ������ ��������� PSUBJECT, ������������� � ����-��� 2. 
�������� ��������� PSUBJECT ����� �������, ����� ��� �� ��������� ��������� ���������.
�������� ����������� INSERT� EXECUTE � ��-�������������� ���������� PSUBJECT, �������� ������ � ������� #SUBJECT. 
*/
USE UNIVER;
CREATE TABLE #SUBJECT
(
SUBJ NVARCHAR(20),
SUBJ_NAME NVARCHAR(300),
PULP NVARCHAR(20)
)

GO
ALTER PROCEDURE PSUBJECT @P VARCHAR(20) = NULL AS
BEGIN
SELECT SUBJECT [���], SUBJECT_NAME [����������], PULPIT [�������] FROM SUBJECT WHERE PULPIT = @P;
END
GO

GO
INSERT #SUBJECT EXEC PSUBJECT @P = '����'
INSERT #SUBJECT EXEC PSUBJECT @P = '��'
SELECT * FROM #SUBJECT

drop table #SUBJECT