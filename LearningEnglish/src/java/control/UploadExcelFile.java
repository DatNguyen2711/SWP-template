/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.QuizServices;
import Models.MultipleChoiceQuiz;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 1 MB
        maxFileSize = 1024 * 1024 * 1000, // 10 MB
        maxRequestSize = 1024 * 1024 * 1000 // 100 MB
)
public class UploadExcelFile extends HttpServlet {
   
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UploadExcelFile</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadExcelFile at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("/Views/uploadQuiz.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        try {
            String name = request.getParameter("name");
            String type = request.getParameter("type");
            int lessionId = 1;
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();
            String aa = "";
            QuizServices quizServices = new QuizServices();
            
            aa += "E:\\kien\\LearningEnglish\\web\\excel\\";
            
            for (Part part : request.getParts()) {
                part.write(aa + fileName);
            }
            
            Path source = Paths.get(aa + fileName);
            Files.move(source, source.resolveSibling(name+".xlsx"));

//            quizServices.insertQuiz(lessionId, aa+name+".xlsx", type);
            response.getWriter().print("The file uploaded sucessfully.");
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
        }

    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
