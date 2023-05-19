/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author MSI GL63
 */
public class DatabaseInfo {
    
    public static Connection getConnection() throws Exception{
        String serverName = "MSI_HAITHY\\TEW_SQLEXPRESS";
        //MSI_HAITHY\\TEW_SQLEXPRESS
        String databaseName= "Student";
        String url = "jdbc:sqlserver://"+serverName+";databaseName="+databaseName+";encrypt=false";
        //url url = "jdbc:sqlserver://MSI_HAITHY\TEW_SQLEXPRESS:1433;databaseName=QL_STUDENT;
        String username = "sa";
        String password = "Hthy1109@";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url,username,password);
    }     
    
}
