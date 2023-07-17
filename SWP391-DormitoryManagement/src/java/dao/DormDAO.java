/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Person;
import context.DBContext;
import entity.Account;
import entity.ChangeRoom;
import entity.ElectricWaterUsed;
import entity.News;
import entity.Room;
import entity.RoomRegistration;
import entity.Statistics;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author MSI GL63
 */
public class DormDAO {

    Connection con = null; // ket noi toi sql server
    PreparedStatement ps = null; // nem cau lenh query tu netbean sang sql server
    ResultSet rs = null; // nhan ket qua tra ve

    public Account login(String username, String password) {
        String sql = "select * from Account where [userId] = ? and password= ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2), rs.getInt(3));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Person checkIdPersonExist(String username) {
        String sql = "select idPerson from Person where idPerson = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Person(rs.getString(1));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExist(String username) {
        String sql = "select * from Account where userId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2), rs.getInt(3));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void registerAccount(String username, String password) {
        String sql = "insert into Account VALUES(?,?,0)";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateAccount(String password, String username) {
        String sql = "UPDATE Account SET password = ? WHERE userID = ?;";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Person getPersonProfile(String username) {
        String sql = "select * from Person where idPerson = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Person(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Person> getPersonProfileManager() {
        String sql = "select p.idPerson, reRoom.roomId, p.img , p.fullname, p.CMND, p.birth, p.gender, p.phone, p.email, p.address \n"
                + "                     from Account acc, RegisterRoom reRoom, Person p\n"
                + "                     where acc.userId = p.idPerson\n"
                + "                     and reRoom.userId = acc.userId\n"
                + "                     and reRoom.status = 'Success'";
        ArrayList<Person> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Person(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    public void updateProfile(String idPerson, String img, String name, String cmnd,
            String dob, String gender, String phone, String email, String address) {
        try {
            String sql = "update Person set [img] = ?, [fullname] = ?, "
                    + "[CMND] = ?, [birth] = ?, [gender] = ?, [phone] = ?, "
                    + "[email] = ?, [address] = ? where [idPerson] = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, img);
            ps.setString(2, name);
            ps.setString(3, cmnd);
            ps.setString(4, dob);
            ps.setString(5, gender);
            ps.setString(6, phone);
            ps.setString(7, email);
            ps.setString(8, address);
            ps.setString(9, idPerson);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProfileNoImageChange(String idPerson, String name, String cmnd,
            String dob, String gender, String phone, String email, String address) {
        try {
            String sql = "update Person set [fullname] = ?, "
                    + "[CMND] = ?, [birth] = ?, [gender] = ?, [phone] = ?, "
                    + "[email] = ?, [address] = ? where [idPerson] = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, cmnd);
            ps.setString(3, dob);
            ps.setString(4, gender);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.setString(7, address);
            ps.setString(8, idPerson);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    //for manage
    public ArrayList<Room> displayAllRoom() {
        String sql = "select * from RoomDetailView order by roomID";
        ArrayList<Room> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    //for student
    public ArrayList returnAllNonFullRooms() {
        ArrayList<Room> result = new ArrayList();
        String sql = "select * from RoomDetailView order by roomID";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt(2) != rs.getInt(3)) {
                    result.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                            rs.getString(4), rs.getString(5), rs.getDouble(6)));
                }

            }
            return result;
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList returnRoomMatchQuery(String roomSize, String roomAttendees,
            String gender, String hasAirCon, String price) {
        ArrayList<Room> result = new ArrayList();
        String sql = "select * from RoomDetailView where roomSize = ? AND roomAttendees <= ? AND gender = ? AND airConditional = ? AND price <= ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roomSize);
            ps.setString(2, roomAttendees);
            ps.setString(3, gender);
            ps.setString(4, hasAirCon);
            ps.setString(5, price);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt(2) != rs.getInt(3)) {
                    result.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getDouble(6)));
                }
            }
            return result;
        } catch (Exception e) {
        }
        return null;
    }

    public void createRegisterRoomRequest(String roomID, String userID, LocalDateTime date, String semester) {
        String sql = "insert into RegisterRoom ([roomId], [userId], [date], [semester], [status])"
                + "VALUES (?,?,?,?,'Registered')";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roomID);
            ps.setString(2, userID);
            ps.setObject(3, date);
            ps.setString(4, semester);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList viewAllRegistrations() {
        ArrayList<RoomRegistration> result = new ArrayList();
        String sql = "select * from RoomRegistrationView order by reRoomID";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new RoomRegistration(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getTimestamp(4).toLocalDateTime(), rs.getString(5),
                        rs.getString(6), rs.getDouble(7)));
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList viewRegistrationMatchStudent(String userID) {
        ArrayList<RoomRegistration> result = new ArrayList();
        String sql = "select * from RoomRegistrationView where userId = ? AND NOT [status] = 'Removed' order by reRoomID";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new RoomRegistration(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getTimestamp(4).toLocalDateTime(), rs.getString(5),
                        rs.getString(6), rs.getDouble(7)));
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList viewRegisteredRoomByStudent(String userID) {
        ArrayList<RoomRegistration> result = new ArrayList();
        String sql = "select * from RoomRegistrationView where userId = ? and status LIKE 'Registered' order by reRoomID";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new RoomRegistration(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getTimestamp(4).toLocalDateTime(), rs.getString(5),
                        rs.getString(6), rs.getDouble(7)));
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void paymentSuccess(int reRoomID) {
        String sql = "update RegisterRoom set status = 'Success' where reRoomID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, reRoomID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateRegistrationStatus(String registerID, String status) {
        String sql = "update RegisterRoom set status = ? where reRoomID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(2, registerID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int lastPagesP(int size) {
        int lastPages = 0;
        String createQuery = "select count(*) \n"
                + "                            from Room r,  RegisterRoomDetail rd \n"
                + "                            where r.roomId = rd.roomId\n"
                + "                            AND ((rd.startDay <= GETDATE() AND GETDATE() < rd.endDay) OR (rd.startDay <= GETDATE() AND rd.endDay IS NULL))";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(createQuery);
            rs = ps.executeQuery();

            while (rs.next()) {
                int total = rs.getInt(1);
                lastPages = total / size;

                if (total % size != 0) {
                    lastPages++;
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return lastPages;
    }

    public Room getRoomById(int id) {
        String sql = "select * from RoomDetailView where roomID = ? ";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getDouble(6));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public void updateRoom(int roomID, int roomSize, int roomAttendees, String gender,
            String hasAirConditioner, double newPrice) {
        String sql = "update Room set roomSize= ?, roomAttendees= ?, gender= ?, airConditional=?\n"
                + "                     where roomId = ?\n"
                + "                     \n"
                + "                     update RegisterRoomDetail set endDay = (GETDATE() -1)\n"
                + "                     where roomId = ? and (RegisterRoomDetail.startDay <= GETDATE() AND RegisterRoomDetail.endDay IS NULL)\n"
                + "                     \n"
                + "                     insert into RegisterRoomDetail ([roomId], [startDay], [endDay], [price]) VALUES \n"
                + "                     (?, GETDATE(), null, ?)";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roomSize);
            ps.setInt(2, roomAttendees);
            ps.setString(3, gender);
            ps.setString(4, hasAirConditioner);
            ps.setInt(5, roomID);
            ps.setInt(6, roomID);
            ps.setInt(7, roomID);
            ps.setDouble(8, newPrice);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void addRoom(int roomID, int roomSize, int roomAttendees, String gender, String hasAirConditioner, double price, Date startDay) {
        String sql = "insert into Room VALUES (?,?,?,?,?)\n"
                + "                     insert into RegisterRoomDetail ([roomId], [startDay], [endDay], [price]) VALUES ( ?, ?, null, ?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roomID);
            ps.setInt(2, roomSize);
            ps.setInt(3, roomAttendees);
            ps.setString(4, gender);
            ps.setString(5, hasAirConditioner);
            ps.setInt(6, roomID);
            ps.setDate(7, (java.sql.Date) startDay);
            ps.setDouble(8, price);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void deleteRoom(int roomID) {
        String sql = "delete from RegisterRoomDetail where [roomId] =? and (RegisterRoomDetail.startDay < GETDATE() AND RegisterRoomDetail.endDay IS NULL)\n"
                + "delete from Room where [roomId] =?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roomID);
            ps.setInt(2, roomID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean checkAlreadyRegistered(String roomID, String userID) {
        boolean isRegistered = false;
        String sql = "select roomID from RoomRegistrationView where [roomID] = ? AND [userID] = ? AND (status = 'Registered' OR status = 'Success')";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roomID);
            ps.setString(2, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(1).equals(roomID)) {
                    isRegistered = true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return isRegistered;
    }

    public boolean checkAlreadySuccessRegistered(String userID) {
        boolean isRegistered = false;
        String sql = "select userID from RoomRegistrationView where [userID] = ? AND status = 'Success'";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getString(1).equals(userID)) {
                    isRegistered = true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return isRegistered;
    }

    public ArrayList<News> getAllNews() {
        String sql = "select * from Notification";
        ArrayList<News> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5).toLocalDateTime(), rs.getString(6)));
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public ArrayList<News> getTwoLatestNews() {
        String sql = "select top 2 * from Notification order by time DESC";
        ArrayList<News> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5).toLocalDateTime(), rs.getString(6)));
            }
            return list;
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public News getSingleNews(String notiID) {
        String sql = "select * from Notification where [notiID] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, notiID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getTimestamp(5).toLocalDateTime(), rs.getString(6));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return null;
    }

    public void deleteNews(String notiID) {
        String sql = "delete from Notification where [notiID] =?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, notiID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void editNews(String notiID, String subject, String content, String userId, String image) {
        try {
            String sql = "update Notification set [subject] = ?, [content] = ?, [userId] = ?, [time] = GETDATE(), [img] = ? where [notiID] = ? ";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, subject);
            ps.setString(2, content);
            ps.setString(3, userId);

            ps.setString(4, image);
            ps.setString(5, notiID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editNewsNoImageChange(String notiID, String subject, String content, String userId) {
        try {
            String sql = "update Notification set [subject] = ?, [content] = ?, [userId] = ?, [time] = GETDATE()where [notiID] = ? ";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, subject);
            ps.setString(2, content);
            ps.setString(3, userId);
            ps.setString(4, notiID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void addNews(String subject, String content, String userId, String image) {
        String sql = "insert into Notification VALUES(?,?,?,GETDATE(),?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, subject);
            ps.setString(2, content);
            ps.setString(3, userId);
            ps.setString(4, image);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean checkStudentAlreadyRegisteredRoom(String userID, String semester) {
        boolean isRegisteredRoom = true;
        String sql = "select * from RegisterRoom where [userID] = ? AND status = 'Success' and semester = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            ps.setString(2, semester);
            rs = ps.executeQuery();
            if (rs != null) {
                isRegisteredRoom = false;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return isRegisteredRoom;
    }

    public void createChangeRoomRequest(String userID1, String userID2, LocalDateTime date) {
        String sql = "insert into ChangeRoom VALUES (?,?,?)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID1);
            ps.setString(2, userID2);
            ps.setObject(3, date);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<ChangeRoom> displayAllChangeRoomRequest() {
        String sql = "select * from ChangeRoom";
        ArrayList<ChangeRoom> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChangeRoom(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getTimestamp(4).toLocalDateTime()));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    public RoomRegistration getRegisterRoomByIdAndSemester(String userId, String semester) {
        String sql = "select * from RegisterRoom where [userID] = ? AND status = 'Success' and semester = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            ps.setString(2, semester);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new RoomRegistration(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getTimestamp(4).toLocalDateTime(), rs.getString(5), rs.getString(6));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public void acceptChangeRoomRequest1(String userID1, String userID2, LocalDateTime date2) {
        String sql = "update RegisterRoom set userId =? where userId =? and date =?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID1);
            ps.setString(2, userID2);
            ps.setObject(3, date2);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteChangeRoomRequest(String changeRoomID) {
        String sql = "delete from ChangeRoom where changeRoomID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, changeRoomID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Statistics viewStatistics(String semID) {
        String sql = "select \n"
                + "                     (select SUM(roomSize) from RoomDetailView) as column1, \n"
                + "                     (select count(roomAttendees) from RoomDetailView) as column2, \n"
                + "                     (select (SUM(roomSize) - count(roomAttendees)) from RoomDetailView) as column3,\n"
                + "                     (select count(roomAttendees) from RoomDetailView where gender = 'M') as column4,\n"
                + "                     (select count(roomAttendees) from RoomDetailView where gender = 'f') as column5,\n"
                + "                     (select count(*) from RoomDetailView) as column6,\n"
                + "                     (select count(*) from RoomDetailView where (roomAttendees = roomSize)) as column7,\n"
                + "                     (select count(*) from RoomDetailView where (roomAttendees > 0)) as column8,\n"
                + "                     (select count(*) from RoomDetailView where (roomAttendees = 0)) as column9,\n"
                + "                     (select SUM(price) from RoomRegistrationView where status = 'Success') as column10,\n"
                + "                     (select SUM(price) from RoomRegistrationView where status = 'Success' AND semester like ?) as column11";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, semID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Statistics(String.valueOf(rs.getInt(1)), String.valueOf(rs.getInt(2)),
                        String.valueOf(rs.getInt(3)), String.valueOf(rs.getInt(4)),
                        String.valueOf(rs.getInt(5)), String.valueOf(rs.getInt(6)),
                        String.valueOf(rs.getInt(7)), String.valueOf(rs.getInt(8)),
                        String.valueOf(rs.getInt(9)), rs.getString(10),
                        rs.getString(11));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void removeRegistration(String registerID) {
        String sql = "update RegisterRoom set status = 'Removed' where reRoomID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, registerID);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Person> viewRoommates(int roomID, String semester) {
        String sql = "select * from RoomMembersList where roomId = ? and semester = ?";
        ArrayList<Person> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roomID);
            ps.setString(2, semester);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Person(rs.getString(1), rs.getString(10), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    public int getRoomIdOfUser(String userID) {
        String sql = "select rr.roomID from Person p inner join RegisterRoom rr "
                + "on p.idPerson = rr.userId AND rr.status = 'Success' where p.idPerson = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return 0;
    }

    public ArrayList<ElectricWaterUsed> viewElectricWaterByReRoomId(String semester, int reRoomID) {

        String sql = "select elecWaterBill.ElectricWaterUsedID, elecWaterBill.reRoomID, elecWaterBill.semester, \n"
                + "elecWaterBill.oldElectricityIndex, elecWaterBill.newElectricityIndex, elecWaterBill.oldWaterIndex, \n"
                + "elecWaterBill.newWaterIndex, elecWaterBill.status\n"
                + "from ElectricWaterUsed elecWaterBill, RegisterRoom registRoom\n"
                + "where elecWaterBill.reRoomID = registRoom.reRoomID\n"
                + "and elecWaterBill.semester = ? and elecWaterBill.reRoomID = ? and elecWaterBill.status = 'Waiting'";
        ArrayList<ElectricWaterUsed> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, semester);
            ps.setInt(2, reRoomID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ElectricWaterUsed(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    public int roomAttendees(String semester, String userId) {

        String createQuery = "select　room.roomAttendees\n"
                + "from Room room, RegisterRoom registerRoom\n"
                + "where Room.roomId = registerRoom.roomId\n"
                + "and registerRoom.semester = ? and registerRoom.status = 'Success' and registerRoom.userId = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(createQuery);
            ps.setString(1, semester);
            ps.setString(2, userId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return 0;
    }
    
    public ArrayList<ElectricWaterUsed> viewAllElectricWater(String semester) {

        String sql = "select elecWaterBill.ElectricWaterUsedID, elecWaterBill.reRoomID, elecWaterBill.semester, \n"
                + "elecWaterBill.oldElectricityIndex, elecWaterBill.newElectricityIndex, elecWaterBill.oldWaterIndex, \n"
                + "elecWaterBill.newWaterIndex, elecWaterBill.status\n"
                + "from ElectricWaterUsed elecWaterBill, RegisterRoom registRoom\n"
                + "where elecWaterBill.reRoomID = registRoom.reRoomID\n"
                + "and elecWaterBill.semester = ? ";
        ArrayList<ElectricWaterUsed> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, semester);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ElectricWaterUsed(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8)));
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return list;
    }

    public int lastPagesManageElectricAndWater(int size, String semester) {
        int lastPages = 0;
        String createQuery = "select COUNT(*)\n"
                + "from ElectricWaterUsed elecWaterBill, RegisterRoom registRoom\n"
                + "where elecWaterBill.reRoomID = registRoom.reRoomID\n"
                + "and elecWaterBill.semester = ? ";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(createQuery);
            ps.setString(1, semester);
            rs = ps.executeQuery();

            while (rs.next()) {
                int total = rs.getInt(1);
                lastPages = total / size;

                if (total % size != 0) {
                    lastPages++;
                }
            }
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
        return lastPages;
    }

    public ElectricWaterUsed getElectricWaterUsedById(int ElectricWaterUsedID) {
        String sql = "select * from ElectricWaterUsed where ElectricWaterUsedID = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, ElectricWaterUsedID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ElectricWaterUsed(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5), rs.getInt(6), rs.getInt(7), rs.getString(8));
            }
        } catch (Exception e) {
        }

        return null;
    }

    public void updateElectricWater(int newElectricityIndex, int newWaterIndex, int electricWaterUsedID) {
        String sql = "update ElectricWaterUsed set newElectricityIndex= ?, newWaterIndex= ? where ElectricWaterUsedID = ?";

        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, newElectricityIndex);
            ps.setInt(2, newWaterIndex);
            ps.setInt(3, electricWaterUsedID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void deleteElectricWater(int electricWaterUsedID) {
        String sql = "delete from ElectricWaterUsed where [ElectricWaterUsedID] = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, electricWaterUsedID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void addElectricWater(int reRoomID, String semester, int oldElectricityIndex, int newElectricityIndex,
            int oldWaterIndex, int newWaterIndex) {
        String sql = "insert into ElectricWaterUsed\n"
                + "VALUES\n"
                + "(?,?, ?, ?, ?, ?, 'Waiting')";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, reRoomID);
            ps.setString(2, semester);
            ps.setInt(3, oldElectricityIndex);
            ps.setInt(4, newElectricityIndex);
            ps.setInt(5, oldWaterIndex);
            ps.setInt(6, newWaterIndex);

            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
    
    public void updateStatusElectricWater(int electricWaterUsedID) {
        String sql = "update ElectricWaterUsed set status = 'Success' where ElectricWaterUsedID = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, electricWaterUsedID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public String getSemesterCurrentTime(){
        LocalDateTime dateIn4Months = LocalDateTime.now().plusMonths(4);
        int month = dateIn4Months.getMonth().getValue();
        String semester = "";
        if (month >= 1 && month <= 4) {
            semester = semester.concat("SP");
        } else if (month >= 5 && month <= 8) {
            semester = semester.concat("SU");
        } else if (month >= 9 && month <= 12) {
            semester = semester.concat("FA");
        }

        String year = Integer.toString(dateIn4Months.getYear());
        year = year.substring(year.length() - 2);
        semester = semester.concat(year);
        return semester;
    }
}
