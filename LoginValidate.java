/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class LoginValidate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ResultSet rs = null;
        try {
              Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
              String query = "SELECT userID FROM Login WHERE userID=? AND password=?";
               PreparedStatement pst = con.prepareStatement(query);
                String uname=request.getParameter("F_ID");
                String pword=request.getParameter("F_Pword");
                 pst.setString(1, uname);
                  pst.setString(2, pword);
                 rs = pst.executeQuery();

    if (rs.next()) {
        RequestDispatcher disp = request.getRequestDispatcher("Home.jsp");
        disp.forward(request, response);
    } else {
        String strerror="Invalid username or password";
       RequestDispatcher disp = request.getRequestDispatcher("Index.jsp");
        request.setAttribute("error",strerror);
         disp.forward(request, response);
         
    }
} catch (Exception e) {
    e.printStackTrace();
} 

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
