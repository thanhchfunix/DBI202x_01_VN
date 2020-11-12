-- Use database
use Project2_DBI202x_VN
go

-- Insert new user into Users table
insert into Users values ('thanhch', 'thanhchfx01399@funix.edu.vn','abc123')
insert into Users values ('zendvn', 'training@zend.vn', 'zend123')
insert into Users values ('sontungmtp', 'sontungmtp@gmail.com', 'tungmtp95')
insert into Users values ('binzdapoet', 'binzdapoet@gmail.com','binzrapper')
insert into Users values ('hariwon', 'hariwon@gmail.com', 'hariwon129')
insert into Users values ('thuynguyen', 'thuynguyen@gmail.com', 'thuy999')
insert into Users values ('laptrinhtv', 'laptrinhtv@gmail.com', 'laptrinhtv')
go

-- Insert new category into Categories table
insert into Categories values('Music')
insert into Categories values('Blog')
insert into Categories values('Education')
insert into Categories values('Entertainment')
insert into Categories values('Game')
insert into Categories values('Verhicle')
insert into Categories values('Pet and animal')
insert into Categories values('Sport')
insert into Categories values('Science and technology')
go

-- Insert new channel into Channel table
select * from channel
delete from channel
where channelId > 0
DBCC CHECKIDENT ('[Channel]', RESEED, 0);
select * from Channel
insert into Channel values('Funny games', N'Kênh chia s? s? thích game', 'thanhch')
insert into Channel values(N'S?n Tùng M-TP Official', N'Son Tung M-TP Official YouTube
Channel - Property of S?n Tùng M-TP', 'sontungmtp')
insert into Channel values('Binz Da Poet', N'Binz (24/05/1988) - ca s?/nh?c s?/rapper/
producer. Anh h?c t?p t?i tr??ng ??i h?c The Art Institute
? M? và khi tr? v? Vi?t Nam, anh gia nh?p SpaceSpeakers', 'binzdapoet')
insert into Channel values(N'ZendVN - H?c L?p Trình Online', N'Kênh youtube c?a ZendVN chia s? mi?n phí các video t? h?c tr?c tuy?n v? l?p trình web, l?p trình di ??ng, thi? k? web, k? n?ng m?m, k? n?ng xin vi?c, t? v?n ngh? nghi?p', 'zendvn')
insert into Channel values('Hari Won', 'Name : Hari Won Singer, Actor, Host, Model.', 'hariwon')
insert into Channel values(N'L?p trình viên TV', N'Chào m?ng b?n ??n L?p trình Viên TV kênh youtube chia s? kinh nghi?m h?c và làm l?p trình.', 'laptrinhtv')
go

-- Insert new Video to Videos table 
-- [Time], [Title], [Description], [Privacy], [Views], [ChannelId], [CategoryId]
insert into Videos values ('2020-07-05 20:00:00', N'S?N TÙNG M-TP | CÓ CH?C YÊU LÀ ?ÂY | OFFICIAL MUSIC VIDEO',
N'S?n Tùng MTP', 'public', 56775532, 2, 1)
insert into Videos values ('2019-04-05 20:00:00', N'Nh?ng pha troll trong aoe', N'C??i r?ng r?n v?i aoe t?a 
game huy?n tho?i làm m?a làm gió m?t th?i', 'public', 5, 1, 4)
insert into Videos values ('2020-07-05 20:00:00', N'TOULIVER x BINZ - "BIGCITYBOI" (Official Music Video)', 
'TOULIVER x BINZ - "BIGCITYBOI" (Official Music Video). Shout out to Beck’s Ice beer and their freaking d*pe
gold sneakers.', 'public', 14985976, 3, 1)
insert into Videos values ('2020-06-12 13:00:00', N'L?p trình viên - Fullstack Web c?n h?c ngôn ng? gì?', 
N'L?p trình viên - Fullstack Web c?n h?c ngôn ng? gì? G?i tâm s? c?a b?n t?i tamsu.zendvn.com',
'public', 434, 4, 3)
insert into Videos values ('2020-06-05 21:00:00', N'SKY TOUR MOVIE | S?N TÙNG M-TP | PREVIEW CLIP', N'D? KI?N KH?I CHI?U: 12/06/2020',
'public', 1491404, 2, 1)
go

-- Insert new comment to Comments table
-- [CommentTime], [Content], [UserName], [VideoId]
insert into Comments values ('2020-07-15 20:59:00', N'Hay quá', 'thanhch', 3)
insert into Comments values ('2020-07-08 21:05:00', N'Badboi s? tha em t?i gi??ng còn anh s? th??ng em t?i già', 'binzdapoet', 3)
insert into Comments values ('2020-07-08 22:00:00', N'Chúc m?ng thui~~~~~~', 'hariwon', 1)
insert into Comments values ('2019-07-15 18:23:00', N'56M>>>100M Let us go >>> i love you sky <<<', 'thuynguyen', 1)

-- Insert new subcribed to Subcribed table
-- [ChannelId][UserName][Subcribed]
insert into Subcribed values (3, 'thanhch', 1)
insert into Subcribed values (4, 'thanhch', 1)
insert into Subcribed values (6, 'thanhch', 1)

