use Project3_DBI202x_VN
go

--update view of video when add comment. When 1 comment create, increment one view in table Videos.
--Create trigger
CREATE TRIGGER trg_insertComment
	ON Comments
	AFTER INSERT
AS
BEGIN
	UPDATE Videos
	SET Views = Views + 1
	FROM Videos
	JOIN inserted ON Videos.VideoId = inserted.VideoId
END

--TestCase: Add one comment into video have id = 4.
--Before add comment view: 447
--After add comment:448
INSERT INTO dbo.Comments (CommentTime, Content, Username, VideoId) 
VALUES ('2020-08-03 7:59:00', N'Good', 'thanhch', 4)
SELECT views FROM videos WHERE videoId = 4