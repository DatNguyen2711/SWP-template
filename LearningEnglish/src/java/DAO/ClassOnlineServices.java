
package DAO;

import Models.ClassOnline;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ClassOnlineServices {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    
    public List<ClassOnline> getClassOnlinesByExpert(String username){
        List<ClassOnline> list = new ArrayList<>();
        
        String query = "select * from ClassOnline where Lecturer = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassOnline(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    public List<ClassOnline> getAllClassOnlines(){
        List<ClassOnline> list = new ArrayList<>();
        
        String query = "select * from ClassOnline where Status = 'on'";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassOnline(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    public List<String> getStudentByClassId(int classId){
        List<String> list = new ArrayList<>();
        String query = "select username from StudentsOnClass where classId = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, classId);
            rs=ps.executeQuery();
            while(rs.next()){
                list.add(rs.getString(1));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public boolean isEnrolledClassOnline(String username, int classId){
        String query = "select * from StudentsOnClass where classId = ? and username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, classId);
            ps.setString(2, username);
            rs=ps.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public void enrollClassOnline(String username, int classId){
        if(!isEnrolledClassOnline(username, classId)){
            String query = "insert into StudentsOnClass values(?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(2, classId);
            ps.setString(1, username);
            ps.execute();
        } catch (Exception e) {
        }
        }
    }
    
    public List<ClassOnline> getClassOnlinesNoLink(){
        List<ClassOnline> list = new ArrayList<>();
        
        String query = "select * from ClassOnline where Link = '' or Link is null";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new ClassOnline(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    
    public boolean isSetSchedule(int classId){
        String query = "select top 1 * from TimeTable where ClassId = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, classId);
            rs=ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return false;
    }
    
    public ClassOnline getClassOnlinesById(int classId){
        
        String query = "select * from ClassOnline where Id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, classId);
            rs=ps.executeQuery();
            while (rs.next()) {
                ClassOnline c = new ClassOnline(rs.getInt(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                return c;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return null;
        
    }
    
    public void insertClassOnline(ClassOnline classOnline){
        String query = "insert into ClassOnline(Lecturer, NameClass, TimeStart, TimeEnd, Link, Status) values(?,?,?,?,?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, classOnline.getUsername());
            ps.setString(2, classOnline.getNameClass());
            ps.setString(3, classOnline.getTimeStart());
            ps.setString(4, classOnline.getTimeEnd());
            ps.setString(5, classOnline.getLink());
            ps.setString(6, classOnline.getStatus());
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public void setLinkClassOnline(int id, String link){
        String query = "update ClassOnline set Link = ?, Status = 'on' where Id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, link);
            ps.setInt(2, id);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public void editClassOnline(ClassOnline classOnline){
        String query = "update ClassOnline set NameClass = ?, TimeStart = ?, TimeEnd = ?, Link = ? where Id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, classOnline.getNameClass());
            ps.setString(2, classOnline.getTimeStart());
            ps.setString(3, classOnline.getTimeEnd());
            ps.setString(4, classOnline.getLink());
            ps.setInt(5, classOnline.getId());
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public static void main(String[] args) {
        ClassOnlineServices classOnlineServices = new ClassOnlineServices();
//        ClassOnline c = new ClassOnline();
//        c.setUsername("admin");
//        c.setNameClass("Flash Classss");
//        c.setLink("https://meet.google.com/xnm-qpwq-fru");
//        c.setTimeStart("2023-05-14");
//        c.setTimeEnd("2023-07-14");
//        c.setStatus("prepare");
//        c.setId(2);
////        classOnlineServices.editClassOnline(c);
//        for (ClassOnline classOnline : classOnlineServices.getClassOnlinesNoLink()) {
//            System.out.println(classOnline);
//        }

        for (ClassOnline string : classOnlineServices.getAllClassOnlines()) {
            System.out.println(string);
        }
    }
    
}
