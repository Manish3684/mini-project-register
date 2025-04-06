import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class otpgeneratepage extends HttpServlet {
    private String generateOTP() {
        SecureRandom random = new SecureRandom();
        int otp = 100000 + random.nextInt(900000);  
        return String.valueOf(otp);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String otp=generateOTP() ;
       HttpSession session = request.getSession();
       String fid=null;
        fid = (String) session.getAttribute("FID");

        try (PrintWriter out = response.getWriter()) {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            String query = "SELECT EMAIL FROM INFORMATION WHERE FACULTYID = ? ";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, fid);
            ResultSet rs = pst.executeQuery();
            String email = null;

            if (rs.next()) {
                email = rs.getString("EMAIL");  
            }
                OTP_Genrate.sendMail(email, otp); 
                session.setAttribute("otp", otp);
                RequestDispatcher disp = request.getRequestDispatcher("password_change.jsp");
                disp.forward(request, response);
                        rs.close();
                        pst.close();
                        con.close();

        } catch (Exception e) {
            e.printStackTrace();
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
