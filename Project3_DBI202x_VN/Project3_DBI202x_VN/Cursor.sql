--Add column trend to table Videos
ALTER TABLE Videos
ADD Trend int null

--Declare variable @id, @views, @title
DECLARE @id int
DECLARE @views bigint
DECLARE @title nvarchar(100)

--Declare cursor
DECLARE cursorTrend CURSOR FOR
SELECT VideoId, Title, Views FROM Videos

--Open cursor
OPEN cursorTrend

--Perform the first fetch
FETCH NEXT FROM cursorTrend
	INTO @id, @title, @views

--Check @@FETCH_STATUS to see if there are any more rows to fetch
WHILE @@FETCH_STATUS = 0
BEGIN
	IF (@views > 100000000)
		BEGIN
			UPDATE Videos SET Trend = 1 WHERE VideoId = @id
		END
	ELSE IF (@views > 10000000)
		BEGIN
			UPDATE Videos SET Trend = 2 WHERE VideoId = @id
		END
	ELSE IF (@views > 1000000)
		BEGIN
			UPDATE Videos SET Trend = 3 WHERE VideoId = @id
		END
	ELSE
		BEGIN
			UPDATE Videos SET Trend = 4 WHERE VideoId = @id
		END

--This is executed as long as the previous fetch succeeds
	FETCH NEXT FROM cursorTrend
	INTO @id, @title, @views
END

--Close cursor
CLOSE cursorTrend
DEALLOCATE cursorTrend
GO