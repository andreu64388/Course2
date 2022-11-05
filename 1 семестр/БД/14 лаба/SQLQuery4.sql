/*4. ������� AFTER-������� � ������ TR_TEACHER ��� ������� TEACHER, ���-�������� �� ������� INSERT, DELETE, UPDATE. 
������� ������ ���������� ������ ������ � ������� TR_AUDIT ��� ������ ���������� ������. � ���� �������� ���������� �������, ���������������� ������� � ��������� � ����-��� �� ��������������� ������� �������-���. 
����������� ��������, ��������������� ����������������� ��������. 
*/
USE UNIVER
GO

CREATE  TRIGGER TR_TEACHER   ON TEACHER AFTER INSERT, DELETE, UPDATE
 AS DECLARE @A1 CHAR(10), @A2 VARCHAR(100), @A3 CHAR(1), @A4 CHAR(20), @IN VARCHAR(300);
	  DECLARE @INS INT = (SELECT COUNT(*) FROM INSERTED),
              @DEL INT = (SELECT COUNT(*) FROM DELETED);
   IF  @INS > 0 AND  @DEL = 0
   BEGIN
   PRINT '�������: INSERT';
      SET @A1 = (SELECT TEACHER FROM INSERTED);
      SET @A2= (SELECT TEACHER_NAME FROM INSERTED);
      SET @A3= (SELECT GENDER FROM INSERTED);
	  SET @A4 = (SELECT PULPIT FROM INSERTED);
      SET @IN = @A1+' '+ @A2 +' '+ @A3+ ' ' +@A4;
      INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
                            VALUES('INS', 'TR_TEACHER_INS', @IN);
	 END;
	ELSE
    IF @INS = 0 AND  @DEL > 0
	BEGIN
	PRINT '�������: DELETE';
      SET @A1 = (SELECT TEACHER FROM DELETED);
      SET @A2= (SELECT TEACHER_NAME FROM DELETED);
      SET @A3= (SELECT GENDER FROM DELETED);
	  SET @A4 = (SELECT PULPIT FROM DELETED);
      SET @IN = @A1+' '+ @A2 +' '+ @A3+ ' ' +@A4;
      INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
                            VALUES('DEL', 'TR_TEACHER_DEL', @IN);
	  END;
	ELSE
	BEGIN
	PRINT '�������: UPDATE';
      SET @A1 = (SELECT TEACHER FROM INSERTED);
      SET @A2= (SELECT TEACHER_NAME FROM INSERTED);
      SET @A3= (SELECT GENDER FROM INSERTED);
	  SET @A4 = (SELECT PULPIT FROM INSERTED);
      SET @IN = @A1+' '+ @A2 +' '+ @A3+ ' ' +@A4;
      SET @A1 = (SELECT TEACHER FROM DELETED);
      SET @A2= (SELECT TEACHER_NAME FROM DELETED);
      SET @A3= (SELECT GENDER FROM DELETED);
	  SET @A4 = (SELECT PULPIT FROM DELETED);
      SET @IN =@IN + '' + @A1+' '+ @A2 +' '+ @A3+ ' ' +@A4;
      INSERT INTO TR_AUDIT(STMT, TRNAME, CC)
                            VALUES('UPD', 'TR_TEACHER_UPD', @IN);
	  END;
	  RETURN;

	  DELETE TEACHER WHERE TEACHER='����'
	  INSERT INTO  TEACHER VALUES('����', '��������', '�', '����');
	  	  UPDATE TEACHER SET GENDER = '�' where TEACHER='����'
	  SELECT * FROM TR_AUDIT