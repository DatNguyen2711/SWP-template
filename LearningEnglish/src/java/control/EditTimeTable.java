/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.ClassOnlineServices;
import DAO.TimeTableServices;
import Models.ClassOnline;
import Models.RequestConfirm;
import Models.RequestUpdateSchedule;
import Models.TimeTable;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author 84877
 */
public class EditTimeTable extends HttpServlet {
   
    TimeTableServices timeTableServices = new TimeTableServices();
    ClassOnlineServices classOnlineServices = new ClassOnlineServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditTimeTable</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditTimeTable at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
            int classId = Integer.parseInt(request.getParameter("classId"));
            List<TimeTable> list = timeTableServices.getTimeTableByClassId(classId);
            int id = Integer.parseInt(request.getParameter("id"));
            String date = request.getParameter("date");
            int slot = Integer.parseInt(request.getParameter("slot"));
            
            String mess = "";
//            TimeTable timeTable = new TimeTable();
//            timeTable.setId(id);
//            timeTable.setDateStudy(date);
//            timeTable.setSlot(slot);

            RequestUpdateSchedule rus = new RequestUpdateSchedule();
            
            for (TimeTable t : list) {
                if(t.getDateStudy().equals(date) && t.getSlot() == slot){
                    mess = "there is exist a class at "+t.getDateStudy()+" and slot "+t.getSlot();
                    break;
                }
            }
            
            if(mess.equals("")){
                mess = "waiting to confirm";
                rus.setId(id);
                rus.setNewDate(date);
                rus.setNewSlot(slot);
                rus.setClassId(classId);
                timeTableServices.insertRequestUpdateSchedule(rus);
            }
            
            
            request.setAttribute("mess", mess);
            ClassOnline classOnline = classOnlineServices.getClassOnlinesById(classId);
            request.setAttribute("week", timeTableServices.getWeekList(classOnline.getTimeStart(), classOnline.getTimeEnd()));
            request.setAttribute("timeTable", list);
            request.setAttribute("classId", classId);
            request.setAttribute("timeTableServices", timeTableServices);
            request.getRequestDispatcher("/Views/timeTable.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
