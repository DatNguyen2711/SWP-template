/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.CourseServices;
import Models.Course;
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
public class SearchControl extends HttpServlet {
   
    CourseServices courseServices = new CourseServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchControl at " + request.getContextPath () + "</h1>");
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
//        String content = request.getParameter("content");
//        List<Course> list = courseServices.getCourseByUsername(content);
//        PrintWriter out = response.getWriter();
//
//        if(list.size() >= 1){
//            for (Course course : list) {
//                out.println("<p><a href="+"/LearningEnglish/courseDetail?courseId="+course.getCourseId()+">"+course.getNameCourse()+"</a></p>");
//            }
//        }else{
//            out.print("");
//        }
            String skill = request.getParameter("skill");

            if(skill == null)
                skill = "";
            int id = Integer.parseInt(request.getParameter("categoryId"));
            List<Course> list = courseServices.getListCourseByCategoryId(id, skill);
            
            String img = "";
            for (Course course : list) {
                img = course.getImage();
                if(!img.equals(""))
                    course.setImage(img.substring(1, img.length()));
            }
            request.setAttribute("categoryId", id);
            request.setAttribute("course", list);
            request.getRequestDispatcher("Views/course-archive.jsp").forward(request, response);
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
        String nameCourse = request.getParameter("search");
        List<Course> list = courseServices.getCourseByName(nameCourse);
        String img = "";
        for (Course course : list) {
            img = course.getImage();
            if(!img.equals(""))
                course.setImage(img.substring(1, img.length()));
        }
        request.setAttribute("course", list);
        request.getRequestDispatcher("Views/course-archive.jsp").forward(request, response);
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
