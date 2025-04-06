import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Department extends HttpServlet {
 protected void processRuqest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
       String department = request.getParameter("selected-dept");
    HttpSession session = request.getSession();
    session.setAttribute("Department", department);
    RequestDispatcher disp = request.getRequestDispatcher("Substitu.jsp");
    disp.forward(request, response);
 }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String department = request.getParameter("selected-dept");
    HttpSession session = request.getSession();
    session.setAttribute("Department", department);
    RequestDispatcher disp = request.getRequestDispatcher("Substitu.jsp");
    disp.forward(request, response);
}
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String department = request.getParameter("selected-dept");
    HttpSession session = request.getSession();
    session.setAttribute("Department", department);
    RequestDispatcher disp = request.getRequestDispatcher("Substitu.jsp");
    disp.forward(request, response);
 }


    @Override
    public String getServletInfo() {
        return "Handles department selection and stores it in session";
    }
}
