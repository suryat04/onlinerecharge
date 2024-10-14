package recharge;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Recharge")
public class RechargeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String mobileNumber = request.getParameter("mobileNumber");
        String networkType = request.getParameter("networkType");
        String networkName = request.getParameter("networkName");
        String rechargePlan = request.getParameter("rechargePlan");

        // Create a RechargeDetails object to hold the recharge information
        RechargeDetails rechargeDetails = new RechargeDetails();
        rechargeDetails.setName(name);
        rechargeDetails.setMobileNumber(mobileNumber);
        rechargeDetails.setNetworkType(networkType);
        rechargeDetails.setNetworkName(networkName);
        rechargeDetails.setRechargePlan(rechargePlan);

        // Create a RechargeDAO object to save recharge details
        RechargeDAO rechargeDAO = new RechargeDAO();
        boolean isSaved = rechargeDAO.saveRechargeDetails(rechargeDetails);

        if (isSaved) {
            response.getWriter().println("<h3>Recharge processed successfully!</h3>");
        } else {
            response.getWriter().println("<h3>Error while processing recharge. Please try again.</h3>");
        }
    }
}
