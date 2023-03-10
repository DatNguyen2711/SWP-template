/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import DAO.AccountServices;
import DAO.QuizServices;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author 84877
 */
public class MarkWritting extends HttpServlet {
   
    QuizServices quizServices = new QuizServices();
    AccountServices accountServices = new AccountServices();
    int quizId;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MarkWritting</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarkWritting at " + request.getContextPath () + "</h1>");
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
        quizId = Integer.parseInt(request.getParameter("quizId"));
        request.setAttribute("write", quizServices.getWritting(quizId));
        request.setAttribute("listAcc", accountServices.getAllAccountStudent());
        request.setAttribute("score", quizServices);
        request.getRequestDispatcher("/Views/markWritting.jsp").forward(request, response);
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
        PrintWriter out = response.getWriter();
        try {
            String[] content = request.getParameter("content").split("///");
            if(quizServices.getScore(quizId, content[0]) != -1){
                quizServices.updateScore(Integer.parseInt(content[1]), content[0], Double.parseDouble(content[2]));
            }else
                quizServices.insertScore(Integer.parseInt(content[1]), content[0], Double.parseDouble(content[2]));
            out.println("save successfully");
        } catch (Exception e) {
            System.out.println(e.getMessage());
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
