<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="recharge.DatabaseConnection" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin View - Recharge Details</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Recharge Details</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Mobile Number</th>
                <th>Network Type</th>
                <th>Network Name</th>
                <th>Recharge Plan</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Prevent caching of JSP page
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);

                String sql = "SELECT * FROM recharge_details";
                int rowCount = 0;

                try (Connection connection = DatabaseConnection.initializeDatabase()) {
                    if (connection == null || connection.isClosed()) {
                        out.println("<tr><td colspan='5'>Database connection failed</td></tr>");
                    } else {
                        try (Statement statement = connection.createStatement();
                             ResultSet resultSet = statement.executeQuery(sql)) {

                            if (!resultSet.isBeforeFirst()) {
                                // Check if ResultSet is empty
                                out.println("<tr><td colspan='5'>No records found</td></tr>");
                            } else {
                                // Output fetched data
                                while (resultSet.next()) {
                                    rowCount++;
                                    out.println("<tr>");
                                    out.println("<td>" + resultSet.getString("name") + "</td>");
                                    out.println("<td>" + resultSet.getString("mobile_number") + "</td>");
                                    out.println("<td>" + resultSet.getString("network_type") + "</td>");
                                    out.println("<td>" + resultSet.getString("network_name") + "</td>");
                                    out.println("<td>" + resultSet.getString("recharge_plan") + "</td>");
                                    out.println("</tr>");
                                }
                            }
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='5'>Error loading data</td></tr>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='5'>Unexpected error occurred</td></tr>");
                }

                // Display total row count if rows were fetched
                if (rowCount > 0) {
                    out.println("<tr><td colspan='5'>Total Rows: " + rowCount + "</td></tr>");
                }
            %>
        </tbody>
    </table>
</body>
</html>
