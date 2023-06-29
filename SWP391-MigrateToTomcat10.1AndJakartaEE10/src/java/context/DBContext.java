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
        String serverName = "DESKTOP-8GT4QJG";
        String databaseName= "Dorm";
        String url = "jdbc:sqlserver://"+serverName+";databaseName="+databaseName+";encrypt=false";
        String username = "p4t3";
        String password = "1234";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url,username,password);
    }         
}
//mở folder git
