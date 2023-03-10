/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.ClassOnlineServices;
import Models.Account;
import Models.ClassOnline;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author 84877
 */
public class CreateClassOnline extends HttpServlet {
   
    ClassOnlineServices classOnlineServices = new ClassOnlineServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateClassOnline</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateClassOnline at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();
        try {
            
            Account acc = (Account) session.getAttribute("account");
            
            String nameClass = request.getParameter("nameClass");
            String timeStart = request.getParameter("timeStart");
            String timeEnd = request.getParameter("timeEnd");
//            String link = request.getParameter("link");
//            String status = getStatus(timeStart.split("-"));
            
            ClassOnline c = new ClassOnline();
            c.setUsername(acc.getUsername());
            c.setNameClass(nameClass);
            c.setTimeStart(timeStart);
            c.setTimeEnd(timeEnd);
//            c.setLink(link);
            c.setStatus("prepare");
            
            classOnlineServices.insertClassOnline(c);
            
            List<ClassOnline> list = classOnlineServices.getClassOnlinesByExpert(acc.getUsername());
            request.setAttribute("classOnline", list);
            request.getRequestDispatcher("/Views/manageClassOnline.jsp").forward(request, response);
            
        } catch (Exception e) {
        }
    }

    private String getStatus(String[] timeStart) {
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
    
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
