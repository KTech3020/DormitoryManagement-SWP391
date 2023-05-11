create table Account(
[id] int identity(1,1) primary key,
[username] varchar (10),
[password] Nvarchar (50),
[role] int,
CONSTRAINT fk_acc foreign key (username) references Manager(m_id),
CONSTRAINT fk_acc2 foreign key (username) references Student(s_id),
)
--[role] của manager là 0, của sinh viên là 1
create table Manager(
	[m_id] varchar (10) primary key,
	[img] Nvarchar (50),
	[fullname] Nvarchar (50),
	[birth] smalldatetime,
	[gender] char (1) check (gender in ('F', 'M', 'O')),	
	[phone] char (10), 
	[email] varchar (30),
	[address] Nvarchar(50),
)
create table Student(
	[s_id] varchar (10) primary key,
	[img] Nvarchar (50),
	[fullname] Nvarchar (50),
	[birth] smalldatetime,
	[gender] char (1) check (gender in ('F', 'M', 'O')),	
	[phone] char (10), 
	[email] varchar (30),
	[address] Nvarchar(50),
	[room_id] varchar (5),
	CONSTRAINT fk_student foreign key (room_id) references Room(r_id),
)
create table RoomType(
	[type] char (5) primary key,
	[size] int,
	[price] money
)
create table Room(
	[r_id] varchar (5) primary key,
	[r_type] char (5),
	[r_size] int,
	[r_attendees] int,
	[gender] char (1) check (gender in ('F', 'M', 'O')),	
	CONSTRAINT fk_room foreign key (r_type) references RoomType(type),
	--CONSTRAINT fk_size foreign key (r_size) references RoomType (size),
)
create table ElectricWaterUsed (
	[semester] varchar (5) primary key,
	[room_id] varchar (5),
	[first_mth_electric] int,
	[second_mth_electric] int,
	[third_mth_electric] int,
	[final_mth_electric] int,
	[first_mth_water] int,
	[second_mth_ water] int,
	[third_mth_ water] int,
	[final_mth_ water] int,
	CONSTRAINT fk_ewu foreign key (room_id) references Room(r_id),
)
create table Bill (
[bill_id] int identity(1,1) primary key,
[room_id] varchar (5),
[s_id] varchar (10),
[m_id] varchar (10),
[semester] varchar (5),
[Cost] money,
[Date] datetime,
CONSTRAINT fk_bill foreign key (room_id) references Room (r_id),
CONSTRAINT fk_bill2 foreign key (s_id) references Student (s_id),
CONSTRAINT fk_bill3 foreign key (m_id) references Manager (m_id),
CONSTRAINT fk_bill4 foreign key (semester) references ElectricWaterUsed (semester),
)
create table Request(
[s_id] varchar (10) primary key,
[room_id] varchar (5),
[request] Ntext,
CONSTRAINT fk_request foreign key (s_id) references Student (s_id),
)
create table Register(
[s_id] varchar (10) primary key,
[room_id] varchar (5),
[date] datetime,
[status] varchar(10) check (status in ('Success', 'Registered', 'Rejected')),
CONSTRAINT fk_register foreign key (s_id) references Student (s_id),
CONSTRAINT fk_register2 foreign key (room_id) references Room (r_id)
)
