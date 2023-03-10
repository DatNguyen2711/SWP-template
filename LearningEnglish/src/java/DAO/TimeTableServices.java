/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.Account;
import Models.ClassOnline;
import Models.RequestConfirm;
import Models.RequestUpdateSchedule;
import Models.TimeTable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


public class TimeTableServices {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    //time table in DB
    public void insertTimeTable(TimeTable timeTable){
        String query = "insert into TimeTable(ClassId, DateStudy, Slot, status) values(?,?,?,1)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, timeTable.getClassId());
            ps.setString(2, timeTable.getDateStudy());
            ps.setInt(3, timeTable.getSlot());
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    
    public void editTimeTable(TimeTable timeTable){
        String query = "update TimeTable set DateStudy = ?, Slot = ? where Id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, timeTable.getDateStudy());
            ps.setInt(2, timeTable.getSlot());
            ps.setInt(3, timeTable.getId());
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public TimeTable getTimeTableById(int id){
        String query = "select * from TimeTable where Id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if(rs.next()){
                return new TimeTable(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getInt(4), rs.getBoolean(5));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return null;
    }
    
    
    public void insertRequestUpdateSchedule(RequestUpdateSchedule requestConfirm){
        String query = "insert into RequestUpdateSchedule(id, newDate, newSlot, classId, status) values(?,?,?,?,0)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, requestConfirm.getId());
            ps.setString(2, requestConfirm.getNewDate());
            ps.setInt(3, requestConfirm.getNewSlot());
            ps.setInt(4, requestConfirm.getClassId());
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    
    public void setStatusRequestUpdateSchedule(int id){
        String query = "update RequestUpdateSchedule set status = 1 where id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public void deleteRequestUpdateSchedule(int id){
        String query = "delete from RequestUpdateSchedule where id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    
    public List<RequestUpdateSchedule> getAllRequestUpdate(){
        String query = "select * from RequestUpdateSchedule where status = 0";
        List<RequestUpdateSchedule> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                list.add(new RequestUpdateSchedule(rs.getInt(1), 
                rs.getString(2), rs.getInt(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    public void insertConfirmRequest(RequestConfirm requestConfirm){
        String query = "insert into RequestConfirm(classId, dayOfWeek, slot, isUpdate) values(?,?,?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, requestConfirm.getClassId());
            ps.setString(2, requestConfirm.getDayOfWeek());
            ps.setInt(3, requestConfirm.getSlot());
            ps.setBoolean(4, requestConfirm.isIsUpdate());
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public void setStatusRequestConfirm(int id){
        String query = "update RequestConfirm set isUpdate = 1 where id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public void deleteRequestConfirm(int id){
        String query = "delete from RequestConfirm where id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    
    
    public RequestConfirm checkExistRequestConfirm(int classId){
        String query = "select count(id), dayOfWeek, slot from RequestConfirm where classId = ?\n" +
        "group by dayOfWeek, slot\n" +
        "having count(id) >= 2";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, classId);
            rs = ps.executeQuery();
            
            if(rs.next()) {                
                RequestConfirm requestConfirm = new RequestConfirm();
                String dayOfWeek = rs.getString(2);
                switch (dayOfWeek) {
                    case "1":
                        dayOfWeek = "Sunday";
                        break;
                    case "7":
                        dayOfWeek = "Saturday";
                        break;
                    case "2":
                        dayOfWeek = "Monday";
                        break;
                    case "3":
                        dayOfWeek = "Tuesday";
                        break;
                    case "4":
                        dayOfWeek = "Wednesday";
                        break;
                    case "5":
                        dayOfWeek = "Thursday";
                        break;
                    case "6":
                        dayOfWeek = "Friday";
                        break;
                }
                
                requestConfirm.setDayOfWeek(dayOfWeek);
                requestConfirm.setSlot(rs.getInt(3));
                return requestConfirm;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<RequestConfirm> getAllRequestConfirms(){
        String query = "select * from RequestConfirm where isUpdate = 0 order by id";
        List<RequestConfirm> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            
            while (rs.next()) {                
                list.add(new RequestConfirm(rs.getInt(1), rs.getInt(2), 
                rs.getString(3), rs.getInt(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    
    public List<TimeTable> getAllTimeTablesToConfirmByClassId(int classId){
        String query = "select * from TimeTable where ClassId = ? and status = 0";
        List<TimeTable> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, classId);
            rs = ps.executeQuery();
            
            while(rs.next()) {                
                list.add(new TimeTable(rs.getInt(1),rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void updateStatusTimetable(int id){
        String query = "update TimeTable set status = 1 where id = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
    }
    
    public List<TimeTable> getTimeTablesByUsername(String username){
        String query = "select t.* from TimeTable t join ClassOnline c on t.ClassId = c.Id\n" +
        "where c.Lecturer = ? and t.status = 1 and c.Status = 'on'";
        
        AccountServices accountServices = new AccountServices();
        Account acc = accountServices.getAccountByUsername(username);
        
        if(acc.getRole()==2){
            query = "select t.* from TimeTable t join StudentsOnClass s on t.ClassId = s.ClassId\n" +
            "where s.username = ? and t.status = 1";
        }
        
        List<TimeTable> list = new ArrayList<>();
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {                
                list.add(new TimeTable(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
        
    }
    
    
    public List<String> getStudentOverlappingSchedule(RequestUpdateSchedule requestUpdateSchedule){
        String query = "select * from StudentsOnClass \n" +
        "where ClassId in (select distinct(ClassId) from TimeTable\n" +
        "where dateStudy = ? and slot = ? and classId <> ?)\n" +
        "and username in (select username from StudentsOnClass \n" +
        "where ClassId = ?)";
        ClassOnlineServices classOnlineServices = new ClassOnlineServices();
        AccountServices accountServices = new AccountServices();
        List<String> list = new ArrayList<>();
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, requestUpdateSchedule.getNewDate());
            ps.setInt(2, requestUpdateSchedule.getNewSlot());
            ps.setInt(3, requestUpdateSchedule.getClassId());
            ps.setInt(4, requestUpdateSchedule.getClassId());
            rs = ps.executeQuery();
            String mess = "";
            while (rs.next()) {       
//                list.add(rs.getString(1)+"///"+rs.getInt(2));
                ClassOnline c = classOnlineServices.getClassOnlinesById(rs.getInt(2));
                Account acc = accountServices.getAccountByUsername(rs.getString(1));
                mess = "Student name: " + acc.getFullname() + " had a class "+ c.getNameClass();
                list.add(mess);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
        
    
    public List<String> getWeekList(String timeStart, String timeEnd){
        List<String> weekList = new ArrayList<>();
        try {
            Date s = new SimpleDateFormat("yyyy-MM-dd").parse(timeStart);
            Date e = new SimpleDateFormat("yyyy-MM-dd").parse(timeEnd);
            Date start = s;
            Calendar cal = Calendar.getInstance();
            int a = 0;
            DateFormat df = new SimpleDateFormat("dd/MM"); 
            while (findNextDay(e).after(s)) {                
                cal.setTime(s);
                a = cal.get(Calendar.DAY_OF_WEEK);
                if(a == 1){
                    weekList.add(df.format(start)+" to "+df.format(s));
                    s = findNextDay(s);
                    start = s;
                }else{
                    s = findNextDay(s);
                }
            }
            
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
        }
        return weekList;
    }
    
    private Date findNextDay(Date date)
    {
        return new Date(date.getTime() + 1000 * 60 * 60 * 24);
    }
    
    
    public String getDayOfWeek(String date){
        try { 
            Date s = new SimpleDateFormat("yyyy-MM-dd").parse(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(s);
            int a = cal.get(Calendar.DAY_OF_WEEK);
            
            return a+"";
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
        }
        return "";
    }
    
    public List<TimeTable> getTimeTableByClassId(int classId){
        List<TimeTable> list = new ArrayList<>();
        String query = "select * from TimeTable where classId = ? and status = 1";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, classId);
            rs = ps.executeQuery();
            while (rs.next()) {                
                list.add(new TimeTable(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return list;
    }
    
    public static void main(String[] args) {
        TimeTableServices timeTableServices = new TimeTableServices();
//        ClassOnlineServices classOnlineServices = new ClassOnlineServices();
//        ClassOnline classOnline = classOnlineServices.getClassOnlinesById(1);
//        for (String x : timeTableServices.getWeekList(classOnline)) {
//            System.out.println(x);
//        }
        RequestUpdateSchedule requestUpdateSchedule = new  RequestUpdateSchedule();
        requestUpdateSchedule.setClassId(1);
        requestUpdateSchedule.setNewDate("2023-03-06");
        requestUpdateSchedule.setNewSlot(5);
        for (String s : timeTableServices.getStudentOverlappingSchedule(requestUpdateSchedule)) {
            System.out.println(s);
        }
    }
}
