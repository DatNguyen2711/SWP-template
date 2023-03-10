/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.CourseServices;
import DAO.LessionServices;
import DAO.QuizServices;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class ViewLession extends HttpServlet {
   
    CourseServices courseServices = new CourseServices();
    LessionServices lessionServices = new LessionServices();
    QuizServices quizServices = new QuizServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewLession</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewLession at " + request.getContextPath () + "</h1>");
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
//        processRequest(request, response);
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            if(courseServices.isEnrolled(acc.getUsername(), courseId)){
//                Course course = courseServices.getCourseById(courseId);
                request.setAttribute("lession", lessionServices.getAllLessionByCourseId(courseId));
                request.setAttribute("quiz", quizServices.getAllQuiz());
                request.getRequestDispatcher("/Views/viewCourse.jsp").forward(request, response);
            }
        } catch (Exception e) {
            response.sendRedirect("home");
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
