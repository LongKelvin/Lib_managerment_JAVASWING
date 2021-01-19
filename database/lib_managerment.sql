USE [master]
GO

WHILE EXISTS(select NULL from sys.databases where name='lib_managerment')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'lib_managerment') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [lib_managerment]
END
GO



CREATE DATABASE lib_managerment
GO
USE lib_managerment
GO


/****** Object:  Table [dbo].[book_categories]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[book_types]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[book_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](150) NULL,
 CONSTRAINT [PK_book_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[publisher] [nvarchar](50) NULL,
	[published_year] [int] NULL,
	[price] [money] NULL,
	[category] [int] NULL,
	[type] [int] NULL,
	[language] [int] NULL,
	[quantity] [int] NULL,
	[description] [nvarchar](50) NULL,
	[image] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[languages]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[languages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](10) NULL,
	[description] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member_types]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[members]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[members](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[type] [int] NULL,
	[expired_date] [date] NULL,
	[description] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[member] [int] NULL,
	[staff] [int] NULL,
	[book] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 1/19/2021 11:47:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](32) NULL,
	[password] [nvarchar](32) NULL,
	[email] [nchar](100) NULL,
	[fullname] [nvarchar](50) NULL,
	[role] [int] NULL,
	[activated] [int] NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([category])
REFERENCES [dbo].[book_categories] ([id])
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([language])
REFERENCES [dbo].[languages] ([id])
GO
ALTER TABLE [dbo].[books]  WITH CHECK ADD FOREIGN KEY([type])
REFERENCES [dbo].[book_types] ([id])
GO
ALTER TABLE [dbo].[members]  WITH CHECK ADD FOREIGN KEY([type])
REFERENCES [dbo].[member_types] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([book])
REFERENCES [dbo].[books] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([member])
REFERENCES [dbo].[members] ([id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([staff])
REFERENCES [dbo].[staff] ([id])
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [FK_staff_roles] FOREIGN KEY([role])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [FK_staff_roles]
GO

USE [lib_managerment]
GO

INSERT INTO [dbo].[member_types]
           ([name]
           ,[description])
     VALUES
          (N'Giám Đốc','Quản lý ')
GO

INSERT INTO [dbo].[member_types]
           ([name]
           ,[description])
     VALUES
          (N'Thủ Thư','PT Mượn Trả Sách ')
GO

INSERT INTO [dbo].[member_types]
           ([name]
           ,[description])
     VALUES
          (N'Thủ Kho','PT Xuất Nhập Sách ')
GO

INSERT INTO book_types( name)
  VALUES(N'Lịch Sử')

  INSERT INTO book_types( name)
  VALUES(N'Tạp Chí')

  INSERT INTO book_types( name)
  VALUES(N'Luận Văn')

  INSERT INTO book_types( name)
  VALUES(N'Khoa học')

  INSERT INTO book_types( name)
  VALUES(N'Giáo Trình')

  INSERT INTO book_types( name)
  VALUES(N'Sách Tham Khảo')


INSERT INTO book_categories( name)
  VALUES(N'Lịch sử – Văn hóa')

  INSERT INTO book_categories( name)
  VALUES(N'Chính trị  – Kinh tế')

  INSERT INTO book_categories( name)
  VALUES(N'Tôn giáo – Triết học')

  INSERT INTO book_categories( name)
  VALUES(N'Khoa học')

  INSERT INTO book_categories( name)
  VALUES(N'Kĩ Thuật')

  INSERT INTO book_categories( name)
  VALUES(N'Văn chương – Nghệ thuật')

USE [lib_managerment]
GO

INSERT INTO [dbo].[languages]
           ([name]
           ,[description])
     VALUES
           ('vi','vietnam')
GO

INSERT INTO [dbo].[languages]
           ([name]
           ,[description])
     VALUES
           ('en','english')
GO




 SET IDENTITY_INSERT books ON
 go
 INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('1',N'Lịch sử Việt Nam',N'Lê Thành Khôi',1, 1,N' Kim Đồng','2012','2019-08-06','51000','100','1')

   INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('2',N'Văn minh Việt Nam',N'Nguyễn Văn Huyên',1, 1,N' Kim Đồng','2012','2019-08-06','51000','100','1')

  
  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('3',N'Chính trị luận',N'Aristotle',2,  2, N' Chính Trị','2014','2019-08-06','80000','50','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('4',N'Tâm lý học đám đông',N'Gustav Le Bon',2, 2, N' Tri Thức Mới ','2014','2019-08-06','80000','120','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('5',N'Xã hội diễn cảnh','Guy Debord',2,  2, N' Kim Đồng  ','2014','2019-08-02','150000','180','1')

INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('6',N'Zarathustra đã nói như thế',N'Friedrich Nietzsche',3, 3,N' Tổng Hợp','2015','2019-08-06','80000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('7',N'Bàn về Sự Thật',N'Krishnamurti',3, 3,N' Tổng Hợp','2015','2019-08-06','80000','100','1')


  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('8',N'Bộ công cụ mới','Francis Bacon',4, 4,N' Tri Thức Mới  ','2017','2019-08-02','150000','180','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('9',N'Cấu trúc các cuộc Cách mạng Khoa học kỹ thuật','Thomas Kuhn',4, 4,N' Tri Thức Mới  ','2017','2019-08-02','150000','200','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('10',N'Cấu trúc các cuộc Cách mạng Khoa học kỹ thuật','Thomas Kuhn',4, 4,N' Tri Thức Mới  ','2017','2019-08-02','150000','200','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('11',N'Sự tiến hóa của Vật lý','Albert Einstein',4, 4,N' Tri Thức Mới  ','2019','2019-12-02','150000','200','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('12',N'Cái toàn thể và trật tự ẩn','David Bohm',4, 4,N' Kim Đồng  ','2017','2019-08-02','100000','300','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('13',N'Vật lý hiện đại (2 tập)','Thomas Kuhn',4, 4,N' Tổng Hợp  ','2017','2019-08-02','50000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('14',N'Điều bất khả','John D. Barrow',4, 4,N' Tổng Hợp  ','2017','2019-08-02','50000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('15',N'Code Complete 2','Steve McConnell',5, 5,N' Tổng Hợp  ','2017','2019-08-02','250000','300','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('16',N'Don’t Make Me Think: A Common Sense Approach to Web Usability','Steve Krug',5, 5,N' Tri Thức Mới  ','2018','2019-08-02','250000','300','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('17',N'Peopleware : Productive Projects and Teams, 2nd Ed','Tom DeMarco',5, 5,N' Tổng Hợp  ','2017','2019-08-02','250000','300','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('18',N'Thủy Hử & Hậu Thủy Hử',N'Thi Nại Am',6, 6,N' publisher Giáo Dục  ','2017','2019-08-02','50000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('19',N'Tam Quốc chí -Trần Thọ & Tam quốc diễn nghĩa',N'La Quán Trung',6, 6,N' publisher Giáo Dục  ','2018','2019-08-02','60000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('20',N'Tây Du ký',N'Ngô Thừa Ân',6, 6,N' Tổng Hợp  ','2016','2019-08-02','50000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('21',N'Hồng Lâu Mộng',N'Tào Tuyết Cần',6, 6,N' publisher Giáo Dục  ','2019','2019-08-02','50000','50','1')
  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)

  VALUES('22',N'Liêu trai chí dị',N'Bồ Tùng Linh',6, 6,N' Tổng Hợp  ','2014','2019-08-02','50000','50','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('23',N'Ngôn sứ','Khalil Gibran',6, 6,N' NXB Giáo Dục  ','2013','2019-08-02','80000','120','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('24',N'Tiếu ngạo giang hồ','Kim Dung',6, 6,N' Tổng Hợp  ','2012','2019-08-02','50000','300','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('25',N'Walden, một mình sống trong rừng','Henry David Thoreau',6, 6,N' publisher Giáo Dục  ','2013','2019-08-02','90000','50','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('26',N'Nghệ nhân và Margarita ','Mikhail Bulgakov',6, 6,N' Tổng Hợp  ','2017','2019-08-02','50000','50','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('27',N'Bài hát chính tôi','Walt Whitman',6, 6,N' NXB Giáo Dục  ','2017','2019-08-02','40000','190','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('28',N'Truyện Kiều','Nguyễn Du',6, 6,N' Kim Đồng  ','2018','2019-08-02','70000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('29',N'Bánh Trôi Nước',N'Hồ Xuân Hương',6, 6,N' NXB Giáo Dục  ','2017','2019-08-02','30000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('30',N'Cung oán ngâm khúc',N'Nguyễn Gia Thiều',6, 6,N' NXB Giáo Dục  ','2017','2019-08-02','90000','200','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('31',N'Thi nhân Việt Nam',N'Hoài Thanh',6, 6,N' Tổng Hợp   ','2017','2019-08-02','60000','100','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('32',N'Vang bóng một thời',N'Nguyễn Tuân',6, 6,N' NXB Giáo Dục  ','2017','2019-08-02','70000','200','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('33',N'Đời thừa','Nam Cao',6, 6,N' Tổng Hợp  ','2017','2019-08-02','80000','150','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('34',N'Gió đầu mùa',N'Thạch Lam',6, 6,N' NXB Giáo Dục  ','2017','2019-08-02','20000','150','1')

  INSERT INTO books(id, title, author, type, category, publisher, published_year, description, price, quantity, language)
  VALUES('35',N'Thương nhớ mười hai',N'Vũ Bằng',6, 6,N' Tổng Hợp  ','2017','2019-08-02','50000','200','1')

  USE [lib_managerment]
GO

INSERT INTO [dbo].[staff]
           ([username]
           ,[password]
           ,[email]
           ,[fullname]
           ,[role]
           ,[activated]
           ,[description])
     VALUES
           ('admin','admin','admin@gmail.com','adminstrations',1,1,'adminstations')
GO

INSERT INTO [dbo].[staff]
           ([username]
           ,[password]
           ,[email]
           ,[fullname]
           ,[role]
           ,[activated]
           ,[description])
     VALUES
           ('user','user','user_@gmail.com','user',2,1,'user')
GO


USE [lib_managerment]
GO

INSERT INTO [dbo].[orders]
           ([member]
           ,[staff]
           ,[book]
           ,[start_date]
           ,[end_date]
           ,[description])
     VALUES
          (1,2,1,'2021-1-17','2021-1-30','')
GO
INSERT INTO [dbo].[orders]
           ([member]
           ,[staff]
           ,[book]
           ,[start_date]
           ,[end_date]
           ,[description])
     VALUES
          (2,2,5,'2021-1-19','2021-2-20','')
GO



