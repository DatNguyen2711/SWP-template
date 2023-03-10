/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Rating;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class RatingServices {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Part1: Comment for course
    // Get list ratings of course
    public ArrayList<Rating> getListRatingsOfCourse() {
        ArrayList<Rating> list = new ArrayList<>();
        String query = "select * from Rating where status = 0";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Leturer = rs.getString(1);
                String Student = rs.getString(2);
                int rate = rs.getInt(3);
                String comment = rs.getString(4);
                int courseId = rs.getInt(5);
                int status = rs.getInt(6);
                String timeComment = rs.getString(7);

                Rating r = new Rating(Leturer, Student, rate, comment, courseId, status, timeComment);
                list.add(r);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Get list ratings of course
    public ArrayList<Rating> getListRatingsStar() {
        ArrayList<Rating> list = new ArrayList<>();
        String query = "select * from Rating where status = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Leturer = rs.getString(1);
                String Student = rs.getString(2);
                int rate = rs.getInt(3);
                String comment = rs.getString(4);
                int courseId = rs.getInt(5);
                int status = rs.getInt(6);
                String timeComment = rs.getString(7);

                Rating r = new Rating(Leturer, Student, rate, comment, courseId, status, timeComment);
                list.add(r);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Get listRatings by courseID
    public ArrayList<Rating> getListsRatingsByCourseID(int courseID) {
        ArrayList<Rating> listRatingsOfCourse = getListRatingsOfCourse();
        ArrayList<Rating> listRatingsByCourseID = new ArrayList<>();
        for (Rating rating : listRatingsOfCourse) {
            if (rating.getCourseId() == courseID) {
                listRatingsByCourseID.add(rating);
            }
        }
        return listRatingsByCourseID;
    }

    // Get avg of ratings for course
    public double getAvgOfRatingsForCourse(int courseID) {
        double sum = 0;
        ArrayList<Rating> listRatingsByCourseID = getListsRatingsByCourseID(courseID);
        for (Rating rating : listRatingsByCourseID) {
            sum += rating.getRate();
        }
        return (sum / listRatingsByCourseID.size());
    }
    
    // Create new comment for course
    public void createCommentForCourse(String lecturer, String student, int rate, String comment, int courseId, int status) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();
        String query = "insert into Rating values(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, lecturer);
            ps.setString(2, student);
            ps.setInt(3, rate);
            ps.setString(4, comment);
            ps.setInt(5, courseId);
            ps.setInt(6, status);
            ps.setString(7, dtf.format(now));
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    // Count comments for course
    public int countCommentsOfCourse(int courseId) {
        int count = 0;
        String query = "select COUNT(*) from Rating where courseId=? and status=0";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return count;
    }

    // Check student have rated
    public boolean checkStudentRated(String Student, int status) {
        ArrayList<Rating> listRateStar = getListRatingsStar();
        for (Rating rating : listRateStar) {
            if (rating.getStudent().equals(Student) && status == 1) {
                return true;
            }
        }
        return false;
    }

    // Part2: Rating for course
    // Add rating
    public void addRating(String lecturer, String student, int rate, String comment, int courseId, int status) {
        // Student just rated
        if (checkStudentRated(student, status)) {
            String query = "Update Rating set rate=? where student =? and status=1";
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setInt(1, rate);
                ps.setString(2, student);
                ps.executeUpdate();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        } else {
            String query = "insert into Rating values(?,?,?,?,?,?)";
            try {
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setString(1, lecturer);
                ps.setString(2, student);
                ps.setInt(3, rate);
                ps.setString(4, "");
                ps.setInt(5, courseId);
                ps.setInt(6, 1);
                ps.execute();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }

    }

    // Get list rating of course by courseId
    public ArrayList<Rating> getRatingOfCourseByCourseId(int courseId) {
        ArrayList<Rating> list = new ArrayList<>();
        String query = "select * from Rating where courseId = ? and status = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Leturer = rs.getString(1);
                String Student = rs.getString(2);
                int rate = rs.getInt(3);
                String comment = rs.getString(4);
                courseId = rs.getInt(5);
                int status = rs.getInt(6);
                String timeComment = rs.getString(7);

                Rating r = new Rating(Leturer, Student, rate, comment, courseId, status, timeComment);
                list.add(r);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Get Average of rating star by courseId
    public double getAvgOfRatingStarByCourseId(int courseId) {
        double sum = 0;
        ArrayList<Rating> list = getRatingOfCourseByCourseId(courseId);
        for (Rating rating : list) {
            sum += rating.getRate();
        }
        return Double.parseDouble(String.format("%1$,.1f", (sum / list.size())));
    }

    // get rating by student name and courseId
    public ArrayList<Rating> getListRatingsByStudentNameAndCourseId(String student, int courseId) {
        ArrayList<Rating> list = new ArrayList<>();
        String query = "select * from Rating where courseId = ? and status = 0 and Student = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            ps.setString(2, student);
            rs = ps.executeQuery();
            while (rs.next()) {
                String Leturer = rs.getString(1);
                String Student = rs.getString(2);
                int rate = rs.getInt(3);
                String comment = rs.getString(4);
                courseId = rs.getInt(5);
                int status = rs.getInt(6);
                String timeComment = rs.getString(7);

                Rating r = new Rating(Leturer, Student, rate, comment, courseId, status, timeComment);
                list.add(r);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public static void main(String[] args) {
        RatingServices ratingServices = new RatingServices();
        //        System.out.println(ratingServices.countCommentsOfCourse(1));
        //        System.out.println(ratingServices.getAvgOfRatingStarByCourseId(1));
        ArrayList<Rating> list = ratingServices.getListRatingsByStudentNameAndCourseId("customer", 1);
        for (Rating rating : list) {
            System.out.println(rating.toString());
        }
    }
}
