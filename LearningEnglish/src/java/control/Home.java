/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.ClassOnlineServices;
import DAO.CourseServices;
import DAO.ExpertServices;
import DAO.StudentServices;
import Models.Account;
import Models.Course;
import Models.Expert;
import Models.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author 84877
 */
public class Home extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Home</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Home at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        StudentServices studentServices = new StudentServices();
        ExpertServices expertServices = new ExpertServices();

        HttpSession session = request.getSession();

        Account account = (Account) session.getAttribute("account");

        if (account == null) {
            CourseServices courseServices = new CourseServices();
            request.setAttribute("course", courseServices.getListCourse());
            request.setAttribute("listProfileOfExperts", expertServices.getListProfileOfExperts());
            request.setAttribute("expertServices", expertServices);
        } else if (account.getRole() == 1) {
            Expert expert = expertServices.getProfileExpertByUsername(account.getUsername());
//            session.setAttribute("account", account);
//        request.setAttribute("student", student);
            request.setAttribute("profile", expert);

//            request.getRequestDispatcher("/Views/home.jsp").forward(request, response);
        } else if (account.getRole() == 2) {
            Student student = studentServices.getProfileStudentByUsername(account.getUsername());
            request.setAttribute("profile", student);
        }

//        Student student = studentServices.getProfileStudentByUsername(account.getUsername());
//        Expert expert = expertServices.getProfileExpertByUsername(account.getUsername());
//
//        session.setAttribute("account", account);
//        request.setAttribute("student", student);
//        request.setAttribute("expert", expert);
        CourseServices courseServices = new CourseServices();
        ClassOnlineServices classOnlineServices = new ClassOnlineServices();
        request.setAttribute("course", courseServices.getListCourse());
        request.setAttribute("classOnlines", classOnlineServices.getAllClassOnlines());
        request.setAttribute("listProfileOfExperts", expertServices.getListProfileOfExperts());
        request.setAttribute("expertServices", expertServices);

        request.getRequestDispatcher("/Views/home.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
