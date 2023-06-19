/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author MSI GL63
 */
public class DBContext {
    
    public static Connection getConnection() throws Exception{
        //String serverName = "HUNGPHAM";
        String serverName = "DESKTOP-8GT4QJG";
        //MSI_HAITHY\\TEW_SQLEXPRESS
        String databaseName= "SQL";
        String url = "jdbc:sqlserver://"+serverName+";databaseName="+databaseName+";encrypt=false";
        //url url = "jdbc:sqlserver://MSI_HAITHY\TEW_SQLEXPRESS:1433;databaseName=QL_STUDENT;
        String username = "p4t3";
        String password = "1234";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url,username,password);
    }     
    
}
