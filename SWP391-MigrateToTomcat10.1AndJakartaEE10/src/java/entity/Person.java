/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;
/**
 *
 * @author MSI GL63
 */
public class Person {

    private String idPerson, roomId, img, name, cmnd, dob, gender, phone, email, address;
    
    public Person() {
    }

    public Person(String idPerson) {
        this.idPerson = idPerson;
    }

//    public String getGender() {
//        switch(gender){
//            case 'M': return "Male";
//            case 'F': return "Female";
//            default: return "Other";
//        }
//    }
    public Person(String idPerson, String img, String name, String cmnd, String dob, String gender, String phone, String email, String address) {
        this.idPerson = idPerson;
        this.img = img;
        this.name = name;
        this.cmnd = cmnd;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }

    public Person(String idPerson, String roomId, String img, String name, String cmnd, String dob, String gender, String phone, String email, String address) {
        this.idPerson = idPerson;
        this.roomId = roomId;
        this.img = img;
        this.name = name;
        this.cmnd = cmnd;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    
    public String getIdPerson() {
        return idPerson;
    }

    public void setIdPerson(String idPerson) {
        this.idPerson = idPerson;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}