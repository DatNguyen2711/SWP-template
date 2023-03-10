
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
import java.text.DecimalFormat;
import java.util.List;

/**
 *
 * @author 84877
 */
public class GetResultControl extends HttpServlet {
   
    QuizServices quizServices = new QuizServices();
    Quiz quiz;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetResultControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetResultControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        processRequest(request, response);
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            DecimalFormat df = new DecimalFormat("#.##");
             
            String[] content = request.getParameter("content").split("///");
            int count = 0, size = content.length-1, countAns = 0;
            String path = "";
            quiz = quizServices.getQuizById(Integer.parseInt(content[content.length-1]));
            if(quiz.getType().equals("Writing")){
                quizServices.insertWritting(quiz.getQuizId(), acc.getUsername(), content[0]);
                System.out.println(content[0]+content[1]);
            }
            else{
                if(quiz.getType().equals("listen")){
                    path = quiz.getPath().split("///")[0];
                }
                else{
                    path = quiz.getPath();
                }
                List<MultipleChoiceQuiz> list = quizServices.readExcelEachRow(quiz.getLessionId(), path, quiz.getType());

                for (String s : content) {
                    System.out.println(s);
                    String ans = s.substring(1, s.length());
                    
                    int id = Integer.parseInt(s.substring(0,1));
                    if(list.get(id-1).getCorrectAnswer().equals(ans)){
                        countAns++;
                    }
                }
                int all = list.size();
                if(quiz.getType().equals("reading")){
                    all--;
                }
                double score = (double) countAns*10/all;
                System.out.println(score);
                PrintWriter out = response.getWriter();
                if(score != (int) score){
                    String formate = df.format(score);
                    double finalValue = (Double)df.parse(formate);
                    quizServices.insertScore(quiz.getQuizId(), acc.getUsername(), finalValue);
                    out.print("Result = "+ finalValue + "/10");
                }else{
                    quizServices.insertScore(quiz.getQuizId(), acc.getUsername(), score);
                    out.print("Result = "+ score + "/10");
                }
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
