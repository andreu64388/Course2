/*3. ����������� ��������, ���������-������ ������� ����������� �������� �� ������������
�� ������� ���� ���-��� X_UNIVER.*/
USE UNIVER
DECLARE @PUL CHAR(10), @GEN CHAR(2), @NAME CHAR(30);
DECLARE TEACHERS CURSOR LOCAL STATIC FOR SELECT PULPIT, GENDER, TEACHER_NAME FROM TEACHER WHERE PULPIT='����';
OPEN TEACHERS;
PRINT '���������� �����: '+CAST(@@CURSOR_ROWS AS VARCHAR(5));

INSERT INTO TEACHER  (TEACHER,   TEACHER_NAME, GENDER, PULPIT )
VALUES ('���','�������� �������� �������������', '�', '����');
UPDATE TEACHER SET TEACHER_NAME = '�������� ������ ����������' WHERE TEACHER = '���';
FETCH TEACHERS INTO @PUL, @GEN, @NAME;
PRINT '�������������: '+RTRIM(@PUL)+' '+RTRIM(@GEN)+' '+RTRIM(@NAME);
WHILE @@FETCH_STATUS=0
BEGIN
FETCH TEACHERS INTO @PUL, @GEN, @NAME;
PRINT '�������������: '+RTRIM(@PUL)+' '+RTRIM(@GEN)+' '+RTRIM(@NAME);
END;
CLOSE TEACHERS;
DELETE TEACHER WHERE TEACHER = '���';