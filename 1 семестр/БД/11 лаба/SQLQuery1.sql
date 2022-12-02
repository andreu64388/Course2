/* 1. ����������� ��������, ��-������������� ������ � ��-���� ������� ����������.
���������������� ������, ����������� ������, � ������� ��������� ������� �, � ������� �������� 
��� ������ �������.
*/
SET NOCOUNT ON;
IF EXISTS (SELECT * FROM SYS.OBJECTS
WHERE OBJECT_ID = OBJECT_ID(N'DBO.X')) -- ������� ����?
DROP TABLE X;

DECLARE @C INT, @FLAG CHAR = 'C'
SET IMPLICIT_TRANSACTIONS ON;-- �����. ����� ������� ����������
CREATE TABLE X (VAL INT);-- ������ ����������
INSERT X VALUES (1), (2), (3);
SET @C = (SELECT COUNT(*) FROM X);
PRINT '���-�� ����� � ������� X: ' + CONVERT(VARCHAR, @C);
IF @FLAG = 'C'-- ���������� ����������: ��������
COMMIT;
ELSE
ROLLBACK;-- ���������� ����������: �����
SET IMPLICIT_TRANSACTIONS OFF;-- ������. ����� ������� ����������

IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE OBJECT_ID = OBJECT_ID(N'DBO.X'))
PRINT '������� X ����';
ELSE
PRINT '������� X ���';


-------------------------------------------------------------
--------------------------BANK-------------------------------
-------------------------------------------------------------
DROP TABLE TEST_X;
USE BANK;
DECLARE @LENGHT INT, @FLAG_MY CHAR = 'R'
SET IMPLICIT_TRANSACTIONS ON;-- �����. ����� ������� ����������
CREATE TABLE TEST_X (VAL INT);-- ������ ����������
INSERT INTO TEST_X VALUES (1), (2), (3);
SET @LENGHT = (SELECT COUNT(*) FROM TEST_X);
PRINT '���-�� ����� � ������� TEST: ' + CONVERT(VARCHAR, @LENGHT);
IF @FLAG_MY = 'R'
COMMIT;
ELSE
ROLLBACK;-- ���������� ����������: �����
SET IMPLICIT_TRANSACTIONS OFF;-- ������. ����� ������� ����������
