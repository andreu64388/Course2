/*4. ����������� ��������� � ������ PAUDITORI-UM_INSERT. ��������� ��������� ������ ������� ���������: @a, @n, @c � @t. �������� @a ����� ��� CHAR(20), �������� @n ����� ��� VARCHAR(50), �������� @c ����� ��� INT � �������� �� ��������� 0, �������� @t ����� ��� CHAR(10).
��������� ��������� ������ � ������� AUDITO-RIUM. �������� �������� AUDITORIUM, AUDI-TORIUM_NAME, AUDITORIUM_CAPACITY � AUDITORIUM_TYPE ����������� ������ �������� �������������� ����������� @a, @n, @c � @t.
��������� PAUDITORIUM_INSERT ������ ���-������ �������� TRY/CATCH ��� ��������� ������. � ������ ������������� ������, ��������� ������ ����������� ���������, ���������� ��� ������, ������� ����������� � ����� ��������� � ����������� �������� �����. 
��������� ������ ���������� � ����� ������ ���-����� -1 � ��� ������, ���� ��������� ������ � 1, ��-�� ���������� �������. 
���������� ������ ��������� � ���������� �����-����� �������� ������, ������� ����������� � ���-����.
*/
USE UNIVER;

CREATE PROCEDURE PAUDITORIUM_INSERT
@A CHAR(20),
@N VARCHAR(50),
@C INT=0,
@T CHAR(10)
AS
BEGIN TRY
INSERT INTO AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
VALUES (@A, @N, @C, @T)
RETURN 1;
END TRY
BEGIN CATCH
PRINT '����� ������: ' + CAST(ERROR_NUMBER() AS VARCHAR(6));
PRINT '���������: ' + ERROR_MESSAGE();
PRINT '�������: ' + CAST(ERROR_SEVERITY() AS VARCHAR(6));
PRINT '�����: ' + CAST(ERROR_STATE() AS VARCHAR(8));
PRINT '����� ������: ' + CAST(ERROR_LINE() AS VARCHAR(8));
IF ERROR_PROCEDURE() IS NOT NULL
PRINT '��� ���������: ' + ERROR_PROCEDURE();
RETURN -1;
END CATCH;

DROP PROCEDURE PAUDITORIUM_INSERT;

DECLARE @RC INT;
EXEC @RC=PAUDITORIUM_INSERT @A='500-1', @N='��', @C=60, @T='500-1';
PRINT '��� ������: '+CAST(@RC AS VARCHAR(3));

DELETE AUDITORIUM WHERE AUDITORIUM='500-1';

SELECT * FROM AUDITORIUM;