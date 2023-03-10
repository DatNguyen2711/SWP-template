
package DAO;

import Models.MultipleChoiceQuiz;
import Models.Quiz;
import java.io.File;
import java.io.FileInputStream;
import static java.nio.file.Files.list;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelServices {

    public void readExcel(String fileName){
        MultipleChoiceQuiz quiz;
        try {
            //fileName = "Book1.xlsx";
            File file = new File("..\\TestFontend\\build\\web\\excel\\"+fileName);   //creating a new file instance  
            FileInputStream fis = new FileInputStream(file);   //obtaining bytes from the file  
            //creating Workbook instance that refers to .xlsx file  
            XSSFWorkbook wb = new XSSFWorkbook(fis);
            XSSFSheet sheet = wb.getSheetAt(0);     //creating a Sheet object to retrieve object  
            Iterator<Row> itr = sheet.iterator();    //iterating over excel file  
            while (itr.hasNext()) {
                Row row = itr.next();
                Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    switch (cell.getCellType()) {
                        case Cell.CELL_TYPE_STRING:    //field that represents string cell type  
                            System.out.print(cell.getStringCellValue() + "\t\t\t");
                            break;
                        case Cell.CELL_TYPE_NUMERIC:    //field that represents number cell type  
                            System.out.print(cell.getNumericCellValue() + "\t\t\t");
                            break;
                        default:
                    }
                }
                System.out.println("");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
    
    public List<MultipleChoiceQuiz> readExcelEachRow(int lessionId, String path){
        
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
                String[] ans = new String[count-2];
                for (int i = 1; i < count-1; i++) {
                    ans[x++] = content[i];
                }
                list.add(new MultipleChoiceQuiz(lessionId, questionId++,content[0] , ans, content[count-1]));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    public static void main(String[] args) {
        ExcelServices ex = new ExcelServices();
        
//        ex.readExcel("Book1.xlsx");
//        System.out.println(ex.readExcelEachRow(1, 1).size());
    }
}
