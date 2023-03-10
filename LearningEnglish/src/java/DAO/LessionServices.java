
package DAO;

import Models.Lession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class LessionServices {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Lession> getAllLessionByCourseId(int courseId){
        List<Lession> list = new ArrayList<>();
        String query = "select * from Lession where courseId = ? and status = 1 order by stt";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Lession(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public void insertLession(int courseId,String nameLession, String path, int stt){
        String query = "insert into Lession(courseId, nameLession, path, stt, status) values(?,?,?,?,1)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            ps.setString(2, nameLession);
            ps.setString(3, path);
            ps.setInt(4, stt);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public Lession getLessionById(int lessionId){
        String query = "select * from Lession where lessionId = ? and status = 1";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, lessionId);
            rs = ps.executeQuery();
            while(rs.next()){
                return new Lession(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    
    public void editLession(int lessionId, int courseId, String nameLession, String path, int stt){
        String query = "update Lession set courseId = ?, nameLession = ?, path = ?, stt = ? where lessionId = ?";
        if(path.equals(""))
            query = "update Lession set courseId = ?, nameLession = ?, stt = ? where lessionId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, courseId);
            ps.setString(2, nameLession);
            if(!path.equals("")){
                ps.setString(3, path);
                ps.setInt(4, stt);
                ps.setInt(5, lessionId);
            }else{
                ps.setInt(3, stt);
                ps.setInt(4, lessionId);
            }
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void deleteLession(int lessionId){
        String query = "Update Lession set status = 0 where lessionId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, lessionId);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void updateStt(int lessionId, int stt){
        String query = "update Lession set stt = ? where lessionId = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, stt);
            ps.setInt(2, lessionId);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
//    public void updateStt2(List<Lession> list, int stt, int lessionId){
//        int count = 0;
//        for (Lession lession : list) {
//            if(lession.getStt() >= stt && lession.getLessionId() != lessionId){
//                count = lession.getStt()+1;
//                updateStt(lession.getLessionId(), count);
//            }
//        }
//    }
    
    
    
    public static void main(String[] args) {
        LessionServices lessionServices = new LessionServices();
//        for (Lession lession : lessionServices.getAllLessionByCourseId(1)) {
//            System.out.println(lession);
//        }
//        lessionServices.updateStt(5, 1);
//        lessionServices.insertLession(1, "dvbb", "mmmm.mp4", 6);
//        System.out.println(lessionServices.getLessionById(1));
        lessionServices.editLession(1026, 1, "empty", "", 3);
    }
}
