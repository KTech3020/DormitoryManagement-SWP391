/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Person;
import context.DBContext;
import entity.Account;
import entity.Room;
import entity.RoomRegistration;
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
        String sql = "select p.idPerson, reRoom.roomId, p.img , p.fullname, p.CMND, p.birth, p.gender, p.phone, p.email, p.address"
                     + " from Account acc, RegisterRoom reRoom, Person p"
                     + " where acc.userId = p.idPerson"
                     + " and reRoom.userId = acc.userId"
                     + "and reRoom.status = 'Success'";
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

    //for manage
    public ArrayList<Room> displayAllRoom() {
        String sql = "select * from RoomDetailView";
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
        String sql = "select * from RoomDetailView";
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
        String sql = "select * from RoomRegistrationView where userId = ? order by reRoomID";
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

    public void updateRegistrationStatus(String registerID, String status) {
        String sql = "update RegisterRoom set status = ? where reRoomID = ?";
        int roomID;
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
        String createQuery = "select count(*) from Room r,  RegisterRoomDetail rd "
                            + "where r.roomId = rd.roomId "
                            + "AND ((rd.startDay < GETDATE() AND GETDATE() <= rd.endDay) OR (rd.startDay < GETDATE() AND rd.endDay IS NULL))";
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

    public void updateRoom(int roomID, int roomSize, int roomAttendees, String gender, String hasAirConditioner, double price) {
        String sql = "update Room set roomSize= ?, roomAttendees= ?, gender= ?, airConditional=? "
                    + "where roomId = ? "
                    + "update RegisterRoomDetail set price= ? "
                    + "where roomId = ? and (RegisterRoomDetail.startDay < GETDATE() AND RegisterRoomDetail.endDay IS NULL)";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, roomSize);
            ps.setInt(2, roomAttendees);
            ps.setString(3, gender);
            ps.setString(4, hasAirConditioner);
            ps.setInt(5, roomID);
            ps.setDouble(6, price);
            ps.setInt(7, roomID);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    public void addRoom(int roomID, int roomSize, int roomAttendees, String gender, String hasAirConditioner, double price, Date startDay) {
        String sql = "insert into Room VALUES (?,?,?,?,?) "
                    + "insert into RegisterRoomDetail ([roomId], [startDay], [endDay], [price]) VALUES ( ?, ?, null, ?)";
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
}
