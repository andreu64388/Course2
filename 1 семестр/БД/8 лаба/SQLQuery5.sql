/*
5. ������������������ ����������� IF� ELSE �� ������� ������� ������ ������ ���� ������ �_UNIVER.*/


use UNIVER;

IF (SELECT MAX(AUDITORIUM_CAPACITY) FROM AUDITORIUM )= 90 
BEGIN
PRINT '90 MAX SIZE'
END
ELSE PRINT '> THAN 90'