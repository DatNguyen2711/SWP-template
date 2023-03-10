/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.CourseServices;
import DAO.LessionServices;
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
        fileSizeThreshold = 1024 * 1024 * 10, // 1 MB
        maxFileSize = 1024 * 1024 * 1000, // 10 MB
        maxRequestSize = 1024 * 1024 * 1000 // 100 MB
)
public class CreateLessionControl extends HttpServlet {
   
    LessionServices lessionServices = new LessionServices();
    CourseServices courseServices = new CourseServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateLessionControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateLessionControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        request.getRequestDispatcher("/Views/createLession.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        String fileName = "";
        try{
            Part filePart = request.getPart("file");
            fileName = filePart.getSubmittedFileName();
            for (Part part : request.getParts()) {
              part.write("E:\\kien\\LearningEnglish\\web\\video\\" + fileName);
            }
        }catch(Exception ex){
        }
        String nameLession = request.getParameter("nameLession");
        int stt = Integer.parseInt(request.getParameter("stt"));
        int courseId = 0;
        HttpSession session = request.getSession();
        courseId = Integer.parseInt(session.getAttribute("courseId").toString());
        lessionServices.insertLession(courseId, nameLession, "../video/"+fileName, stt);
        request.setAttribute("lession", lessionServices.getAllLessionByCourseId(courseId));
        request.getRequestDispatcher("/Views/manageLession.jsp").forward(request, response);
    }
      
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
