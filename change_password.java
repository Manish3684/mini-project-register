/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Shobika
 */
public class change_password extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                                 try{
                        HttpSession session=request.getSession(true);
                        String otp=(String)session.getAttribute("otp");
                        String uotp=request.getParameter("otpverfication");
                        String fid=(String) session.getAttribute("FID");
                             out.println(otp);
                              out.println(uotp);
                        if(otp.equals(uotp)){
                                String unpword=request.getParameter("new_password");
                                String unrpword=request.getParameter("re_new_password");
                                
                                if(unpword.equals(unrpword)){
                                        out.println(unpword);
                              out.println(unrpword);
                              out.println(fid);
                                         Class.forName("oracle.jdbc.driver.OracleDriver");
                                         Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
                                         String query = "update information set PASSWORD = ? WHERE FACULTYID = ? ";
                                           PreparedStatement pst = con.prepareStatement(query);
                                          pst.setString(1,unpword);
                                           pst.setString(2, fid);
                                           ResultSet rs = pst.executeQuery();
                                           
                                           RequestDispatcher disp = request.getRequestDispatcher("Home.jsp");
                                          disp.forward(request, response);
                                }
                        }
                   }
                                 catch(Exception e){
                                 e.printStackTrace();
                                 }
                }
                catch(Exception e){
                        e.printStackTrace();
                }
        }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo() {
                return "Short description";
        }// </editor-fold>

}
