/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author p4t3
 */
import java.time.LocalDateTime;
public class News {
    private String newsID;
    private String subject;
    private String content;
    private String userId;
    private LocalDateTime time;
    private String image;

    public News() {
    }

    public News(String notiID, String subject, String content, String userId, LocalDateTime time, String image) {
        this.newsID = notiID;
        this.subject = subject;
        this.content = content;
        this.userId = userId;
        this.time = time;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    

    public String getNewsID() {
        return newsID;
    }

    public void setNewsID(String notiID) {
        this.newsID = notiID;
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

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }

}
