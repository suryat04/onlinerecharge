package recharge;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
    public static Connection initializeDatabase() throws Exception {
        String url = "jdbc:mysql://localhost:3306/recharge_db"; // Update with your database name
        String user = "root"; // Update with your database username
        String password = "Mvss@60"; // Update with your database password

        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish the connection
        Connection connection = DriverManager.getConnection(url, user, password);
        return connection;
    }
}
