/*1. ����������� ��������, �������-���� ������ ��������� �� ������� ����.
� ����� ������ ���� �������� ������� �������� (���� SUBJECT) �� ������� SUBJECT � ���� ������ ����� �������. 
������������ ���������� ������� RTRIM.*/

USE UNIVER

DECLARE LINES CURSOR FOR SELECT SUBJECT FROM SUBJECT
DECLARE @ONE NVARCHAR(10), @ALL NVARCHAR(200) = ' ';

OPEN LINES
FETCH LINES INTO @ONE
PRINT '����� ����� ��������� � ������'
WHILE @@FETCH_STATUS = 0
BEGIN
SET @ALL = RTRIM(@ONE) + ', ' + @ALL -- �������� �������� � ����� ������
FETCH LINES INTO @ONE
END
PRINT RTRIM(@ALL) + ' ����� ������������.'
CLOSE LINES

DEALLOCATE LINES