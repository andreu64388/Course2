/*1. ����������� �������� �������� XML-��������� � ������ PATH �� ������� TEACHER
��� �������������� ������� ����. */

USE UNIVER;


SELECT * FROM TEACHER 
JOIN PULPIT ON TEACHER.PULPIT = PULPIT.PULPIT
 WHERE TEACHER.PULPIT = '����' FOR XML PATH, ROOT('������_��������������_�������_����');