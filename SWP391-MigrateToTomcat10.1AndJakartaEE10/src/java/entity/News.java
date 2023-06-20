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
    private String notiID;
    private String subject;
    private String content;
    private String userId;
    private Date time;
    private int isAdmin;

    public News() {
    }

    public News(String notiID, String subject, String content,String userId, Date time, int isAdmin) {
        this.notiID = notiID;
        this.subject = subject;
        this.content = content;
        this.userId = userId;
        this.time = time;
        this.isAdmin = isAdmin;
    }

    public String getNotiID() {
        return notiID;
    }

    public void setNotiID(String notiID) {
        this.notiID = notiID;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    
}

