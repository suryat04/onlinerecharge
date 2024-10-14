package recharge;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();  // Initialize DAO

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User(username, password, email);
        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
            response.sendRedirect("index.jsp");  // Redirect to login page after registration
        } else {
            request.setAttribute("errorMessage", "Registration failed. Try again!");  // Set error message
            request.getRequestDispatcher("index.jsp").forward(request, response);  // Forward to JSP with error message
        }
    }
}
