/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.QuizServices;
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
public class ManageQuizControl extends HttpServlet {
   
    QuizServices quizServices = new QuizServices();
    Quiz quiz;
    String path = "";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageQuizControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageQuizControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        int quizId = Integer.parseInt(request.getParameter("quizId"));
        quiz = quizServices.getQuizById(quizId);
        List<MultipleChoiceQuiz> list = null;
        
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
        
        session.setAttribute("lessionId", quiz.getLessionId());
        request.getRequestDispatcher("/Views/manageQuiz.jsp").forward(request, response);
    } 

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
            PrintWriter out = response.getWriter();
            
            
        try{
            String[] content = request.getParameter("content").split("///");
            if(content.length<=1){
                if(quiz.getType().equals("Writing")){
                    quizServices.updateWritting(quiz.getQuizId(), content[0]);
                }else{
                    quizServices.modifyData(content, 0, path, false);
                }
            }else{
                int row = Integer.parseInt(content[content.length-2])-1;
                boolean insertOrUpdate = false;
                if(content[content.length-1].equals("1"))
                    insertOrUpdate = true;

                quizServices.modifyData(content, row, path, insertOrUpdate);
            }
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
