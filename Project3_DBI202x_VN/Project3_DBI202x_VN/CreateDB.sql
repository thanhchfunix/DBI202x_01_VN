-- Create database
create database Project3_DBI202x_VN
go

-- Use this database
use Project3_DBI202x_VN
go

-- create Users table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Users'
    )
CREATE TABLE [Users]
(
	[Username] varchar(30) not null,
	[Email] varchar(30) not null,
	[Password] varchar(10) not null,
	Constraint PK_Username Primary key(Username)
)
go

-- create Channel table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Channel'
    )
CREATE TABLE [Channel]
(
	[ChannelId] int not null identity(1,1),
	[Name] nvarchar(50) not null,
	[Description] nvarchar(255) not null,
	[Username] varchar(30) not null,
	Constraint Channel_unique unique (Name),
	constraint PK_ChannelId Primary key (ChannelId),
	constraint FK_Username_Channel Foreign key (Username) References Users(Username)
)
go

-- create Categories table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Categories'
    )
CREATE TABLE [Categories]
(
	[CategoryId] int not null identity(1,1),
	[Name] varchar(30) not null,
	constraint category_unique unique (Name),
	constraint Category_Id primary key (CategoryId)
)
go

-- create Videos table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Videos'
    )
CREATE TABLE [Videos]
(
	[VideoId] int not null identity(1,1),
	[Time] datetime not null,
	[Title] nvarchar(100) not null,
	[Description] nvarchar(255),
	[Privacy] varchar(20) NOT NULL CHECK (Privacy IN('public', 'private')),
	[Views] bigint,
	[ChannelId] int not null,
	[CategoryId] int not null,
	constraint Video_Id primary key (VideoId),
	constraint FK_CategoryId_Video foreign key (CategoryId) references Categories(CategoryId),
	constraint FK_ChannelId_Video foreign key (ChannelId) references Channel(ChannelId)
)
go

-- create Comments table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Comments'
    )
CREATE TABLE [Comments]
(
	[CommentId] int not null identity(1,1),
	[CommentTime] datetime not null,
	[Content] nvarchar(255) not null,
	[Username] varchar(30),
	[VideoId] int,
	constraint FK_Username_Comments foreign key (Username) references Users(Username),
	constraint FK_VideoId_Comments foreign key (VideoId) references Videos(VideoId)
)
go

-- create Subcribed table
if not exists(
        select [name]
        from sys.tables
        where [name] = 'Subcribed'
    )
CREATE TABLE [Subcribed]
(
	[ChannelId] int not null,
	[Username] varchar(30) not null,
	[Subcribed] int,
	--constraint FK_Username_Subcribed foreign key (Username) references Users(Username),
	--constraint FK_ChannelId_Subcribed foreign key (ChannelId) references Channel(ChannelId)
	constraint PK_Subcribed primary key (ChannelId, Username)
)
go
