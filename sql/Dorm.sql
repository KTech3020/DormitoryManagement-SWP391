create database Dorm

use Dorm

create table Room(
[roomId] varchar (5) primary key,
[roomType] char (5),
[roomSize] int,  -- suc chua toi da
[roomAttendees] int,   -- so nguoi hien dang o
[gender] char (1) check (gender in ('F', 'M')),	
[airConditional] char (1) check (airConditional in ('Y', 'N')),	
[price] money	
)

create table Person(
[idPerson] varchar (10) primary key,  -- Id thuoc FPT (bao gom sinh vien va nhan vien quan ly) 
[roomId] varchar (5),
[img] Nvarchar (50),
[fullname] Nvarchar (50),
[CMND] nvarchar(10),
[birth] smalldatetime,
[gender] char (1) check (gender in ('F', 'M')),		
[phone] char (10), 
[email] varchar (30),
[address] Nvarchar(50),
CONSTRAINT fk_student foreign key ([roomId]) references Room([roomId])
)
insert into Person
VALUES
('DE150928', '401', N'DE150928.png', N'Nguyen Hai Dang', N'827648398716', '2001-05-21', 'M', '0986592817', 'dangnhde150928@fpt.edu.vn', N'27 Phan Dang Luu- Hai Chau- Da Nang'),
('SE159398', '401', N'SE159398.png', N'Huynh Gia Bao', N'839840587183', '2001-11-26', 'M', '0971512353', 'baohgse159398@fpt.edu.vn', N'54 Le VINH Hien- Tran Dai Nghia- Ngu Hanh Son- Da Nang'),
('DE152894', '302', N'DE152894.png', N'Duong Qua', N'8277593892849', '2001-03-14', 'M', '0828479109', 'quadanuongde152894@fpt.edu.vn', N'92 2/9 Hai Chau- Da Nang'),
('DE160129', '302', N'DE160129.png', N'Tran Tuan Kiet', N'102940290491', '2002-04-12', 'M', '0912948394', 'kietttde160129@fpt.edu.vn', N'28 Tran Dai Nghia- Ngu Hanh Son- Da Nang'),
('SE160928', '302', N'SE160928.png', N'Phan Van Tuan', N'920950962784', '2002-06-26', 'M', '0928665872', 'tuanpvse160928@fpt.edu.vn', N'92 Le VINH Hien- Tran Dai Nghia- Ngu Hanh Son- Da Nang'),
('SE160938', '504', N'SE160938.png', N'Huynh My Linh', N'829859820919', '2002-12-01', 'F', '0295874909', 'linhhmSE160938@fpt.edu.vn', N'04 Nguyen Cu Trinh- Hai Chau- Da Nang'),
('SE160125', '504', N'SE160125.png', N'Hoang Cat Tuong', N'293857820810', '2002-04-01', 'F', '0926749183', 'tuonghcse160125@fpt.edu.vn', N'61 Han Thuyen- Hai Chau- Da Nang'),
('SE160094', '504', N'SE160094.png', N'Tran Thi Ly', N'209409174859', '2002-06-02', 'F', '0948756283', 'lyttse160094@fpt.edu.vn', N'K17 Binh An 7- Hai Chau- Da Nang'),
('DE169019', '304', N'DE169019.png', N'Ho Ngoc An', N'109384276478', '2002-09-13', 'M', '0794857618', 'anhnde169019@fpt.edu.vn', N'45 y Lan Nguyen Phi- Hai Chau- Da Nang'),
('DE150918', '304', N'DE150918.png', N'Ly Gia Khanh', N'938920476182', '2001-10-25', 'M', '0925368179', 'khanhlgde150918@fpt.edu.vn', N'258 Hung Vuong- Thanh Khe- Da Nang'),
('DE150287', '304', N'DE150287.png', N'Ho Tuan Khai', N'039847618940', '2001-06-14', 'M', '0994872353', 'khaihtde150287@fpt.edu.vn', N'90 Ham Nghi- Ngu Hanh Son- Da Nang'),
('DE158490', '304', N'DE158490.png', N'Tran Thanh Quyen', N'928040958719', '2001-12-02', 'M', '0984785983', 'quyenttde158490@fpt.edu.vn', N'320 Nguyen Van Linh- Ngu Hanh Son- Da Nang'),
('DE170561', '312', N'DE170561.png', N'Dinh Trong Hai Trieu', N'049092093091', '2003-04-02', 'M', '0376511989', 'trieudthde170561@fpt.edu.vn', N'Ky Tuc Xa Mart- Dien Ngoc- Dien Ban- Quang Nam'),
('SE170983', '312', N'SE170983.png', N'Le Anh Khoa', N'828937499281', '2003-10-02', 'M', '0398817872', 'khoalase170983@fpt.edu.vn', N'27 Tran Hung Dao- Dien Ngoc- Dien Ban- Quang Nam'),
('DE170298', '312', N'DE170298.png', N'Le Gia Bao', N'97317949283', '2003-07-18', 'M', '0387198563', 'baolgde170298@fpt.edu.vn', N'122 Phan Thanh- Thanh Khe- Da Nang'),
('MA093891', '102', N'MA093891.png', N'Hoang Phi Hong', N'092873091652', '1983-05-21', 'M', '0387198647', 'honghpma093891@fpt.fe.vn', N'411 Le Duan- Thanh Khe- Da Nang'),
('MA091773', '102', N'MA091773.png', N'Ho Quang Vinh', N'283759487167', '1985-10-11', 'M', '0981782783', 'vinhhqma091773@fpt.fe.vn', N'57 Hung Vuong- Hai Chau- Da Nang')

