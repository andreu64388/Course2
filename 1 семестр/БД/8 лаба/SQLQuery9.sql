/*
9. ����������� �������� � ��������, � ������� ������������ ��� ��������� ������ ����� TRY � CATCH. 
�����-���� ������� ERROR_NUMBER (��� ��������� ������), ERROR_ES-SAGE (��������� �� ������), ERROR_LINE 
(��� ��������� ������), ER-ROR_PROCEDURE (��� ��������� ��� NULL), ERROR_SEVERITY
(������� ����������� ������), ERROR_ STATE (����� ������). ���������������� ��-�������.*/
begin try
update PROGRESS set NOTE = '������ ������ int!!!' where NOTE = 9
end try
begin catch
print ERROR_NUMBER() -- ��� ��������� ������
print ERROR_MESSAGE() -- ��������� �� ������
print ERROR_LINE() -- ��� ��������� ������
print ERROR_PROCEDURE() -- ��� ��������� ��� NULL
print ERROR_SEVERITY() -- ������� ����������� ������
print ERROR_STATE() --
end catch