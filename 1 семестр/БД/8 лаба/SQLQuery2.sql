/*2. ����������� ������, � ������� ������������ ����� ����������� ����-�����. 
����� ����� ����������� ���-������ 200, �� ������� ���������� ���������, ������� ����������� ����-�����,
���������� ���������, ������-����� ������� ������ �������, � ���-���� ����� ���������. ����� ����� �����������
��������� ������ 200, �� ������� ��������� � ������� ����� �����������.*/
USE UNIVER;

DECLARE 
@CAPACITY INT = (SELECT SUM(AUDITORIUM_CAPACITY) FROM AUDITORIUM),
@TOTAL INT,
@AVGCAPACITY INT,
@TOTALLESSTHANAVG INT,
@PROCENT NUMERIC(4,2);

IF @CAPACITY > 200
BEGIN
SET @TOTAL = (SELECT COUNT(*) FROM AUDITORIUM);
SET @AVGCAPACITY = (SELECT AVG(AUDITORIUM_CAPACITY) FROM AUDITORIUM);
SET @TOTALLESSTHANAVG = (SELECT COUNT(*) FROM AUDITORIUM
WHERE AUDITORIUM_CAPACITY < @AVGCAPACITY);

SET @PROCENT = @TOTALLESSTHANAVG * 100 / @TOTAL;
SELECT @CAPACITY '����� �����������',
@TOTAL '����� ���������',
@AVGCAPACITY '������� �����������',
@TOTALLESSTHANAVG '��������� � ������������ ���� ��������',
@PROCENT '������� ����� ���������'
END

ELSE PRINT '����� ����������� < 200'