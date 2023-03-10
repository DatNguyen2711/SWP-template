/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.ClassOnlineServices;
import DAO.TimeTableServices;
import Models.ClassOnline;
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
import java.util.Date;
import java.util.List;

/**
 *
 * @author 84877
 */
public class TimeTableControl extends HttpServlet {
   
    TimeTableServices timeTableServices = new TimeTableServices();
    ClassOnlineServices classOnlineServices = new ClassOnlineServices();
    int classId, count = 0;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TimeTableControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TimeTableControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        classId = Integer.parseInt(request.getParameter("classId"));
        List<TimeTable> list = timeTableServices.getTimeTableByClassId(classId);
        ClassOnline classOnline = classOnlineServices.getClassOnlinesById(classId);
        request.setAttribute("week", timeTableServices.getWeekList(classOnline.getTimeStart(), classOnline.getTimeEnd()));
        request.setAttribute("timeTable", list);
        request.setAttribute("classId", classId);
        request.setAttribute("timeTableServices", timeTableServices);
        request.getRequestDispatcher("/Views/timeTable.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        //ClassOnline classOnline = classOnlineServices.getClassOnlinesById(classId);
        try {
            String[] result = request.getParameter("result").split("///");
            String[] date = result[0].split(" to ");
            String startDate = result[1]+"-"+date[0].split("/")[1]+"-"+date[0].split("/")[0];
            String endDate = result[1]+"-"+date[1].split("/")[1]+"-"+date[1].split("/")[0];
            
            Date s = new SimpleDateFormat("yyyy-MM-dd").parse(startDate);
            Date e = new SimpleDateFormat("yyyy-MM-dd").parse(endDate);
            
            List<TimeTable> tempTables = new ArrayList<>();
            List<TimeTable> list = timeTableServices.getTimeTableByClassId(classId);
            while (findNextDay(e).after(s) || count == 7) {                
                for (TimeTable timeTable : list) {
                    Date d = new SimpleDateFormat("yyyy-MM-dd").parse(timeTable.getDateStudy());
                    if(s.equals(d)){
                        tempTables.add(timeTable);
                    }
                }
                s = findNextDay(s);
                count++;
            }
            String[] dayOfWeek = {"2","3","4","5","6","7","1"};
            boolean check = false;
            for (int i = 1; i < 7; i++) {
                for (int j = 0; j < 7; j++) {
                    for (TimeTable t : tempTables) {
                        if(t.getSlot()==i && timeTableServices.getDayOfWeek(t.getDateStudy()).equals(dayOfWeek[j])){
                            ClassOnline c = classOnlineServices.getClassOnlinesById(t.getClassId());
                            out.println("<div class='accent-purple-gradient'>"
                                    + "<p style='font-size:15px;font-weight:600' class='class-name'>"+c.getNameClass()+"</p>"
                                    + "<a class='class-link' href="+c.getLink()+">Go to Class</a></br>"
                                            + "<button style='padding :7px 17px;width:100%;border-radius:50px;margin-left:-3px;background:cyan;border:none;' type=\"button\"  onclick='GetIdTimeTable("+t.getId()+")' data-toggle=\"modal\" data-target=\"#myModal\">Move</button>"
                                    + "</div>");
                            check = true;
                            break;
                        }else{
                            check = false;
                        }
                    }
                    if(!check){
                        out.println("<div></div>");
                    }
                }
            }
            
            
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
        }
        
        
        
    }

    private static Date findNextDay(Date date) {
        return new Date(date.getTime() + 1000 * 60 * 60 * 24);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
