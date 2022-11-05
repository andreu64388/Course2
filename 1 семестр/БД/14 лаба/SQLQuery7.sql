/*7. ����������� ��������, ��������������� �� ������� ���� ������ X_UNIVER �����-������:
AFTER-������� �������� ������ ����-������,
� ������ �������� ����������� �����-���, ���������������� �������.*/

USE UNIVER

GO
	CREATE TRIGGER PTRAN
	ON PULPIT AFTER INSERT, DELETE, UPDATE
	AS DECLARE @C INT = (SELECT COUNT (*) FROM PULPIT);
	 IF (@C >18)
	 BEGIN
       RAISERROR('����� ���������� ������ �� ����� ���� >26', 10, 1);
	 ROLLBACK;
	 END;
	 RETURN;

INSERT INTO PULPIT(PULPIT) VALUES ('����');