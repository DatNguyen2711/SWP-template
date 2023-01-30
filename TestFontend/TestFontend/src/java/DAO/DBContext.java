/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author 84877
 */
public class DBContext {

    public Connection getConnection() throws Exception{
        
        if(instance == null || instance.trim().isEmpty()){
            url = "jdbc:sqlserver://"+serverName+":"+portNumber+";databaseName="+dbName;
        }
        else{
             url = "jdbc:sqlserver://"+serverName+":"+portNumber+"\\"+instance+";databaseName="+dbName;
        }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        
        return DriverManager.getConnection(url,username,password);
    }
        String instance = "";
        String serverName = "LAPTOP-KCTPGL4O";
        String portNumber = "1433";
        String dbName = "SWP391";
        String username = "sa";
        String password = "123456";
        String url;
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnection());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
}
