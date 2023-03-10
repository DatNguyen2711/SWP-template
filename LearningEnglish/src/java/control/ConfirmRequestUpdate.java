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
public class ConfirmRequestUpdate extends HttpServlet {
   
    ClassOnlineServices classOnlineServices = new ClassOnlineServices();
    TimeTableServices timeTableServices = new TimeTableServices();
    ExpertServices expertServices = new ExpertServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConfirmRequestUpdate</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmRequestUpdate at " + request.getContextPath () + "</h1>");
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
            int id = Integer.parseInt(request.getParameter("id"));
            int slot = Integer.parseInt(request.getParameter("newSlot"));
            String date = request.getParameter("newDate");
            TimeTable timeTable = new TimeTable();
            timeTable.setId(id);
            timeTable.setDateStudy(date);
            timeTable.setSlot(slot);
            timeTableServices.editTimeTable(timeTable);
            timeTableServices.setStatusRequestUpdateSchedule(id);
        } catch (Exception e) {
        }


        List<ClassOnline> list = classOnlineServices.getClassOnlinesNoLink();
        List<RequestConfirm> requestList = timeTableServices.getAllRequestConfirms();
        List<RequestUpdateSchedule> requestUpdateSchedules = timeTableServices.getAllRequestUpdate();
        request.setAttribute("list", list);
        request.setAttribute("expert", expertServices.getListExpertsOfAccount());
        request.setAttribute("request", requestList);
        request.setAttribute("requestUpdate", requestUpdateSchedules);
        request.getRequestDispatcher("/Views/manageTeacher.jsp").forward(request, response);
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
