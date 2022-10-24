/*5. ��������� ��������� ������-��� �������. 
������� ������������������ ��-����. ������� ������� ���������-��� �������. 
����������� �������� �� T-SQL, ���������� �������� �������� � ������ ������������ ������� ���� 90%. ������� ������� ���������-��� �������. 
��������� ��������� ��������-����� �������, ������� ������� ������������. 
��������� ��������� ����-������� ������� � ������� ������� ������������ �������.
*/
use UNIVER;
create table #task5 (tkey int, cc int identity(1,1), tf varchar(100))
set nocount on
declare @k int = 0
while @k < 10000
begin
insert #task5(tkey, tf) values (floor(30000*rand()), replicate('������� ', 10))
set @k = @k + 1
end

checkpoint;
dbcc dropcleanbuffers

create index #task5_tkey on #task5(tkey)

-- ��������� tempdb !!!

select name [������], avg_fragmentation_in_percent [������������ (%)] -- ������� ������������ �������
FROM sys.dm_db_index_physical_stats(DB_ID(N'TEMPDB'),
OBJECT_ID(N'#task5'), NULL, NULL, NULL) ss
JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id where name is not null; -- 0 -- 88

insert top(10000000) #task5(tkey, tf) select tkey, tf from #task5

drop index #task5_tkey on #task5

drop table #task5

alter index #task5_tkey on #task5 reorganize --������������� - ������ �� ����� ������ ������

alter index #task5_tkey on #task5 rebuild with (online = off) -- ����� ��� ������