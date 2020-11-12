--Store procedure return number video rank by view order by descrement.
USE Project3_DBI202x_VN
GO

--Procedure have 1 parameter is channelId. When user access to 1 channel, show list 10 newest videos.
--Show list 10 video order by time descendant of channel
GO
CREATE PROC sp_ShowVideoChannel(@channelId int)
AS
BEGIN
	SELECT TOP (3) VideoId, Title, Views FROM Videos v
	INNER JOIN Channel c
	ON v.ChannelId = c.ChannelId
	WHERE v.ChannelId = @channelId
	ORDER BY Time DESC
END

--Test case: show 3 newest video of sontungmtp.
EXEC sp_ShowVideoChannel 2

GO
--Procedure show list video trend (video have view highest) group by category.
CREATE PROC sp_Trend (@num int, @cate int)
AS
BEGIN
	SELECT TOP (@num) VideoId, Title, Views FROM Videos
	WHERE CategoryId = @cate
	ORDER BY Trend ASC
END

--Test case: show top @num = 5 video order by view of category (id = 1: music)
EXEC sp_Trend 5, 1