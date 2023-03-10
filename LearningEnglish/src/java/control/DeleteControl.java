/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.CourseServices;
import DAO.LessionServices;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author 84877
 */
public class DeleteControl extends HttpServlet {
   
    CourseServices courseServices = new CourseServices();
    LessionServices lessionServices = new LessionServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        try {
            int id = Integer.parseInt(request.getParameter("courseId"));
            courseServices.deleteCourse(id);
            request.setAttribute("course", courseServices.getCourseByUsername(acc.getUsername()));
            request.setAttribute("category", courseServices.getCategory());
            request.getRequestDispatcher("/Views/manageCourse.jsp").forward(request, response);
        } catch (Exception e) {
        }
        
        try {
            int lessionId = Integer.parseInt(request.getParameter("lessionId"));
            lessionServices.deleteLession(lessionId);
            int courseId = Integer.parseInt(session.getAttribute("courseId").toString());
            request.setAttribute("lession", lessionServices.getAllLessionByCourseId(courseId));
            request.getRequestDispatcher("/Views/manageLession.jsp").forward(request, response);
        } catch (Exception e) {
        }
        
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
