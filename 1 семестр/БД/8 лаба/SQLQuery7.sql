/*7. ������� ��������� ��������� ������� �� ���� �������� � 10 �����, ��������� �� � ������� ����������. 
������������ �������� WHILE.*/
create table #MyTable(����� int, ����� nvarchar(50), [��� �����] nvarchar(50));
set nocount on;
declare @i int = 1;
while @i <11
begin
insert into #MyTable values
(cast(@i as int), cast(@i as nvarchar(10)) + ' - ���� ','�� ' + cast(@i as nvarchar(10)))
set @i +=1;
end
select * from #MyTable
order by ����� desc
go

drop table #MyTable;