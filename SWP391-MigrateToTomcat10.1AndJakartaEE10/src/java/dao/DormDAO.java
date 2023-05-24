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
        String sql = "select * from Account where idPerson = ? and password= ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
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
                + "where idPerson = ?";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
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
                        rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }

        } catch (Exception e) {
        }
        return null;
    }

    public void updateProfile(String idPerson, String roomId, String img, String name, String cmnd,
            String dob, String gender, String phone, String email, String address) {
        try {
            String sql = "update Person set [roomId] = ?,[img] = ?, [fullname] = ?, "
                    + "[CMND] = ?, [birth] = ?, [gender] = ?, [phone] = ?, "
                    + "[email] = ?, [address] = ? where [idPerson] = ?";
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, roomId);
            ps.setString(2, img);
            ps.setString(3, name);
            ps.setString(4, cmnd);
            ps.setString(5, dob);
            ps.setString(6, gender);
            ps.setString(7, phone);
            ps.setString(8, email);
            ps.setString(9, address);
            ps.setString(10, idPerson);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public ArrayList returnAllRooms() {
        ArrayList<Room> result = new ArrayList();
        String sql = "select * from Room";
        try {
            con = new DBContext().getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                result.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3),
                        rs.getString(4), rs.getString(5), rs.getDouble(6)));

            }
            return result;
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList returnRoomMatchQuery(String roomSize, String roomAttendees,
            String gender, String hasAirCon, String price) {
        ArrayList<Room> result = new ArrayList();
        String sql = "select * from Room where roomSize = ? AND roomAttendees <= ? AND gender = ? AND hasAirConditioner = ? AND price <= ?";
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
                result.add(new Room(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getString(4), rs.getString(5), rs.getDouble(6)));
            }
            return result;
        } catch (Exception e) {
        }
        return null;
    }
}
