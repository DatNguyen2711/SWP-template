/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.LessionServices;
import DAO.QuizServices;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10, // 1 MB
        maxFileSize = 1024 * 1024 * 1000, // 10 MB
        maxRequestSize = 1024 * 1024 * 1000 // 100 MB
)
public class CreateQuizControl extends HttpServlet {
   
    QuizServices quizServices = new QuizServices();
    LessionServices lessionServices = new LessionServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateQuizControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateQuizControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    public CreateQuizControl() {
        super();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        
        int lessionId = Integer.parseInt(request.getParameter("lessionId"));
        session.setAttribute("lessionId", lessionId);
//        request.setAttribute("quiz", quizServices.getAllQuizByLessionId(lessionId));
        request.getRequestDispatcher("/Views/createQuiz.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
     
        HttpSession session = request.getSession();
        
        try {
            String nameQuiz = request.getParameter("nameQuiz");
            String type = request.getParameter("type");
            int duration = Integer.parseInt(request.getParameter("duration"));
            int lessionId = Integer.parseInt(request.getParameter("lessionId"));
            String fileName = "";
            String aa = "";
            if(!type.equals("Writing")){
                Part filePart = request.getPart("file");
                fileName = filePart.getSubmittedFileName();
                aa = "E:\\kien\\LearningEnglish\\web\\excel\\";

                for (Part part : request.getParts()) {
                    if(extractFileName(part).contains("xlsx"))
                        part.write(aa + fileName);
                }
            }
            
            String fileName1 = "";
            if(type.equalsIgnoreCase("listen")){
                Part filePart1 = request.getPart("audio");
                fileName1 = filePart1.getSubmittedFileName();
                for (Part part : request.getParts()) {
                    if(!extractFileName(part).contains("xlsx"))
                        part.write("E:\\kien\\LearningEnglish\\web\\video\\" + fileName1);
                }
                quizServices.insertQuiz(lessionId, nameQuiz, aa+fileName+"///../video/"+fileName1, type, duration);
            }else if(type.equalsIgnoreCase("Writing")){
                String question = request.getParameter("question");
                quizServices.insertQuiz(lessionId, nameQuiz, question, type, duration);
            }
            else{
                quizServices.insertQuiz(lessionId, nameQuiz, aa+fileName, type, duration);
            }
            
//            System.out.println(fileName+" "+fileName1);
            
            int courseId = Integer.parseInt(session.getAttribute("courseId").toString());
            request.setAttribute("lession", lessionServices.getAllLessionByCourseId(courseId));
            request.setAttribute("quiz", quizServices.getAllQuiz());
            request.getRequestDispatcher("/Views/manageLession.jsp").forward(request, response);
        } catch (Exception e) {
            response.getWriter().print(e.getMessage());
        }
        
    }
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