create table Account(
[userId] int identity(1,1) primary key,
[idPerson] varchar (10),
[password] Nvarchar (50),
[isAdmin] int,			--	[isAdmin] của manager là 0, của sinh viên là 1
CONSTRAINT fk_acc foreign key (idPerson) references Person(idPerson)
)
set identity_insert dbo.Account on
insert into Account
VALUES
(0399, 'MA093891', N'honghp83', 1),
(0400, 'MA091773', N'vinhhq85', 1),
(9874, 'SE160094', N'lytran989', 0),
(9287, 'DE169019', N'an928001', 0),
(9289, 'DE150287', N'khaiht666', 0),
(8278, 'DE152894', N'duongdaihiep@00', 0),
(8928, 'SE160938', N'mylinh0300', 0)

create table ElectricWaterUsed (
[ElectricWaterUsedID] int identity(1,1) primary key,
[roomId] varchar (5),
[date] date,
[oldElectricityIndex] int,
[newElectricityIndex] int,

[oldWaterIndex] int,
[newWaterIndex] int,
CONSTRAINT fk_ewu foreign key (roomId) references Room(roomId)
)


create table Bill(
[billId] int identity(1,1) primary key,
[userId] int,
[cost] money,
[date] datetime,
[semester] varchar (5),
CONSTRAINT fk_bill foreign key (userId) references Account (userId)
)
 
create table StudentRequest(
[RequestId] int identity(1,1) primary key,
[userId] int,
[request] Ntext,
CONSTRAINT fk_changeRoom foreign key (userId) references Account (userId)
)

create table RegisterRoom(
[reRoomID] int identity(1,1) primary key,
[userId] int,
[roomId] varchar (5),
[date] datetime,
[semester] varchar (5),
[status] varchar(10) check (status in ('Success', 'Registered', 'Rejected')),
CONSTRAINT fk_register1 foreign key (userId) references Account (userId),
CONSTRAINT fk_register2 foreign key (roomId) references Room (roomId)
)

create table Notification(
[NotifiId] int identity(1,1) primary key,
[userId] int,
[Title] Ntext,
[Date] datetime,
[Content] Ntext,
CONSTRAINT fk_Notification foreign key (userId) references Account (userId)
)

Drop table RegisterRoom
Drop table Notification
Drop table RequestToChangeRoom
