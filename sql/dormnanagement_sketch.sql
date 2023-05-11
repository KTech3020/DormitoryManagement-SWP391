create database DormManagement 
use DormManagement 

create table RoomType(
    RoomTypeID char(5) PRIMARY KEY,
    RoomSize int,
    RoomPrice int check (RoomPrice >= 0),
) create table ElectricWaterBill(
    ElectricWaterBillID char(5) PRIMARY KEY,
    ElectricCount int,
    ElectricPrice int,
    WaterCount int,
    WaterPrice int,
    TotalPrice int
) create table Room(
    RoomID int PRIMARY KEY,
    RoomTypeID char(5),
    BillID char(5),
    ElectricWaterBillID char(5),
    NumberOfOccupants int check (NumberOfOccupants >= 0),
    RoomImageLink char,
    constraint room_roomtype_fk FOREIGN KEY(RoomTypeID) REFERENCES RoomType(RoomTypeID),
    constraint room_bill_fk FOREIGN KEY(ElectricWaterBillID) REFERENCES ElectricWaterBill(ElectricWaterBillID),
) create table DormUser(
    StudentID char(8) PRIMARY KEY,
    FirstName nvarchar(10),
    LastName nvarchar(20),
    Age int check (Age >= 0),
    Sex char(1) check (
        Sex = 'M'
        or Sex = 'F'
        or Sex = 'O'
    ),
    Email char(60),
    RoomID int,
    constraint dormUser_room_fk FOREIGN KEY(RoomID) REFERENCES Room(RoomID),
    User_Username char(20)
    constraint User_Username FOREIGN KEY(User_Username) REFERENCES Account(Username)
) create table Admin(
    AdminID char(8) PRIMARY KEY,
    FirstName nvarchar(10),
    LastName nvarchar(20),
    Age int check (Age >= 0),
    Sex char(1) check (
        Sex = 'M'
        or Sex = 'F'
        or Sex = 'O'
    ),
    Email char(60),
    Admin_Username char(20)
    constraint Admin_Username FOREIGN KEY(Admin_Username) REFERENCES Account(Username)
) create table Account(
    AccountType char(5),
    Username char(20),
    Password char(20)
)