/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author LENOVO
 */
public class Account {
    private int userid;
    private String users;
    private String pass;
    private int isAdmin;

    public Account() {
    }

    public Account(int userid, String users, String pass, int isAdmin) {
        this.userid = userid;
        this.users = users;
        this.pass = pass;
        this.isAdmin = isAdmin;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsers() {
        return users;
    }

    public void setUsers(String users) {
        this.users = users;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "userid=" + userid + ", users=" + users + ", pass=" + pass + ", isAdmin=" + isAdmin + '}';
    }
    
    
}
