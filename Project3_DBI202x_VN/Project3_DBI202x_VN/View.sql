--Create view Video_view with field: videoId, title, description
--Field in table video not change frequently. Create view help user hide and reuse complex queries.
--Security: Only give user the data they need.
--Creat Video_view
CREATE VIEW Video_view
AS
SELECT VideoId, Title, Description FROM Videos