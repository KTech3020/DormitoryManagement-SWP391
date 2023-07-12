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
        String serverName = "K-LAPV2";
        String databaseName= "Dorm";
        String url = "jdbc:sqlserver://"+serverName+";databaseName="+databaseName+";encrypt=false";
        String username = "sa";
        String password = "123";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url,username,password);
    }     
    
}
