/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.LocalDateTime;

/**
 *
 * @author HP
 */
public class RoomRegistration {
    private int registerID, roomID;
    private String userID;
    private LocalDateTime registrationTime;
    private String semester, status;
    private double priceAtTheTime;

    public RoomRegistration() {
    }

    public RoomRegistration(int registerID, int roomID, String userID, LocalDateTime registrationTime, String semester, String status, double priceAtTheTime) {
        this.registerID = registerID;
        this.roomID = roomID;
        this.userID = userID;
        this.registrationTime = registrationTime;
        this.semester = semester;
        this.status = status;
        this.priceAtTheTime = priceAtTheTime;
    }

     public RoomRegistration(int registerID, int roomID, String userID, LocalDateTime registrationTime, String semester, String status) {
        this.registerID = registerID;
        this.roomID = roomID;
        this.userID = userID;
        this.registrationTime = registrationTime;
        this.semester = semester;
        this.status = status;
    }
    
    public int getRegisterID() {
        return registerID;
    }

    public void setRegisterID(int registerID) {
        this.registerID = registerID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getRegistrationTime() {
        return registrationTime;
    }

    public void setRegistrationTime(LocalDateTime registrationTime) {
        this.registrationTime = registrationTime;
    }

    public double getPriceAtTheTime() {
        return priceAtTheTime;
    }

    public void setPriceAtTheTime(double priceAtTheTime) {
        this.priceAtTheTime = priceAtTheTime;
    }
   
}
