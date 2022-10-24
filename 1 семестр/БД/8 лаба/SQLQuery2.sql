/*2. ����������� ������, � ������� ������������ ����� ����������� ����-�����. 
����� ����� ����������� ���-������ 200, �� ������� ���������� ���������, ������� ����������� ����-�����,
���������� ���������, ������-����� ������� ������ �������, � ���-���� ����� ���������. ����� ����� �����������
��������� ������ 200, �� ������� ��������� � ������� ����� �����������.*/
use UNIVER;

declare @capacity int = (select cast(sum(AUDITORIUM_CAPACITY) as int) from AUDITORIUM),
@total int,
@avgCapacity int,
@totalLessThanAvg int,
@procent numeric(4,2);

if @capacity > 200
begin
set @total = (select count(*) from AUDITORIUM);
set @avgCapacity = (select avg(AUDITORIUM_CAPACITY) from AUDITORIUM);
set @totalLessThanAvg = (select count(*) from AUDITORIUM where AUDITORIUM_CAPACITY < @avgCapacity);
set @procent = @totalLessThanAvg * 100 / @total;
select @capacity '����� �����������',
@total '����� ���������',
@avgCapacity '������� �����������',
@totalLessThanAvg '��������� � ������������ ���� ��������',
@procent '������� ����� ���������'
end

else print '����� ����������� < 200'