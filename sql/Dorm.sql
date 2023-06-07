﻿create database Dorm
use Dorm

-- use master
-- ALTER database Dorm set offline with ROLLBACK IMMEDIATE;
-- DROP database Dorm;


create table Room(
[roomId] varchar (5) primary key,
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
[date] datetime,
[semester] varchar (5),
[status] varchar(10) check (status in ('Success', 'Registered', 'Rejected')),
CONSTRAINT fk_register1 foreign key (userId) references Account (userId),
CONSTRAINT fk_register2 foreign key ([roomId]) references Room ([roomId])
)

create table ElectricWaterUsed (
[ElectricWaterUsedID] int identity(1,1) primary key,
[reRoomID] int,
[dateStartSemester] date,
[dateEndSemester] date,

[oldElectricityIndex] int,
[newElectricityIndex] int,

[oldWaterIndex] int,
[newWaterIndex] int,
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
/*
create table Bill(
[billId] int identity(1,1) primary key,
[cost] money,
[date] datetime,
[semester] varchar (5),
[roomId] varchar (5),
[reRoomID] int,
CONSTRAINT fk_Bill foreign key ([reRoomID]) references RegisterRoom([reRoomID])
)
*/
 
create table StudentRequest(
[RequestId] int identity(1,1) primary key,
[userId] varchar (10),
[request] Ntext,
[day] date,
CONSTRAINT fk_changeRoom foreign key (userId) references Account (userId)
)

create table Notification(
[NotifiId] int identity(1,1) primary key,
[userId] varchar (10),
[Title] Ntext,
[Date] datetime,
[Content] Ntext,
CONSTRAINT fk_Notification foreign key (userId) references Account (userId)
)

-- TODO FIX ALL DATA

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


insert into Account
VALUES
('MA093891', N'honghp83', 1),
('MA091773', N'vinhhq85', 1),
('SE160094', N'lytran989', 0),
('DE169019', N'an928001', 0),
('DE150287', N'khaiht666', 0),
('DE152894', N'duongdaihiep@00', 0),
('SE160938', N'mylinh0300', 0)

insert into RegisterRoom
VALUES
('101', 'DE169019', '2022-07-18', 'SU22', 'Success')

insert into RegisterRoom
VALUES
('102', 'SE160094', '2022-04-18', 'SP22', 'Success'),
('104', 'DE150287', '2022-12-18', 'FAL22', 'Success'),
('105', 'DE152894', '2022-01-30', 'SP22', 'Success'),
('106', 'SE160938', '2022-07-19', 'SU22', 'Success')

insert into RegisterRoom
VALUES
('101', 'DE169019', '2021-01-18', 'SP22', 'Registered'),



insert into RegisterRoomDetail ([roomId], [startDay], [endDay], [price])
VALUES
( '101', '2020-01-01', '2023-04-30', 2400000),
( '101', '2023-05-01', null, 3000000),
( '102', '2020-01-01', '2023-04-30', 2400000),
( '102', '2023-05-01', null, 3000000),
( '103', '2020-01-01', '2022-04-30', 2000000),
( '103', '2022-04-01', '2023-12-31', 2400000),
( '103', '2024-01-01', null, 2800000),
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



select * from Account where [userId] = 'SE160094' and password= 'lytran989'
select * from Person where idPerson = 'SE160094'

select * from Account where exists (select * from RegisterRoom where RegisterRoom.roomId = Room.roomId)

select p.idPerson, reRoom.roomId, p.img , p.fullname, p.CMND, p.birth, p.gender, p.phone, p.email, p.address 
from Account acc, RegisterRoom reRoom, Person p
where acc.userId = p.idPerson
and reRoom.userId = acc.userId
and reRoom.status = 'Success'

select r.roomId, r.roomSize, r.roomAttendees, r.gender, r.airConditional, rd.price 
from Room r inner join RegisterRoomDetail rd 
on (r.roomId = rd.roomId AND ((rd.startDay < GETDATE() AND GETDATE() <= rd.endDay) OR (rd.startDay < GETDATE() AND rd.endDay IS NULL))) 
 
 
 select count(*) from Room


 
select r.roomId, r.roomSize, r.roomAttendees, r.gender, r.airConditional, rd.price
from RegisterRoomDetail rd, Room r
where rd.roomId = r.roomId
and r.roomId= '101'
and (rd.startDay < GETDATE() AND rd.endDay IS NULL)

update Room set roomSize= '8', roomAttendees= '2', gender= 'M', airConditional='N'
where roomId = '101'

update RegisterRoomDetail set price= '2000000' 
where roomId = '101' and (RegisterRoomDetail.startDay < GETDATE() AND RegisterRoomDetail.endDay IS NULL)


update Room set roomSize= ?, roomAttendees= ?, gender= ?, airConditional=?
where roomId = ?

update RegisterRoomDetail set price= ?
where roomId = ? and (RegisterRoomDetail.startDay < GETDATE() AND RegisterRoomDetail.endDay IS NULL)


insert into product(Name,Img,Price,Description,CateId,IdAdmin)\n"
                + "	values(?,?,?,?,?,?)



insert into Room VALUES (?,?,?,?,?)

insert into RegisterRoomDetail ([roomId], [startDay], [endDay], [price]) VALUES ( ?, ?, null, ?)


delete from RegisterRoomDetail where [roomId] ='111' and (RegisterRoomDetail.startDay < GETDATE() AND RegisterRoomDetail.endDay IS NULL)
delete from Room where [roomId] ='111'
