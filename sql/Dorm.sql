create database Dorm
use Dorm


create table Room(
[roomId] int primary key,
[roomSize] int,  -- suc chua toi da
[roomAttendees] int,   -- so nguoi hien dang o
[gender] char (1) check (gender in ('F', 'M')),	
[airConditional] char (1) check (airConditional in ('Y', 'N'))
)

create table Person(
[idPerson] varchar (10) primary key,  -- Id thuoc FPT (bao gom sinh vien va nhan vien quan ly) 
[img] Nvarchar (50),
[fullname] Nvarchar (50),
[CMND] nvarchar(10),
[birth] smalldatetime,
[gender] char (1) check (gender in ('F', 'M')),		
[phone] char (10), 
[email] varchar (30),
[address] Nvarchar(50)
)

create table Account(
[userId] varchar (10) primary key,  -- [idPerson] = [userId]
[password] Nvarchar (50),
[isAdmin] int,			--	[isAdmin] của manager là 1, của sinh viên là 0
CONSTRAINT fk_acc foreign key ([userId]) references Person(idPerson),

)

create table RegisterRoom(
[reRoomID] int identity(1,1) primary key,
[roomId] varchar (5),
[userId] varchar (10),
[date] date,
[semester] varchar (5),
[status] varchar(10) check (status in ('Success', 'Registered', 'Rejected', 'Removed')),
CONSTRAINT fk_register1 foreign key (userId) references Account (userId),
CONSTRAINT fk_register2 foreign key ([roomId]) references Room ([roomId])
)

create table ElectricWaterUsed (
[ElectricWaterUsedID] int identity(1,1) primary key,
[reRoomID] int,
[semester] varchar (10),
[oldElectricityIndex] int,
[newElectricityIndex] int,
[oldWaterIndex] int,
[newWaterIndex] int,
[status] varchar(10) check (status in ('Success', 'Waiting'))
CONSTRAINT fk_ewu2 foreign key ([reRoomID]) references RegisterRoom([reRoomID])
)

create table RegisterRoomDetail(
[reRoomDetailID] int identity(1,1) primary key,
[roomId] varchar (5),
[startDay] date,
[endDay] date,
[price] money,
CONSTRAINT fk_registerDetail2 foreign key ([roomId]) references Room ([roomId])
)


create table Notification(
[notiID] int identity(1,1) primary key,
[subject] nvarchar(max), --Tieu de
[content] nvarchar(max), --Noi dung
[userId] varchar(10), --ID admin
[time] datetime, --Ngay dang
[img] varchar(100), --Anh
CONSTRAINT fk_Notification foreign key (userId) references Account (userId)
)

create table ChangeRoom(
[changeRoomID] int identity(1,1) primary key,
[userId1] varchar (10),
[userId2] varchar (10),
[day] date,
CONSTRAINT fk_changeRoom foreign key ([userId1]) references Account (userId)
)



