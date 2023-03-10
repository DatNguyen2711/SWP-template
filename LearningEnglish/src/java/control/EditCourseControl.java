/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.CourseServices;
import Models.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 100 // 100 MB
)
public class EditCourseControl extends HttpServlet {
   
    CourseServices courseServices = new CourseServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditCourseControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditCourseControl at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        try {
            int courseId = Integer.parseInt(request.getParameter("courseId"));
            request.setAttribute("category", courseServices.getCategory());
            request.setAttribute("course", courseServices.getCourseById(courseId));
            request.getRequestDispatcher("/Views/editCourse.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("course", courseServices.getCourseByUsername(acc.getUsername()));
            request.setAttribute("category", courseServices.getCategory());
            request.getRequestDispatcher("/Views/manageCourse.jsp").forward(request, response);
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
//        processRequest(request, response);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String message = "", fileName = "", nameCourse = "", title = "", description = "", skill = "";
        int courseId = 0, price = 0, categoryId = 0;
        try{
            courseId = Integer.parseInt(request.getParameter("courseId"));
            nameCourse = request.getParameter("nameCourse");
            title= request.getParameter("title");
            price = Integer.parseInt(request.getParameter("price"));
            description = request.getParameter("description");
            categoryId = Integer.parseInt(request.getParameter("categoryId"));
            skill = request.getParameter("skill");
            Part filePart = request.getPart("file");
            fileName = filePart.getSubmittedFileName();
            for (Part part : request.getParts()) {
              part.write("E:\\kien\\LearningEnglish\\web\\image\\" + fileName);
            }
        }catch(Exception ex){
            message = ex.getMessage();
        }
        if(!fileName.equals(""))
            fileName = "..\\image\\"+fileName;
        
        courseServices.editCourse(courseId, nameCourse, title, price, description, categoryId, skill, fileName);
        request.setAttribute("course", courseServices.getCourseByUsername("admin"));
        request.setAttribute("category", courseServices.getCategory());
        request.getRequestDispatcher("/Views/manageCourse.jsp").forward(request, response);
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
