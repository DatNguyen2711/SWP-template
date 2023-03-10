/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.QuizServices;
import Models.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author 84877
 */
@WebServlet(name="Load", urlPatterns={"/load"})
public class Load extends HttpServlet {
   
    int count = 1;
    QuizServices quizServices = new QuizServices();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int check = Integer.parseInt(request.getParameter("n"));
        if(check==0){
            out.println("<div id=\"question\" class=\"question\">\n" +
"                <div class=\"content-question\">\n" +
"                    <input name=\"question\" placeholder=\"question...\" type=\"text\"/>\n" +
"                </div>\n" +
"                <div id=\"content-answer\">\n" +
"                    <div id=\"answer\" class=\"answer\">\n" +
"                        <input type=\"text\" name=\"answer\"/>\n" +
"                    </div>\n" +
"                    <button class=\"add1\" onclick=\"loadMoreAns(this)\">+</button>\n" +
"                </div>\n" +
"            </div>\n" +
"            <div id=\"question1\"></div>");
        }
        else if(check == 1){
            out.println("<div id=\"question\" class=\"question\">\n" +
"                <div class=\"content-question\">\n" +
"                    <input name=\"question\" placeholder=\"question...\" type=\"text\"/>\n" +
"                </div>\n" +
"                <div id=\"all\">\n" +
"                    \n" +
"                    <div id=\"content-answer\">\n" +
"                        <div id=\"answer1\" class=\"answer\">\n" +
"                            <a class=\"add1\" onclick=\"loadMoreAns(this)\">+</a>\n" +
"                            <input type=\"text\" name=\"answer\"/> \n" +
"                            <input name=\"correctAns\" class=\"checkbox\" type=\"checkbox\"/>\n" +
"                            <!--<div id=\"answer1\"></div>-->\n" +
"                        </div>\n" +
"                    </div>\n" +
"                </div>\n" +
"            </div>\n" +
"            <div id=\"question1\"></div>");
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
       // processRequest(request, response);
       PrintWriter out = response.getWriter();
       int id = Integer.parseInt(request.getParameter("id"));
       List<Quiz> list = quizServices.getAllQuizByLessionId(id);
        for (Quiz quiz : list) {
            out.println("<p><a href=\"/LearningEnglish/student/quiz?quizId="+quiz.getQuizId()+"\">"+quiz.getNameQuiz()+"</a> | duration: "+quiz.getDuration()+" minutes</p>");
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
        QuizServices quizServices = new QuizServices();
        String[] a = request.getParameterValues("question");
        String[] b = request.getParameterValues("answer");
        String[] v = request.getParameter("number").split(",");
        int count = 0;
        String ans = "";
        try{
            String[] correctAns = request.getParameterValues("correctAns");
            for (int i = 0; i < a.length; i++) {
                ans = "";
                count += Integer.parseInt(v[i]);
                for (int j = 0; j < count; j++) {
                    if(j < count - 1)
                        ans += b[j]+"/";
                    else
                        ans += b[j];
                }
//                quizServices.insertQuiz(1, i, a[i], ans, correctAns[i]);
            }
        }catch(Exception ex){  
            request.setAttribute("ss", ex.getMessage());
        }
        request.getRequestDispatcher("/Views/createQuiz.jsp").forward(request, response);
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
