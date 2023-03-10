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
import static org.apache.tomcat.jni.User.username;

/**
 *
 * @author 84877
 */
public class ClassOnlineDetail extends HttpServlet {
   
    ClassOnlineServices classOnlineServices = new ClassOnlineServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ClassOnlineDetail</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassOnlineDetail at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ClassOnline classOnline = classOnlineServices.getClassOnlinesById(id);
            HttpSession session = request.getSession();
            if(session.getAttribute("account") != null || (Account)session.getAttribute("account") != null){
                Account acc = (Account) session.getAttribute("account");
                request.setAttribute("isEnrolled", classOnlineServices.isEnrolledClassOnline(acc.getUsername(), id));
            }else{
                request.setAttribute("isEnrolled", false);
            }
            request.setAttribute("classOnline", classOnline);
            request.getRequestDispatcher("/Views/classOnlineDetail.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
