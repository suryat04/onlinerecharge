package recharge;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RechargeDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/recharge_db";
    private static final String JDBC_USERNAME = "root"; // Replace with your DB username
    private static final String JDBC_PASSWORD = "Mvss@60"; // Replace with your DB password

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Unable to load the MySQL driver.");
        }
        return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
    }

    public boolean saveRechargeDetails(RechargeDetails rechargeDetails) {
        String query = "INSERT INTO recharge_details (name, mobile_number, network_type, network_name, recharge_plan) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
             
            ps.setString(1, rechargeDetails.getName());
            ps.setString(2, rechargeDetails.getMobileNumber());
            ps.setString(3, rechargeDetails.getNetworkType());
            ps.setString(4, rechargeDetails.getNetworkName());
            ps.setString(5, rechargeDetails.getRechargePlan());

            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
