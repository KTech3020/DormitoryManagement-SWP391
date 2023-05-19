/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Model.Student;
import Model.DatabaseInfo;
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
public class StudentDB {
   
    public List<Student> getStudent() throws Exception {
        List<Student> list = new ArrayList<>();
        String query = "select * from Student";
Connection con = null;        
        try{
            con = DatabaseInfo.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs=stmt.executeQuery();
            while (rs.next()) {
                list.add (new Student(rs.getInt(1),rs.getNString(2),rs.getString(3), rs.getString(4).charAt(0), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
            return list;
        } 
        catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
        return list;
    }
//--------------------------------------------------------------------------------------------
    public static Student login(String username) throws Exception{
        Student s=null;
        Connection con = null;
        try{
            con = DatabaseInfo.getConnection();
            PreparedStatement stmt=con.prepareStatement("Select id, name, gender, dob, pass from Student where username=?");
            stmt.setString(1, username);
            ResultSet rs=stmt.executeQuery();
            if(rs.next()){
                String id = rs.getString(1);
                String name=rs.getString(2);
                char gender=rs.getString(3).charAt(0);
                Date dob=rs.getDate(4);
                String pass = rs.getString(5);
                s=new Student(id,name,gender,dob,username,pass);
            }
            
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
        finally {con.close();}
        return s;
    }
    
   public void createStudent(String id, String name, String gender, String dob, String userName, String password, String img ) throws Exception {
        String query = "Insert into Student values(?,?,?,?,?,?,?)";
        Connection con = null;
        try{
            con = DatabaseInfo.getConnection();
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, gender);
            stmt.setString(4, dob);
            stmt.setString(5, userName);
            stmt.setString(6, password);
            stmt.setString(7, img);
            stmt.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
    }
//-----------------------------------------------------------------------------------
    public Student getStudentByID(String num) throws Exception {
        String query = "select * from Student where num = ?";
        Connection con= null;
        try{
            con = DatabaseInfo.getConnection();
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, num);
            ResultSet rs=stmt.executeQuery();
            while (rs.next()) {
                return new Student(rs.getInt(1),rs.getNString(2),rs.getString(3), rs.getString(4).charAt(0), rs.getDate(5), rs.getString(6), rs.getString(7), rs.getString(8));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
        return null;
    }
    
    public void updateStudent(String num, String name, String gender, String dob, String username, String pass, String id, String img ) throws Exception {
        List<Student> list = new ArrayList<>();
        String query = "update Student set id = ?, [name] = ?, gender = ? , DOB = ?, username = ?, pass = ?, img = ? where num = ?";
        Connection con= null;
        try{
            con = DatabaseInfo.getConnection();
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, gender);
            stmt.setString(4, dob);
            stmt.setString(5, username);
            stmt.setString(6, pass);
            stmt.setString(7, img);
            stmt.setString(8, num);
            stmt.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
        }
    }
//--------------------------------------------------------------------------------
    public void deleteStudent(String id) throws Exception {
           String query = "delete from Student where id = ?";
           Connection con = null;
           try{
               con = DatabaseInfo.getConnection();
               PreparedStatement stmt=con.prepareStatement(query);
               stmt.setString(1, id);
               stmt.executeUpdate();
               con.close();
           } catch (Exception ex) {
               System.out.println("Error: " + ex);
           }
     }
}
