/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Person;
import context.DBContext;
import entity.Account;
import entity.Room;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
        String sql = "select * from Account\n"
                + "where userId = ?";
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
        String sql = "UPDATE Account SET password = ? WHERE idPerson = ?;";

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
        String sql = "select p.idPerson, p.img , p.fullname, p.CMND, p.birth, p.gender, p.phone, p.email, p.address \n"
                + "from Account acc, RegisterRoom reRoom, Person p\n"
                + "where acc.userId = p.idPerson\n"
                + "and reRoom.userId = acc.userId";
        ArrayList<Person> list = new ArrayList<>();
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Person(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9)));
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

    public ArrayList returnAllRooms() {
        ArrayList<Room> result = new ArrayList();
        String sql = "select r.roomId, r.roomSize, r.roomAttendees, r.gender, r.airConditional, rd.price "
                + "from Room r inner join RegisterRoomDetail rd "
                + "on (r.roomId = rd.roomId AND ((rd.startDay < GETDATE() AND GETDATE() <= rd.endDay) OR (rd.startDay < GETDATE() AND rd.endDay IS NULL))) ";
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
        String sql = "select r.roomId, r.roomSize, r.roomAttendees, r.gender, r.airConditional, rd.price "
                + "from Room r inner join RegisterRoomDetail rd on (r.roomId = rd.roomId AND "
                + "((rd.startDay < GETDATE() AND GETDATE() <= rd.endDay) OR (rd.startDay < GETDATE() AND rd.endDay IS NULL))) "
                + "where roomSize = ? AND roomAttendees <= ? AND gender = ? AND airConditional = ? AND price <= ?";
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
}
