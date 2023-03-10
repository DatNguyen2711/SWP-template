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
public class CreateCourseControl extends HttpServlet {
   
    CourseServices courseServices = new CourseServices();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */ 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateCourseControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateCourseControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        request.setAttribute("category", courseServices.getCategory());
        request.getRequestDispatcher("/Views/createCourse.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        String message = "";
        try {
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            String aa = "E:\\kien\\LearningEnglish";
            for (Part part : request.getParts()) {
              part.write(aa+"\\web\\image\\" + fileName);
            }
            
            String nameCourse = request.getParameter("nameCourse");
            String title= request.getParameter("title");
            int price = Integer.parseInt(request.getParameter("price"));
            String description = request.getParameter("description");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            String skill = request.getParameter("skill");

            courseServices.insertCourse(acc.getUsername(), nameCourse, title, price, description, categoryId, skill, "..\\image\\"+fileName);
//            response.getWriter().print("The file uploaded sucessfully.");
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
        }
        request.setAttribute("course", courseServices.getCourseByUsername(acc.getUsername()));
        request.setAttribute("category", courseServices.getCategory());
        request.getRequestDispatcher("/Views/manageCourse.jsp").forward(request, response);
    }
    
    
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