insert into Notification
VALUES
(N'Sử dụng Ký túc xá Đại học FPT Hà Nội làm khu cách ly tập trung',
N'Để chuẩn bị cho việc sử dụng Ký túc xá Đại học làm khu cách ly tập trung, Ban Quản lý yêu cầu tất cả các sinh viên của Ký túc xá cần:\n
(1) Tất cả sinh viên đang ở hoặc đang để đồ tại KTX nhanh chóng thu dọn, giải phóng đồ đạc và dời khỏi KTX trước 12h00 ngày 13/5/2021. Sau thời hạn trên, nếu sinh viên không thu dọn, nhà trường không chịu trách nhiệm về đồ đạc của sinh viên để lại trong phòng. Đồ đạc không dùng tới có thể đóng gói dán nhãn và gửi vào kho của trường.\n
(2) Tuân thủ nguyên tắc 5K trong quá trình thu dọn (khẩu trang – khử khuẩn – khoảng cách – không tụ tập – khai báo y tế).\n
(3) Không để việc thu dọn KTX ảnh hưởng đến việc học tập học kỳ Summer 2021.\n
Đây là tình huống bất khả kháng cùng thành phố Hà Nội và cả nước phòng ngừa và ngăn chặn dịch bệnh COVID-19, đề nghị tất cả các bạn sinh viên thực hiện nghiêm túc.\n
Trân trọng thông báo!','MA093891','2022-10-05', 'News1.png'),
(N'Đại học FPT Hà Nội bố trí xe miễn phí đưa sinh viên đang cách ly tại ký túc xá về quê ăn Tết',
N'Nhà trường đã ra thông báo, kể từ ngày 5/2/2021, nhà trường sẽ đóng cửa và ngưng các dịch vụ tiện ích, ký túc xá để chuẩn bị cho khả năng tình hình COVID-19 tại Hà Nội có thể phức tạp, Hà Nội thành điểm nóng, Campus ĐH FPT Hà nội có thể được trưng dụng làm khu cách ly tập trung theo đề nghị của UBND TP HN. Nhà trường yêu cầu tất cả sinh viên hiện tại đang còn ở KTX FPTU Hoà Lạc thực hiện: Thu dọn đồ, cho vào tủ khóa lại trước khi về nhà ăn Tết từ sáng ngày 04/02/2021; trên đường trở về địa phương nơi cư trú thực hiện nghiêm các nội dung phòng chống dịch theo hướng dẫn 5K (Khẩu trang – Khử khuẩn – Khoảng cách – Không tập trung – Khai báo y tế', 'MA093891','11-03-04', 'News2.png'),
(N'Review KTX cho sinh viên', 
N'Trường Đại học FPT với kiến trúc xanh và không gian như một khu resort sang xịn mịn cùng hàng loạt góc sống ảo đẹp không góc chết. Và ký túc xá sinh viên thì được trang hoàng chả khác gì khách sạn luôn.\n
Nằm ở Hòa Lạc, các trung tâm thành phố khoảng 30km, Trường Đại học FPT như 1 khu resort đích thực khi kiến trúc xịn sò, quang cảnh tuyệt đẹp và đặc biệt là siêu yên tĩnh. Nếu như sinh viên các trường bị ám ảnh bởi cuộc sống ở những khu ký túc xá cũ đầy tối tăm, chật hẹp thì sinh viên FPT lại rất tự hào và hãnh diện vì cuộc sống sinh viên nơi đây sướng hơn cả ở khách sạn.', 'MA093891', '2022-11-06', 'News3.png')



insert into Room
VALUES
('101','6','1','F','Y'),
('102','6','3','F','Y'),
('103','8','2','M','N'),
('104','8','5','M','N'),
('105','8','1','M','N'),
('106','4','1','M','Y'),
('107','4','4','F','Y'),
('108','4','2','F','Y'),
('109','4','3','F','Y'),
('110','6','2','M','Y')

delete from RegisterRoomDetail

insert into RegisterRoomDetail ([roomId], [startDay], [endDay], [price])
VALUES
( '101', '2020-01-01', '2023-04-30', 2400000),
( '101', '2023-05-01', null, 3000000),
( '102', '2020-01-01', '2023-04-30', 2400000),
( '102', '2023-05-01', null, 3000000),
( '103', '2020-01-01', '2022-04-30', 2000000),
( '103', '2022-05-01', null, 2400000),
( '104', '2020-01-01', '2020-08-31', 2000000),
( '104', '2020-09-01', null, 1800000),
( '105', '2020-01-01', '2022-04-30', 1200000),
( '105', '2022-05-01', null, 2000000),
( '106', '2020-01-01', null, 2000000),
( '107', '2020-01-01', null, 2000000),
( '108', '2020-01-01', '2020-12-31', 2000000),
( '108', '2021-01-01', null, 2000000),
( '109', '2020-01-01', null, 2000000),
( '110', '2020-01-01', '2020-12-31', 2000000),
( '110', '2021-01-01', null, 2000000)


insert into Person
VALUES
('DE150928', N'DE150928.png', N'Nguyen Hai Dang', N'8278398716', '2001-05-21', 'M', '0986592817', 'dangnhde150928@fpt.edu.vn', N'27 Phan Dang Luu- Hai Chau- Da Nang'),
('DE160129', N'DE160129.png', N'Tran Tuan Kiet', N'1040290491', '2002-04-12', 'M', '0912948394', 'kietttde160129@fpt.edu.vn', N'28 Tran Dai Nghia- Ngu Hanh Son- Da Nang'),
('SE160125', N'SE160125.png', N'Hoang Cat Tuong', N'2857820810', '2002-04-01', 'F', '0926749183', 'tuonghcse160125@fpt.edu.vn', N'61 Han Thuyen- Hai Chau- Da Nang'),
('DE150918', N'DE150918.png', N'Ly Gia Khanh', N'9380476182', '2001-10-25', 'M', '0925368179', 'khanhlgde150918@fpt.edu.vn', N'258 Hung Vuong- Thanh Khe- Da Nang'),
('DE158490', N'DE158490.png', N'Tran Thanh Quyen', N'9280958719', '2001-12-02', 'M', '0984785983', 'quyenttde158490@fpt.edu.vn', N'320 Nguyen Van Linh- Ngu Hanh Son- Da Nang'),
('MA093891', N'MA093891.png', N'Hoang Phi Hong', N'0973091652', '1983-05-21', 'M', '0387198647', 'honghpma093891@fpt.fe.vn', N'411 Le Duan- Thanh Khe- Da Nang'),
('MA091773', N'MA091773.png', N'Ho Quang Vinh', N'2839487167', '1985-10-11', 'M', '0981782783', 'vinhhqma091773@fpt.fe.vn', N'57 Hung Vuong- Hai Chau- Da Nang'),
('DE170561', N'DE170561.png', N'Dinh Trong Hai Trieu', N'0490093091', '2003-04-02', 'M', '0376511989', 'trieudthde170561@fpt.edu.vn', N'Ky Tuc Xa Mart- Dien Ngoc- Dien Ban- Quang Nam'),
('SE170983', N'SE170983.png', N'Le Anh Khoa', N'8287499281', '2003-10-02', 'M', '0398817872', 'khoalase170983@fpt.edu.vn', N'27 Tran Hung Dao- Dien Ngoc- Dien Ban- Quang Nam'),
('DE170298', N'DE170298.png', N'Le Gia Bao', N'973179283', '2003-07-18', 'M', '0387198563', 'baolgde170298@fpt.edu.vn', N'122 Phan Thanh- Thanh Khe- Da Nang'),
('DE152894', N'DE152894.png', N'Duong Qua', N'8277593284', '2001-03-14', 'M', '0828479109', 'quadanuongde152894@fpt.edu.vn', N'92 2/9 Hai Chau- Da Nang'),
('SE160938', N'SE160938.png', N'Huynh My Linh', N'8299820919', '2002-12-01', 'F', '0295874909', 'linhhmSE160938@fpt.edu.vn', N'04 Nguyen Cu Trinh- Hai Chau- Da Nang'),
('SE160094', N'SE160094.png', N'Tran Thi Ly', N'2094174859', '2002-06-02', 'F', '0948756283', 'lyttse160094@fpt.edu.vn', N'K17 Binh An 7- Hai Chau- Da Nang'),
('DE169019', N'DE169019.png', N'Ho Ngoc An', N'1093276478', '2002-09-13', 'M', '0794857618', 'anhnde169019@fpt.edu.vn', N'45 y Lan Nguyen Phi- Hai Chau- Da Nang'),
('DE150287', N'DE150287.png', N'Ho Tuan Khai', N'0398618940', '2001-06-14', 'M', '0994872353', 'khaihtde150287@fpt.edu.vn', N'90 Ham Nghi- Ngu Hanh Son- Da Nang')
select * from Account


insert into Account
VALUES
('MA093891', N'honghp83', 1),
('MA091773', N'vinhhq85', 1),
('SE160094', N'lytran989', 0),
('DE169019', N'an928001', 0),
('DE150287', N'khaiht666', 0),
('DE152894', N'duongdaihiep@00', 0),
('SE160938', N'mylinh0300', 0),
('SE170983', N'123', 0)

insert into RegisterRoom
VALUES
('102', 'DE150928', '2023-04-18', 'SU23', 'Success'),
('104', 'DE150287', '2022-12-18', 'SP23', 'Success'),
('105', 'DE152894', '2023-01-30', 'SU23', 'Success'),
('106', 'DE169019', '2023-07-19', 'FA23', 'Success'),
('106', 'SE170983', '2023-07-19', 'FA23', 'Success'),
('111', 'SE160938', '2023-07-19', 'FA23', 'Success'),
('110', 'DE152894', '2023-07-20', 'FA23', 'Success')


insert into ElectricWaterUsed
VALUES
('5','FA23', '0', '15', '0', '30', 'Waiting'),
('6','FA23', '0', '30', '0', '30', 'Waiting'),
('3','SU23', '0', '7', '7', '45', 'Success')

select * from RoomRegistrationView where status = 'Success'
select * from Account where isAdmin = 1