
import dao.DormDAO;
import entity.RoomRegistration;
import java.time.LocalDateTime;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author LENOVO
 */
public class NewClass {
    public static void main(String[] args) {
        DormDAO dao = new dao.DormDAO();
        RoomRegistration roomRegistration1 = dao.getRegisterRoomByIdAndSemester("SE170983", "FA23");
        RoomRegistration roomRegistration2 = dao.getRegisterRoomByIdAndSemester("DE150287", "FA23");
        
        LocalDateTime dateTime1 = roomRegistration1.getRegistrationTime();
        LocalDateTime dateTime2 = roomRegistration2.getRegistrationTime();
        
        System.out.println(dateTime2);       
    }
}
