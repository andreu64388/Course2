/*2. ����������� �������� �������� XML-��������� � ������ AUTO �� ������ SELECT-������� � 
�������� AUDITORIUM � AUDI-TORIUM_TYPE, ������� �������� ������-��� �������: ������������ 
���������, �����-������� ���� ��������� � �����������. ����� ������ ���������� ���������*/
USE UNIVER;

SELECT AUDITORIUM.AUDITORIUM [���������], AUDITORIUM.AUDITORIUM_TYPE [�������������_����], AUDITORIUM.AUDITORIUM_CAPACITY [�����������]
FROM AUDITORIUM JOIN AUDITORIUM_TYPE ON AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
WHERE AUDITORIUM.AUDITORIUM_TYPE = '��' FOR XML AUTO , ROOT('������_���������');