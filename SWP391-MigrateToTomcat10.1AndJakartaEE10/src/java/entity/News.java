/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author p4t3
 */
import java.util.Date;
public class News {
    private String NotiID;
    private String Subject;
    private String Content;
    private String userId;
    private Date Time;
    private int isAdmin;

    public News() {
    }

    public News(String NotiID, String Subject, String Content,String userId, Date Time, int isAdmin) {
        this.NotiID = NotiID;
        this.Subject = Subject;
        this.Content = Content;
        this.userId = userId;
        this.Time = Time;
        this.isAdmin = isAdmin;
    }

    public String getNotiID() {
        return NotiID;
    }

    public void setNotiID(String userid) {
        this.NotiID = NotiID;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String pass) {
        this.Subject = Subject;
    }
    
    public String getContent() {
        return Content;
    }

    public void setContent(String pass) {
        this.Content = Content;
    }
    
     public String getuserId() {
        return userId;
    }

    public void setuserId(String pass) {
        this.userId = userId;
    }
    public Date getTime() {
        return Time;
    }

    public void setTime(String pass) {
        this.Time = Time;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }
}
