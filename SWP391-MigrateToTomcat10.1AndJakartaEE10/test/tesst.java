
import dao.DormDAO;
import entity.Room;
import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author LENOVO
 */
public class tesst {
    public static void main(String[] args) {
        DormDAO dao = new DormDAO();
        ArrayList<Room> list = dao.displayAllRoom();
        for (Room Room : list) {
            System.out.println(Room);
        }
    }
}
