
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Test {
    public static void main(String[] args) throws ParseException {
//        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
//        LocalDateTime now = LocalDateTime.now();
//        String t = "2023-02-29";
//        String sDate1="04/03/2023";  
//    Date date1=new SimpleDateFormat("dd/MM/yyyy").parse(sDate1); 
//    Calendar cal = Calendar.getInstance();
//    cal.setTime(date1);
//    System.out.println(cal.get(Calendar.DAY_OF_WEEK));
//        System.out.println(getStatus(t.split("-")));
//        String[] a = {"2", "5"};
//        List<String> list = getDay("2");
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i));
//        }
//        TimeTableServices timeTableServices = new TimeTableServices();
//        List<TimeTable> list = timeTableServices.getTimeTableByClassId(1);
//        String[] a = {"2023-03-06","2023-03-07", "2023-03-08","2023-03-09","2023-03-10", "2023-03-11", "2023-03-12"};
//        boolean check = false;
//        for (int i = 1; i < 7; i++) {
//            for (int j = 0; j < a.length; j++) {
//                for (TimeTable timeTable : list) {
//                    if(timeTable.getDateStudy().equals(a[j]) && timeTable.getSlot() == i){
//                        System.out.print("yes: "+timeTable.getDateStudy()+" "+timeTable.getSlot()+"| ");
//                        check = true;
//                        break;
//                    }else{
//                        check = false;
//                    }
//                }
//                if(!check){
//                    System.out.print(" no ");
//                }
//            }
//            System.out.println("");
//        }

        Date date1=new SimpleDateFormat("dd/MM/yyyy").parse("02/03/2023");  
        System.out.println(date1);
    }
    public static String getStatus(String[] timeStart) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
        LocalDateTime now = LocalDateTime.now();
        String[] date = dtf.format(now).split("-");
        if(date[0].compareTo(timeStart[0])==-1){
            return "prepare";
        }else{
            if(date[1].compareTo(timeStart[1])==-1){
                return "prepare";
            }else if(date[1].compareTo(timeStart[1])==1){
                return "on";
            }else{
                if(date[2].compareTo(timeStart[2])==-1){
                    return "prepare";
                }else if(date[1].compareTo(timeStart[1])==1){
                    return "on";
                }else{
                    return "on";
                }
            }
        }
    }
    
    public static List<String> getDay(String a){
       SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String s = "2023-03-01";
        String e = "2023-06-04";
        List<String> list = new ArrayList<>();
        Calendar cal = Calendar.getInstance();
        try {
            Date s1 = new SimpleDateFormat("yyyy-MM-dd").parse(s); 
            Date e1 = new SimpleDateFormat("yyyy-MM-dd").parse(e);
            Date t1 = s1;
            int x = Integer.parseInt(a);
            s1 = t1;
            while (e1.after(s1)) {                
                s1 = findNextDay(s1);
                cal.setTime(s1);
                if(cal.get(Calendar.DAY_OF_WEEK)==x){
                    list.add(dt.format(s1));
                }
            }
        return list;
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }
    
    private static Date findNextDay(Date date)
  {
    return new Date(date.getTime() + 1000 * 60 * 60 * 24);
  }
    
}
