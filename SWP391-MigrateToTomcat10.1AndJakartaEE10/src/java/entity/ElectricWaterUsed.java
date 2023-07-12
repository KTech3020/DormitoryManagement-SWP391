/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author LENOVO
 */
public class ElectricWaterUsed {

    int ElectricWaterUsedID, reRoomID;
    String semester;
    int oldElectricityIndex, newElectricityIndex, oldWaterIndex, newWaterIndex;
    String status;

    public ElectricWaterUsed() {
    }

    public ElectricWaterUsed(int ElectricWaterUsedID, int reRoomID, String semester, int oldElectricityIndex, int newElectricityIndex, int oldWaterIndex, int newWaterIndex, String status) {
        this.ElectricWaterUsedID = ElectricWaterUsedID;
        this.reRoomID = reRoomID;
        this.semester = semester;
        this.oldElectricityIndex = oldElectricityIndex;
        this.newElectricityIndex = newElectricityIndex;
        this.oldWaterIndex = oldWaterIndex;
        this.newWaterIndex = newWaterIndex;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getElectricWaterUsedID() {
        return ElectricWaterUsedID;
    }

    public void setElectricWaterUsedID(int ElectricWaterUsedID) {
        this.ElectricWaterUsedID = ElectricWaterUsedID;
    }

    public int getReRoomID() {
        return reRoomID;
    }

    public void setReRoomID(int reRoomID) {
        this.reRoomID = reRoomID;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public int getOldElectricityIndex() {
        return oldElectricityIndex;
    }

    public void setOldElectricityIndex(int oldElectricityIndex) {
        this.oldElectricityIndex = oldElectricityIndex;
    }

    public int getNewElectricityIndex() {
        return newElectricityIndex;
    }

    public void setNewElectricityIndex(int newElectricityIndex) {
        this.newElectricityIndex = newElectricityIndex;
    }

    public int getOldWaterIndex() {
        return oldWaterIndex;
    }

    public void setOldWaterIndex(int oldWaterIndex) {
        this.oldWaterIndex = oldWaterIndex;
    }

    public int getNewWaterIndex() {
        return newWaterIndex;
    }

    public void setNewWaterIndex(int newWaterIndex) {
        this.newWaterIndex = newWaterIndex;
    }

    @Override
    public String toString() {
        return "ElectricWaterUsed{" + "ElectricWaterUsedID=" + ElectricWaterUsedID + ", reRoomID=" + reRoomID + ", semester=" + semester + ", oldElectricityIndex=" + oldElectricityIndex + ", newElectricityIndex=" + newElectricityIndex + ", oldWaterIndex=" + oldWaterIndex + ", newWaterIndex=" + newWaterIndex + ", status=" + status + '}';
    }
}
