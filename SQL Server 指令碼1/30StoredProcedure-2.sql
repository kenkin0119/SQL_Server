create proc queryTable
	@tableName nvarchar(100)
as
begin
	exec('select * from '+@tableName)
end
--------------------------------------

exec queryTable '±Ð±Â'

