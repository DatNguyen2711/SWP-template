/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Account;
import Models.Course;
import Models.Expert;
import Models.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class StudentServices {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Get list Experts of Account
    public ArrayList<Account> getListStudentsOfAccount() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from Account where role = 2";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Get list Student of Account for manage
    public ArrayList<Account> getListStudentsOfAccountForManage() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from Account where role = 2 or role = -2";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Get List Profile Students
    public ArrayList<Student> getListProfileStudents() {
        ArrayList<Student> listStudents = new ArrayList<>();
        String query = "select * from ProfileOfStudent";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String avatar = rs.getString(2);
                String description = rs.getString(3);
                Student student = new Student(username, avatar, description);
                listStudents.add(student);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listStudents;
    }

    // Get list of accounts
    public ArrayList<Account> getListAccounts() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "select * from Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                list.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    // Update Account of Student
    public void updateAccountOfStudent(String username, String fullname, int age, String address, String email, String phone) {
        String query = "Update Account set fullname=?,age=?,address=?,email=?, phone=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setInt(2, age);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Update Profile of Student
    public void updateProfileOfStudent(String username, String description) {
        String query = "Update ProfileOfStudent set description=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, description);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Change Account Password of Student
    public void changePasswordOfStudent(String username, String password) {
        String query = "Update Account set password=? where username=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Get Student account by username
    public Account getStudentByUsername(String username) {
        ArrayList<Account> getListAccounts = getListAccounts();
        for (Account account : getListAccounts) {
            if (account.getUsername().equals(username)) {
                return account;
            }
        }
        return null;
    }

    // Get Profile Student by username
    public Student getProfileStudentByUsername(String username) {
        ArrayList<Student> listProfileOfStudents = getListProfileStudents();
        for (Student student : listProfileOfStudents) {
            if (student.getUsername().equals(username)) {
                return student;
            }
        }
        return null;
    }

    // Get Avatar Student by username
    public String getAvatarStudentByUsername(String username) {
        ArrayList<Student> listProfileOfStudents = getListProfileStudents();
        for (Student student : listProfileOfStudents) {
            if (student.getUsername().equals(username)) {
                return student.getAvatar();
            }
        }
        return null;
    }

    // Get fullname of Expert
    public String getFullNameOfStudent(String username) {
        ArrayList<Account> listAccounts = getListAccounts();
        for (Account account : listAccounts) {
            if (username.equals(account.getUsername())) {
                return account.getFullname();
            }
        }
        return null;
    }

    // Lock Student
    public void managerLockStudent(String username, int role) {
        String query = "Update Account set role=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, -2);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Unlock Student
    public void managerUnlockStudent(String username, int role) {
        String query = "Update Account set role=? where username =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, 2);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Search Student by name and courseId
    public ArrayList<Account> getlistSearchStudents(String nameSearch, int courseId) {
        ArrayList<Account> listSearchStudents = new ArrayList<>();
        String query = "select * from Account a,EnrolledCourse e\n"
                + "	where a.username = e.username and a.username like ? and e.courseId = ? and (role=2 or role=-2)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            nameSearch = "%" + nameSearch + "%";
            ps.setString(1, nameSearch);
            ps.setInt(2, courseId);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                listSearchStudents.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSearchStudents;
    }

    // Search Student by name and courseId
    public ArrayList<Account> getlistSearchNameStudents(String nameSearch) {
        ArrayList<Account> listSearchStudents = new ArrayList<>();
        String query = "select * from Account a\n"
                + "where a.username like ? and (role=2 or role=-2)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            nameSearch = "%" + nameSearch + "%";
            ps.setString(1, nameSearch);
            rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                String password = rs.getString(2);
                String fullname = rs.getString(3);
                int age = rs.getInt(4);
                boolean gender = rs.getBoolean(5);
                String address = rs.getString(6);
                String email = rs.getString(7);
                String phone = rs.getString(8);
                int role = rs.getInt(9);
                float wallet = rs.getFloat(10);
                String lastAccess = rs.getString(11);

                Account a = new Account(username, password, fullname, age, gender, address, email, phone, role, wallet, lastAccess);
                listSearchStudents.add(a);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return listSearchStudents;
    }

    // main
    public static void main(String[] args) {
        StudentServices studentServices = new StudentServices();
//        ArrayList<Account> list = studentServices.getlistSearchStudents("", 1);
//        for (Account account : list) {
//            System.out.println(account.toString());
//        }
        LocalTime localTime = LocalTime.now();
        System.out.println(localTime);
    }

}
