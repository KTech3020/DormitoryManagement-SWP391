/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author HP
 */
public class Statistics {
    private String allRoomSize;
    private String occupiedRoomSize;
    private String emptyRoomSize;
    private String maleOccupied;
    private String femaleOccupied;
    private String roomCount;
    private String fullRoom;
    private String occupiedRoom;
    private String emptyRoom;
    private String totalPaid;
    private String semesterPaid;

    public Statistics(){}
    
    public Statistics(String allRoomSize, String occupiedRoomSize, String emptyRoomSize, String maleOccupied, String femaleOccupied, String roomCount, String fullRoom, String occupiedRoom, String emptyRoom, String totalPaid, String semesterPaid) {
        this.allRoomSize = allRoomSize;
        this.occupiedRoomSize = occupiedRoomSize;
        this.emptyRoomSize = emptyRoomSize;
        this.maleOccupied = maleOccupied;
        this.femaleOccupied = femaleOccupied;
        this.roomCount = roomCount;
        this.fullRoom = fullRoom;
        this.occupiedRoom = occupiedRoom;
        this.emptyRoom = emptyRoom;
        this.totalPaid = totalPaid;
        this.semesterPaid = semesterPaid;
    }

    public String getAllRoomSize() {
        return allRoomSize;
    }

    public void setAllRoomSize(String allRoomSize) {
        this.allRoomSize = allRoomSize;
    }

    public String getOccupiedRoomSize() {
        return occupiedRoomSize;
    }

    public void setOccupiedRoomSize(String occupiedRoomSize) {
        this.occupiedRoomSize = occupiedRoomSize;
    }

    public String getEmptyRoomSize() {
        return emptyRoomSize;
    }

    public void setEmptyRoomSize(String emptyRoomSize) {
        this.emptyRoomSize = emptyRoomSize;
    }

    public String getMaleOccupied() {
        return maleOccupied;
    }

    public void setMaleOccupied(String maleOccupied) {
        this.maleOccupied = maleOccupied;
    }

    public String getFemaleOccupied() {
        return femaleOccupied;
    }

    public void setFemaleOccupied(String femaleOccupied) {
        this.femaleOccupied = femaleOccupied;
    }

    public String getRoomCount() {
        return roomCount;
    }

    public void setRoomCount(String roomCount) {
        this.roomCount = roomCount;
    }

    public String getFullRoom() {
        return fullRoom;
    }

    public void setFullRoom(String fullRoom) {
        this.fullRoom = fullRoom;
    }

    public String getOccupiedRoom() {
        return occupiedRoom;
    }

    public void setOccupiedRoom(String occupiedRoom) {
        this.occupiedRoom = occupiedRoom;
    }

    public String getEmptyRoom() {
        return emptyRoom;
    }

    public void setEmptyRoom(String emptyRoom) {
        this.emptyRoom = emptyRoom;
    }

    public String getTotalPaid() {
        return totalPaid;
    }

    public void setTotalPaid(String totalPaid) {
        this.totalPaid = totalPaid;
    }

    public String getSemesterPaid() {
        return semesterPaid;
    }

    public void setSemesterPaid(String semesterPaid) {
        this.semesterPaid = semesterPaid;
    }
    
    
}
