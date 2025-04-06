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

public class changemydetail extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String fname = request.getParameter("fnamedetail");
        String fdept = request.getParameter("fdeptdetail");
        String fdesi = request.getParameter("fdesidetail");
        String femail = request.getParameter("femaildetail");
        String fphn = request.getParameter("fphndetail");

        HttpSession session = request.getSession(true);
        String fid = (String) session.getAttribute("FID");

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try (PrintWriter out = response.getWriter()) {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");

            String query = "UPDATE information SET FACULTYNAME=?, FACULTYDEPT=?, DESIGNATION=?, EMAIL=?, PHN_NUMBER=? WHERE FACULTYID=?";
            pst = con.prepareStatement(query);
            pst.setString(1, fname);
            pst.setString(2, fdept);
            pst.setString(3, fdesi);
            pst.setString(4, femail);
            pst.setString(5, fphn);
            pst.setString(6, fid);
            int rowsUpdated = pst.executeUpdate();
            pst.close(); 

            if (rowsUpdated > 0) {
                String query1 = "SELECT EMAIL FROM information WHERE FACULTYID = ?";
                pst = con.prepareStatement(query1);
                pst.setString(1, fid);
                rs = pst.executeQuery();

                String email = null;
                if (rs.next()) {
                    email = rs.getString("EMAIL");
                }

                if (email != null) {
                    Successfullyedit.sendMail(email);
                }

                RequestDispatcher disp = request.getRequestDispatcher("Index.jsp");
                disp.forward(request, response);
            } 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
            return null;
       
    }
}
