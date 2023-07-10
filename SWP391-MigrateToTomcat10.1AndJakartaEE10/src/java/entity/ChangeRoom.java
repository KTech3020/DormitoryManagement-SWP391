/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDateTime;

/**
 *
 * @author LENOVO
 */
public class ChangeRoom {
    private String changeRoomID;
    private String userId1;
    private String userId2;
    private LocalDateTime date ;

    public ChangeRoom() {
    }

    public ChangeRoom(String changeRoomID, String userId1, String userId2, LocalDateTime date) {
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

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }
}