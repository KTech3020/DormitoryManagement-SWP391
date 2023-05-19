/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Date;

/**
 *
 * @author MSI GL63
 */
public class Student {
    private int num;
    private String id, name;
    private char gender;
    private Date dob;
    private String userName, pass, img;
    public Student() {
    }

    public Student(int num, String id, String name, char gender, Date dob, String userName, String pass, String img) {
        this.num = num;
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.userName = userName;
        this.pass = pass;
        this.img = img;
    }

    public Student(String id, String name, char gender, Date dob, String userName, String pass) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.dob = dob;
        this.userName = userName;
        this.pass = pass;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

  
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public String getGender() {
        switch(gender){
            case 'M': return "Male";
            case 'F': return "Female";
            case 'L': return "LGBT";
            default: return "Other";
        }
    }
    
    public void setGender(String gender) {
        this.gender = gender.charAt(0);
    }
    
    public java.util.Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Student{" + "num=" + num + ", id=" + id + ", name=" + name + ", gender=" + gender + ", dob=" + dob + ", userName=" + userName + ", pass=" + pass + ", img=" + img + '}';
    }   
}
