/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HP
 */
public class Room {
    private int roomID;
    private int roomSize;
    private int roomAttendees;
    private String gender;
    private String hasAirConditioner;
    private double price;

    public Room() {
    }

    public Room(int roomID, int roomSize, int roomAttendees, String gender, String hasAirConditioner, double price) {
        this.roomID = roomID;
        this.roomSize = roomSize;
        this.roomAttendees = roomAttendees;
        this.gender = gender;
        this.hasAirConditioner = hasAirConditioner;
        this.price = price;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(int roomSize) {
        this.roomSize = roomSize;
    }

    public int getRoomAttendees() {
        return roomAttendees;
    }

    public void setRoomAttendees(int roomAttendees) {
        this.roomAttendees = roomAttendees;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getHasAirConditioner() {
        return hasAirConditioner;
    }

    public void setHasAirConditioner(String hasAirConditioner) {
        this.hasAirConditioner = hasAirConditioner;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Room{" + "roomID=" + roomID + ", roomSize=" + roomSize + ", roomAttendees=" + roomAttendees + ", gender=" + gender + ", hasAirConditioner=" + hasAirConditioner + ", price=" + price + '}';
    }
    
    
}
