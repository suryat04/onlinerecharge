package recharge;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;  // Added serialVersionUID

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String adminname = request.getParameter("adminname");
        String password = request.getParameter("password");

        // Fixed admin credentials
        if ("admin".equals(adminname) && "123@".equals(password)) {
            response.sendRedirect("admin_view.jsp");
        } else {
            response.getWriter().println("<h3>Invalid admin credentials!</h3>");
        }
    }
}
