/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.ClassOnlineServices;
import DAO.ExpertServices;
import DAO.TimeTableServices;
import Models.ClassOnline;
import Models.RequestConfirm;
import Models.TimeTable;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author 84877
 */
public class ConfirmSetUpSchedule extends HttpServlet {
   
    ClassOnlineServices classOnlineServices = new ClassOnlineServices();
    TimeTableServices timeTableServices = new TimeTableServices();
    ExpertServices expertServices = new ExpertServices();
    ClassOnline classOnline;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmSetUpSchedule</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmSetUpSchedule at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int slot = Integer.parseInt(request.getParameter("slot"));
            int classId = Integer.parseInt(request.getParameter("classId"));
            String dayOfWeek = request.getParameter("dayOfWeek");
            
            classOnline = classOnlineServices.getClassOnlinesById(classId);
//            List<TimeTable> list = timeTableServices.getAllTimeTablesToConfirmByClassId(classId);
            
//            for (TimeTable timeTable : list) {
//                String dow = timeTableServices.getDayOfWeek(timeTable.getDateStudy());
//                if(slot == timeTable.getSlot() && dow.equals(dayOfWeek)){
//                    timeTableServices.updateStatusTimetable(timeTable.getId());
//                }
//            }
            timeTableServices.setStatusRequestConfirm(id);
            
            TimeTable timeTable;
            List<String> dayList = getDay(dayOfWeek);
            for (String string : dayList) {
                timeTable = new TimeTable();
                timeTable.setClassId(classId);
                timeTable.setSlot(slot);
                timeTable.setDateStudy(string);
                timeTableServices.insertTimeTable(timeTable);
            }
            
            List<ClassOnline> classList = classOnlineServices.getClassOnlinesNoLink();
            List<RequestConfirm> requestList = timeTableServices.getAllRequestConfirms();

            request.setAttribute("list", classList);
            request.setAttribute("expert", expertServices.getListExpertsOfAccount());
            request.setAttribute("request", requestList);

            request.getRequestDispatcher("/Views/manageTeacher.jsp").forward(request, response);
            
        } catch (Exception e) {
        }
    }

    
     public List<String> getDay(String a){
       SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
        String s = classOnline.getTimeStart();
        String e = classOnline.getTimeEnd();
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
    
    private Date findNextDay(Date date) {
        return new Date(date.getTime() + 1000 * 60 * 60 * 24);
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
