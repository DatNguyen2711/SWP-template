/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.CourseServices;
import Models.Account;
import Models.Course;
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
public class CourseDetailsControl extends HttpServlet {
   
    CourseServices courseServices = new CourseServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CourseDetailsControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CourseDetailsControl at " + request.getContextPath () + "</h1>");
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
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        Course course = courseServices.getCourseById(courseId);
        course.setImage(course.getImage().substring(1, course.getImage().length()));
        List<Course> list = courseServices.getListCourseByCategoryId(course.getCategoryId(), course.getSkill());
        String img = "";
        for (Course c : list) {
            img = c.getImage();
            if(!img.equals(""))
                c.setImage(img.substring(1, img.length()));
        }
        request.setAttribute("course", course);
        request.setAttribute("isEnrolled", courseServices.isEnrolled(acc.getUsername(), courseId));
        request.setAttribute("list", list);
        request.getRequestDispatcher("/Views/courseDetail.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        try {
            String courseId = request.getParameter("courseId");
            Account acc = (Account) session.getAttribute("account");
            Course course = courseServices.getCourseById(Integer.parseInt(courseId));
            request.setAttribute("course", course);
            request.setAttribute("isEnroll", courseServices.isEnrolled(acc.getUsername(), Integer.parseInt(courseId)));
            request.getRequestDispatcher("/Views/courseDetail.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("/LearningEnglish/home").forward(request, response);
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
