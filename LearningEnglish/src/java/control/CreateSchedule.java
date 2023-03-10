/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.ClassOnlineServices;
import DAO.TimeTableServices;
import Models.Account;
import Models.ClassOnline;
import Models.RequestConfirm;
import Models.TimeTable;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
public class CreateSchedule extends HttpServlet {
   
    ClassOnlineServices classOnlineServices = new ClassOnlineServices();
    TimeTableServices timeTableServices = new TimeTableServices();
    ClassOnline classOnline;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateSchedule</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateSchedule at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        try {
            
            String[] days = request.getParameterValues("dayOfweek");
            String[] slot = request.getParameterValues("slot");
            int classId = Integer.parseInt(request.getParameter("classId"));
            classOnline = classOnlineServices.getClassOnlinesById(classId);
            String mess = classId+": ";
            TimeTable timeTable;
            RequestConfirm requestConfirm;
            
            for (int i = 0; i < slot.length; i++) {
                requestConfirm = new RequestConfirm();
                requestConfirm.setClassId(classId);
                requestConfirm.setDayOfWeek(days[0]);
                requestConfirm.setSlot(Integer.parseInt(slot[i]));
                requestConfirm.setIsUpdate(false);
                timeTableServices.insertConfirmRequest(requestConfirm);
            }
            
//            for (int i = 0; i < days.length; i++) {
//                List<String> dayList = getDay(days[i]);
//                for (String string : dayList) {
//                    for (int j = 0; j < slot.length; j++) {
//                        mess += days[i]+" "+slot[j]+"///";
//                        timeTable = new TimeTable();
//                        timeTable.setClassId(classId);
//                        timeTable.setSlot(Integer.parseInt(slot[j]));
//                        timeTable.setDateStudy(string);
//                        timeTableServices.insertTimeTable(timeTable);
//                        
//                    }
//                }
//            }
            request.setAttribute("mess", mess);
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            List<ClassOnline> list = classOnlineServices.getClassOnlinesByExpert(acc.getUsername());
            request.setAttribute("classOnline", list);
            request.getRequestDispatcher("/Views/manageClassOnline.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
