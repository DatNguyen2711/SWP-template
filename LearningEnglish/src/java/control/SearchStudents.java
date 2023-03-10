/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import DAO.AccountServices;
import DAO.CourseServices;
import DAO.StudentServices;
import Models.Account;
import Models.Course;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Trung Nguyễn Bá
 */
public class SearchStudents extends HttpServlet {

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
            out.println("<title>Servlet SearchStudents</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchStudents at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        AccountServices accountServices = new AccountServices();
        StudentServices studentServices = new StudentServices();
        CourseServices courseServices = new CourseServices();

        String nameSearch = request.getParameter("nameSearch");
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        if (courseId == 0) {
            if (nameSearch != null) {
                List<Course> listCourses = courseServices.getListCourse();
                ArrayList<Account> listStudents = studentServices.getlistSearchNameStudents(nameSearch);

                session.setAttribute("courseId", courseId);

                session.setAttribute("nameSearch", nameSearch);
                request.setAttribute("listCourses", listCourses);
                request.setAttribute("listStudents", listStudents);
                request.setAttribute("studentServices", studentServices);
                session.setAttribute("account", account);

                request.getRequestDispatcher("Views/searchStudents.jsp").forward(request, response);
            }
            List<Course> listCourses = courseServices.getListCourse();
            response.sendRedirect("manageStudents");
        } else {
            List<Course> listCourses = courseServices.getListCourse();
            ArrayList<Account> listStudents = studentServices.getlistSearchStudents(nameSearch, courseId);

            session.setAttribute("courseId", courseId);

            session.setAttribute("nameSearch", nameSearch);
            request.setAttribute("listCourses", listCourses);
            request.setAttribute("listStudents", listStudents);
            request.setAttribute("studentServices", studentServices);
            session.setAttribute("account", account);

            request.getRequestDispatcher("Views/searchStudents.jsp").forward(request, response);
        }
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
