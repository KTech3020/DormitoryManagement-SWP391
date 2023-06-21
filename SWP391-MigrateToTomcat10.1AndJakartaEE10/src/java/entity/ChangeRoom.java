/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDateTime;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class ChangeRoom {
    private String changeRoomID;
    private String userId1;
    private String userId2;
    private Date date ;

    public ChangeRoom() {
    }

    public ChangeRoom(String changeRoomID, String userId1, String userId2, Date date) {
        this.changeRoomID = changeRoomID;
        this.userId1 = userId1;
        this.userId2 = userId2;
        this.date = date;
    }

    public String getChangeRoomID() {
        return changeRoomID;
    }

    public void setChangeRoomID(String changeRoomID) {
        this.changeRoomID = changeRoomID;
    }

    public String getUserId1() {
        return userId1;
    }

    public void setUserId1(String userId1) {
        this.userId1 = userId1;
    }

    public String getUserId2() {
        return userId2;
    }

    public void setUserId2(String userId2) {
        this.userId2 = userId2;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    
}
