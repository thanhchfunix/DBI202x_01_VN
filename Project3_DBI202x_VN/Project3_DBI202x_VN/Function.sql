USE Project3_DBI202x_VN
GO

--Create function show total subcribe of 1 channel
CREATE FUNCTION sf_SubcribeChannel (@ChannelId int)
RETURNS @table_subcribe TABLE (Channel int, Name nvarchar(50), Total_Subcribe bigint)
AS
BEGIN
	DECLARE @name nvarchar(50) = ''
	DECLARE @channel int = @ChannelId
	DECLARE @total bigint = 0
	SET @name = (SELECT Name FROM Channel WHERE ChannelId = @ChannelId)
	SET @total = (SELECT count(*) FROM Subcribed WHERE ChannelId = @ChannelId)
	INSERT INTO @table_subcribe VALUES (@channel, @name, @total)
	RETURN
END

--TestCase: thanhch & sontungmtp subribe channelId 3. Total subcribe of channelId 3 (binzdapoet) is 2.
insert into Subcribed values (3, 'sontungmtp', 1)
SELECT * FROM sf_SubcribeChannel(3)
