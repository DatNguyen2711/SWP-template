/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Account;
import Models.Category;
import Models.Course;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84877
 */
public class CourseServices {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean isEnrolled = false;
    
    // Get list Courses
    public List<Course> getListCourse(){
        List<Course> list = new ArrayList<>();
        String query = "select * from Course";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    
    public List<Course> getListCourseByCategoryId(int id, String skill){
        List<Course> list = new ArrayList<>();
        String query = "select * from Course where categoryId = ? and skill = ?";
        if(skill.equals(""))
            query = "select * from Course where categoryId = ?";
        
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            if(!skill.equals(""))
                ps.setString(2, skill);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    
    public List<Course> getCourseByUsername(String username){
        List<Course> list = new ArrayList<>();
        String query = "select * from Course where username = ? and status = 1";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    public List<Course> getCourseByName(String name){
        List<Course> list = new ArrayList<>();
        String query = "select * from Course where nameCourse like ? and status = 1";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%"+name+"%");
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new Course(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getInt(5),
                        rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(10)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    public void insertEnrollCourse(String username, int courseId){
        String query = "insert into EnrolledCourse values(?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setInt(2, courseId);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public boolean isEnrolled(String username, int courseId){
        String query = "select * from EnrolledCourse where courseId = ? and username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            ps.setString(2, username);
            rs = ps.executeQuery();
            if(rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return false;
    }
    
    public List<Course> getEnrolledCoursebyUsername(String username){
        List<Course> list = new ArrayList<>();
        List<Integer> courseIdList = new ArrayList<>();
        String query = "select * from EnrolledCourse where username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                courseIdList.add(rs.getInt(2));
            }
            for (Integer integer : courseIdList) {
                list.add(getCourseById(integer));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
        return list;
    }
    
    public void insertCourse(String username, String nameCourse, String title, int price, String description, int categoryId, String skill, String image){
        String query = "insert into Course(username, nameCourse, title, price, description, categoryId, skill, status, image) values(?,?,?,?,?,?,?,1,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, nameCourse);
            ps.setString(3, title);
            ps.setInt(4, price);
            ps.setString(5, description);
            ps.setInt(6, categoryId);
            ps.setString(7, skill);
            ps.setString(8, image);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public void editCourse(int id, String nameCourse, String title, int price, String description, int categoryId, String skill, String image){
        String query = "update Course set nameCourse = ?, title = ?, price = ?, description = ?, categoryId = ?, skill = ?, image = ? where courseId = ?";
        if(image.equals(""))
            query = "update Course set nameCourse = ?, title = ?, price = ?, description = ?, categoryId = ?, skill = ? where courseId = ?";
        
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, nameCourse);
            ps.setString(2, title);
            ps.setInt(3, price);
            ps.setString(4, description);
            ps.setInt(5, categoryId);
            ps.setString(6, skill);
            if(image.equals("")){
                ps.setInt(7, id);
            }else{
                ps.setString(7, image);
                ps.setInt(8, id);
            }
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void deleteCourse(int id){
        String query = "update Course set status = 0 where courseId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public Course getCourseById(int courseId){
        String query = "select * from Course where courseId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Course(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getString(8), rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public List<Category> getCategory(){
        List<Category> list = new ArrayList<>();
        String query = "select * from CategoryCourse";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs=ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    public static void main(String[] args) {
        CourseServices c = new CourseServices();
        for (Course course : c.getCourseByName("10")) {
            System.out.println(course);
        }
    }
}
