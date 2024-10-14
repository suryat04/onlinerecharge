package recharge;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;  // Added serialVersionUID
    private UserDAO userDAO = new UserDAO();  // DAO instance for user operations

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValidUser = userDAO.validateUser(username, password);

        if (isValidUser) {
            response.sendRedirect("recharge.jsp");  // Redirect to user dashboard
        } else {
            response.getWriter().println("<h3>Invalid username or password. Please try again.</h3>");
        }
    }
}
