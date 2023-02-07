/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84877
 */
public class AccountServices {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
   public Account getAccountByUsername(String username){

        String query = "select * from Account where username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs=ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1), 
                        rs.getString(2), rs.getString(3), rs.getInt(4),
                        rs.getBoolean(5), rs.getString(6), rs.getString(7),
                        rs.getString(8), rs.getInt(9));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return null;
   }
   
   public void resetPassword(String username, String newPassword){
       String query = "update Account set password = ? where username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
   }
   
   public void insertAccount(String username, String password, String fullName, int age, boolean  gender, String address, String email, String phone, int role){
       String query = "insert into Account values(?,?,?,?,?,?,?,?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullName);
            ps.setInt(4, age);
            ps.setBoolean(5, gender);
            ps.setString(6, address);
            ps.setString(7, email);
            ps.setString(8, phone);
            ps.setInt(9, role);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
   }
   
    public boolean verifyPassword(String password){
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
        return password.matches(regex);
    }
   
    public static void main(String[] args) {
        AccountServices accountServices = new AccountServices();
//        System.out.println(accountServices.getAccountByUsername("admin"));
//        accountServices.resetPassword("admin", "qqq");
//        System.out.println(accountServices.getAccountByUsername("admin"));
//        accountServices.insertAccount("admin1", "2222", "vv", 44, true, "vvvbb", "ttrf", "3333", 0);
//        System.out.println(accountServices.getAccountByUsername("admin1"));
        System.out.println(accountServices.verifyPassword("adacCX0893829@@"));
        
    }
}
