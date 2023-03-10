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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author 84877
 */
public class DeleteRequest extends HttpServlet {
   
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
            out.println("<title>Servlet DeleteRequest</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteRequest at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);

        try {
            int rId = Integer.parseInt(request.getParameter("rId"));
            timeTableServices.deleteRequestConfirm(rId);
        } catch (Exception e) {
        }

        try {
            int ruId = Integer.parseInt(request.getParameter("ruId"));
            timeTableServices.deleteRequestUpdateSchedule(ruId);
        } catch (Exception e) {
        }

        List<ClassOnline> list = classOnlineServices.getClassOnlinesNoLink();
        List<RequestConfirm> requestList = timeTableServices.getAllRequestConfirms();
        List<RequestUpdateSchedule> requestUpdateSchedules = timeTableServices.getAllRequestUpdate();
        
        List<TimeTable> timeTables = new ArrayList<>();
        for (RequestUpdateSchedule requestUpdateSchedule : requestUpdateSchedules) {
            timeTables.add(timeTableServices.getTimeTableById(requestUpdateSchedule.getId()));
        }
        
        request.setAttribute("timeTables", timeTables);
        request.setAttribute("list", list);
        request.setAttribute("expert", expertServices.getListExpertsOfAccount());
        request.setAttribute("request", requestList);
        request.setAttribute("requestUpdate", requestUpdateSchedules);
        request.getRequestDispatcher("/Views/manageTeacher.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
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
