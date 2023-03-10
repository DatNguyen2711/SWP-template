/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.QuizServices;
import Models.Account;
import Models.MultipleChoiceQuiz;
import Models.Quiz;
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
public class ViewQuiz extends HttpServlet {
   
    
    QuizServices quizServices = new QuizServices();
    Quiz quiz;
    int quizId;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewQuiz</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewQuiz at " + request.getContextPath () + "</h1>");
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
        quizId = Integer.parseInt(request.getParameter("quizId"));
        
        request.setAttribute("score", quizServices.getScoreByUsername(acc.getUsername(), quizId));
        request.getRequestDispatcher("/Views/showScore.jsp").forward(request, response);
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
        try {
            HttpSession session = request.getSession();
            quiz = quizServices.getQuizById(quizId);
            session.setAttribute("lessionId", quiz.getLessionId());
            List<MultipleChoiceQuiz> list = null;
            String path = quiz.getPath();
        
        if(quiz.getType().equals("listen")){
            path = quiz.getPath().split("///")[0];
           // System.out.println(quiz.getPath().split("///")[0]);
            request.setAttribute("audio", quiz.getPath().split("///")[1]);
        }
        else{
            path = quiz.getPath();
        }
        
        if(!quiz.getType().equals("Writing")){
            list = quizServices.readExcelEachRow(quiz.getLessionId(), path, quiz.getType());
            
            if(quiz.getType().equals("reading")){
                request.setAttribute("text", list.get(0).getQuestion());
                list.remove(0);
            }
            request.setAttribute("multiple", list);
        }else{
            request.setAttribute("topic", quiz.getPath());
        }
            request.setAttribute("quiz", quiz);
//            request.setAttribute("multiple", quizServices.readExcelEachRow(quiz.getLessionId(), quiz.getPath(), quiz.getType()));
            request.getRequestDispatcher("/Views/viewQuiz.jsp").forward(request, response);
        } catch (Exception e) {
        }
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
