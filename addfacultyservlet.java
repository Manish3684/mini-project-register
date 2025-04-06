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

public class addfacultyservlet extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                      try{
                              String facultyid=request.getParameter("newfacultyid");
                              String facultyname=request.getParameter("newfacultyname");
                              String facultydept=request.getParameter("deptfaculty");
                              
                              out.println(facultyid);
                              out.println(facultyname);
                              out.println(facultydept);
                              Class.forName("oracle.jdbc.driver.OracleDriver");
                              Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
                              String query = "insert into information(FACULTYID,FACULTYNAME,FACULTYDEPT,DESIGNATION,EMAIL,PHN_NUMBER,PASSWORD) values(?,?,?,?,?,?,?)";
                              PreparedStatement pst = con.prepareStatement(query);
                              pst.setString(1, facultyid);
                              pst.setString(2,facultyname);
                              pst.setString(3,facultydept);
                              pst.setString(4, "-");
                              pst.setString(5,"-");
                              pst.setString(6,"-");
                              pst.setString(7, "src");
                              ResultSet rs=pst.executeQuery();
                              RequestDispatcher disp=request.getRequestDispatcher("Home.jsp");
                              disp.forward(request, response);
                      }
                      catch(Exception e){
                              e.printStackTrace();
                      }
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
