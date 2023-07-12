
import dao.DormDAO;
import entity.ElectricWaterUsed;
import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author LENOVO
 */
public class test {
    public static void main(String[] args) {
        DormDAO dao = new DormDAO();
        ArrayList<ElectricWaterUsed> result = dao.viewElectricWaterByReRoomId("FA23", 5);
        for (ElectricWaterUsed electricWaterUsed: result) {
            System.out.println(electricWaterUsed);
        }
    }
}
