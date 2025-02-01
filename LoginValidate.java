/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginValidate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ResultSet rs = null;

            try {
            ArrayList<String> columnName=new ArrayList<String>();
              Class.forName("oracle.jdbc.driver.OracleDriver");
              Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system"); 
              String query = "SELECT FacultyID,FacultyName,FacultyDept FROM Information WHERE FacultyID=? AND Facultypassword=?";
               PreparedStatement pst = con.prepareStatement(query);
                String uname=request.getParameter("F_ID");
                String pword=request.getParameter("F_Pword");
                 pst.setString(1, uname);
                  pst.setString(2, pword);
                 rs = pst.executeQuery();
                 HttpSession session=request.getSession(true);
                 
    if (rs.next()) {
        RequestDispatcher disp = request.getRequestDispatcher("Home.jsp");
        ResultSetMetaData column=rs.getMetaData();
        String Fname=null;
        String FDept=null;
        int FID=0;
        int i=0;
        while(i<column.getColumnCount()){
            i++;
            columnName.add(column.getColumnName(i));
        }
            String[] detail=new String[3];
                   for(int i1=0;i1<columnName.size();i1++){
                       detail[i1]=rs.getString(columnName.get(i1));
                   }
            FID=Integer.parseInt(detail[0]);
            Fname=detail[1];
            FDept=detail[2];
            
            session.setAttribute("Fname", Fname);
            session.setAttribute("FID", FID);
            session.setAttribute("FDept", FDept);
             disp.forward(request, response);
        
    }
else
{
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
