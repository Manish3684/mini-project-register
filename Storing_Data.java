import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.HashSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Storing_Data extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        String data_select = request.getParameter("Date_select");  // Date input
        String time_select = request.getParameter("Time_select");  // Time dropdown (String)
        String dept_select = (String) session.getAttribute("SelectedDepartment");
        String year_select = (String) session.getAttribute("Selectedyear");
        String section_select = request.getParameter("sectionselect");
        String room_select = request.getParameter("room_select");
        String course_select = request.getParameter("course_select");
        String faculty_select = request.getParameter("faculty_select");

        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
                String query = "INSERT INTO facultyreplacment (ASSIGN_DATE, ASSIGN_TIME, YEAR, DEPARTMENT, SECTION, ROOMNO, COURSEID_NAME, FACULTYID_NAME) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                 PreparedStatement pst2 = con.prepareStatement(query);
                java.sql.Date sqlDate = java.sql.Date.valueOf(data_select);  
                String sqlTime = time_select;  

                pst2.setDate(1, sqlDate);       
                pst2.setString(2, sqlTime);  
                pst2.setString(3, year_select);
                pst2.setString(4, dept_select);
                pst2.setString(5, section_select);
                pst2.setString(6, room_select);
                pst2.setString(7, course_select);
                pst2.setString(8, faculty_select);
                pst2.executeUpdate();  
                pst2.close();
                con.close();     
               // session.setAttribute("email", "manishsr18104@gmail.com");
                JavaSendEmail.sendMail("225027083@sastra.ac.in");
               RequestDispatcher disp = request.getRequestDispatcher("Home.jsp");
                disp.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
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
        return "Short description";
    }
}
