/*6. ����������� ��������, � ������� � ������� CASE ������������� ������, ����������
���������� ���������� ��-�������� ��� ����� ���������.*/

use UNIVER;

select (case
when NOTE between 0 and 3 then '�� ����'
when NOTE between 4 and 5 then '�����'
when NOTE between 6 and 7 then '���������'
when NOTE between 8 and 10 then '������'
end) ������, count(*) [����������] from PROGRESS
group by (case
when NOTE between 0 and 3 then '�� ����'
when NOTE between 4 and 5 then '�����'
when NOTE between 6 and 7 then '���������'
when NOTE between 8 and 10 then '������'
end)
