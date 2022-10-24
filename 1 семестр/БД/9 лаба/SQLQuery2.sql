/*2. ������� ��������� ��������� �������. ��������� �� ������� (10000 ����� ��� ������). 
����������� SELECT-������. ��-������ ���� ������� � ���������� ��� ���������. 
������� ������������������ ��-���������� ��������� ������. 
������� ��������� ������ ��-��������.
*/
USE UNIVER;
create table #test2
(
Info nvarchar (20),
Iterator int identity(1,1),
Time datetime
)

declare @x int =1;
while @x <= 11000
begin
insert into #test2 values
('������' + cast(@x as nvarchar), SYSDATETIME())
set @x +=1;
end

select * from #test2 where Info = '������21' and Time <= SYSDATETIME() -- 0.0627894

checkpoint;
dbcc dropcleanbuffers

create index #test2_nonCl on #test2(Info, Time)

select * from #test2 where Info = '������21' and Time <= SYSDATETIME() -- 0.0065704

drop index #test2_nonCl on #test2