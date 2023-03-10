/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

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
public class EditLessionControl extends HttpServlet {
   
    LessionServices lessionServices = new LessionServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditLessionControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditLessionControl at " + request.getContextPath () + "</h1>");
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
        int lessionId = Integer.parseInt(request.getParameter("lessionId"));
        request.setAttribute("lession", lessionServices.getLessionById(lessionId));
        request.getRequestDispatcher("/Views/editLession.jsp").forward(request, response);
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
        int courseId = 0, lessionId = 0, stt = 0;
        String fileName = "", nameLession = "";
        try{
            lessionId = Integer.parseInt(request.getParameter("lessionId"));
            stt = Integer.parseInt(request.getParameter("stt"));
            courseId = Integer.parseInt(session.getAttribute("courseId").toString());
            Part filePart = request.getPart("file");
            fileName = filePart.getSubmittedFileName();
            for (Part part : request.getParts()) {
              part.write("E:\\kien\\LearningEnglish\\web\\video\\" + fileName);
            }
        }catch(Exception ex){
//            request.setAttribute("mess2", ex.getMessage());
        }
        nameLession = request.getParameter("nameLession");
        if(!fileName.equals(""))
            fileName = "..\\video\\" + fileName;
        lessionServices.editLession(lessionId, courseId, nameLession, fileName, stt);
        request.setAttribute("lession", lessionServices.getAllLessionByCourseId(courseId));
        request.getRequestDispatcher("/Views/manageLession.jsp").forward(request, response);
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
