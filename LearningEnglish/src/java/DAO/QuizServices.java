/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Models.MultipleChoiceQuiz;
import Models.Quiz;
import Models.Score;
import Models.Writting;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author 84877
 */
public class QuizServices {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public double score;
    
    public void insertQuiz(int lessionId, String nameQuiz, String path, String type, int duration){
        String query = "insert into Quiz(lessionId, nameQuiz, path, typeOfQuiz, duration) values(?,?,?,?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, lessionId);
            ps.setString(2, nameQuiz);
            ps.setString(3, path);
            ps.setString(4, type);
            ps.setInt(5, duration);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void insertWritting(int quizId, String username, String text){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
        LocalDateTime now = LocalDateTime.now();
        if(!getWrittingByQuizIdAndUsername(quizId, username).equals("")){
            updateWritting(quizId, username, text, dtf.format(now));
        }else{
            String query = "insert into Writting values(?,?,?,?)";
            try {
                conn=new DBContext().getConnection();
                ps = conn.prepareStatement(query);
                ps.setInt(1, quizId);
                ps.setString(2, username);
                ps.setString(3, text);
                ps.setString(4, dtf.format(now));
                ps.execute();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }
    
    
    public void updateWritting(int quizId, String username, String text, String date){
        String query = "update Writting set [content] = ?, dateTime = ? where quizId = ? and username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(3, quizId);
            ps.setString(4, username);
            ps.setString(1, text);
            ps.setString(2, date);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    public List<Writting> getWritting(int quizId){
        List<Writting> wrList = new ArrayList<>();
        String query = "select * from Writting where quizId = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizId);
            rs = ps.executeQuery();
            while(rs.next()){
                wrList.add(new Writting(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return wrList;
    }
    
    
    public void insertScore(int quizId, String username, double score){
        int time = GetTimeOfScore(quizId, username);
        String query = "insert into ScoreOfQuiz values(?,?,?,?)";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(2, quizId);
            ps.setString(1, username);
            ps.setDouble(3, score);
            ps.setInt(4, ++time);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public void updateScore(int quizId, String username, double score){
        String query = "update ScoreOfQuiz set score = ? where quizId = ? and username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(2, quizId);
            ps.setString(3, username);
            ps.setDouble(1, score);
            ps.execute();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    
    public double getScore(int quizId, String username){
        String query = "select score from ScoreOfQuiz where quizId = ? and username = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizId);
            ps.setString(2, username);
            rs = ps.executeQuery();
            if(rs.next())
                return rs.getDouble(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }
    
    public int GetTimeOfScore(int quizId, String username) {
        String query = "select top(1) time from ScoreOfQuiz where quizId = ? and username = ? order by time desc";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizId);
            ps.setString(2, username);
            rs = ps.executeQuery();
            if(rs.next())
                return rs.getInt(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }
    
    public List<Score> getScoreByUsername(String username, int quizId){
        List<Score> list = new ArrayList<>();
        DecimalFormat df = new DecimalFormat("#.###");
        String query = "select * from ScoreOfQuiz where username = ? and quizId = ? order by time";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setInt(2, quizId);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Score(rs.getString(1), rs.getInt(2), Double.parseDouble(df.format(rs.getDouble(3))), rs.getInt(4)));  
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
        
    }
    
    
    public List<Quiz> getAllQuiz(){
        List<Quiz> list = new ArrayList<>();
        String query = "select * from Quiz";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public List<Quiz> getAllQuizByLessionId(int lessionId){
        List<Quiz> list = new ArrayList<>();
        String query = "select * from Quiz where lessionId = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, lessionId);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6)));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
    
    public Quiz getQuizById(int quizId){
//        List<Quiz> list = new ArrayList<>();
        String query = "select * from Quiz where quizId = ?";
        
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizId);
            rs=ps.executeQuery();
            while (rs.next()) {
                return new Quiz(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),rs.getString(5), rs.getInt(6));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } 
        return null;
    }
   
    
    
    public void modifyData(String[] content, int rowNum, String path, boolean InsertOrUpdate){
        File xlsxFile = new File(path);

        try {
            //Creating input stream
            FileInputStream fis = new FileInputStream(xlsxFile);
             
            //Creating workbook from input stream
            Workbook workbook = WorkbookFactory.create(fis);
 
            //Reading first sheet of excel file
            Sheet sheet = workbook.getSheetAt(0);
            Row row;
            if(InsertOrUpdate){
                int rowCount = sheet.getLastRowNum();
                row = sheet.createRow(++rowCount);
            }else{
                row = sheet.getRow(rowNum);
            }
            if(content.length <= 1){
                Cell cell = row.getCell(0);
                cell.setCellValue(content[0]);
            }else{
                for (int i = 0; i < content.length-2; i++) {
                    Cell cell = row.createCell(i);
                    cell.setCellValue(content[i]);
                }
            }

            //Close input stream
            fis.close();
 
            //Crating output stream and writing the updated workbook
            FileOutputStream os = new FileOutputStream(xlsxFile);
            workbook.write(os);
             
            //Close the workbook and output stream
            workbook.close();
            os.close();
             
            System.out.println("Excel file has been updated successfully.");
             
        } catch (EncryptedDocumentException | IOException e) {
            System.err.println("Exception while updating an existing excel file.");
            e.printStackTrace();
        } catch (InvalidFormatException ex) {
            Logger.getLogger(QuizServices.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void writeDataInExcel(String[] question, String[] answer, String[] correctAns, String[] number, String path){
        try {
            File file = new File(path);  
            FileInputStream fis = new FileInputStream(file);
            XSSFWorkbook wb = (XSSFWorkbook) WorkbookFactory.create(fis);
            XSSFSheet sheet = wb.getSheetAt(0); 
            System.out.println(sheet.getLastRowNum());
            int rownum = 0, cellnum, from = 0, to = 0;

            for (int i = 0; i < question.length; i++)
            {
                Row row = sheet.createRow(rownum++);
                cellnum = 1;
                Cell cell0 = row.createCell(0);
                cell0.setCellValue(question[i]);

                if(i == 0)
                    to = Integer.parseInt(number[i]);
                else{
                    from = Integer.parseInt(number[i]);
                    to += Integer.parseInt(number[i]);
                }

                for (int j = from; j < to; j++)
                {
                    Cell cell = row.createCell(cellnum++);
                    cell.setCellValue(answer[i]);
                }

                Cell cell2 = row.createCell(cellnum);
                cell2.setCellValue(correctAns[i]);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
   
    public List<MultipleChoiceQuiz> readExcelEachRow(int lessionId, String path, String type){
        List<MultipleChoiceQuiz> list = new ArrayList<>();
        String[] content = new String[10];
        int count, questionId = 1, x;
        
        try {
            File file = new File(path);  
            FileInputStream fis = new FileInputStream(file);
            XSSFWorkbook wb = new XSSFWorkbook(fis);
            XSSFSheet sheet = wb.getSheetAt(0);      
            Iterator<Row> itr = sheet.iterator();    //iterating over excel file  
            while (itr.hasNext()) {
                count = 0;x = 0;
                Row row = itr.next();
                Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    switch (cell.getCellType()) {
                        case Cell.CELL_TYPE_STRING:    //field that represents string cell type  
                            content[count++] = cell.getStringCellValue();
                            //System.out.print(cell.getStringCellValue() + "\t\t\t");
                            break;
                        case Cell.CELL_TYPE_NUMERIC:    //field that represents number cell type  
                            System.out.print(cell.getNumericCellValue() + "\t\t\t");
                            break;
                        default:
                    }                 
                }
                String[] ans = {};
                if(type.equals("reading") && questionId == 1)
                    list.add(new MultipleChoiceQuiz(lessionId, questionId++,content[0] , ans, ""));
                else{
                    ans = new String[count-2];
                    for (int i = 1; i < count-1; i++) {
                        ans[x++] = content[i];
                    }
                    list.add(new MultipleChoiceQuiz(lessionId, questionId++,content[0] , ans, content[count-1]));
                }    
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    } 
    
    
    public void updateWritting(int quizId, String content) {
        String query = "update Quiz set path = ? where quizId = ?";
        
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, content);
            ps.setInt(2, quizId);
            ps.execute();
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    public static void main(String[] args) {
        QuizServices quizServices = new QuizServices();
//        Quiz q = quizServices.getQuizById(1);
        String cont = "1my name is A///5ansBererer///3dsfs///4dsfs///1";
        String[] content = cont.split("///");
        int count = 0, size = content.length-1, countAns = 0;
        System.out.println(quizServices.getScore(1020, "customerss")==-1);
    }

    public String getWrittingByQuizIdAndUsername(int quizId, String username) {
        String query = "select [content] from Writting where quizId = ? and username = ?";
        try {
            conn=new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, quizId);
            ps.setString(2, username);
            rs = ps.executeQuery();
            if(rs.next())
                return rs.getString(1);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "";
    }

    

    

    
}
