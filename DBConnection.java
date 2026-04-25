package com.dddlab.lab04_ddd.util;

import java.sql.*;

public class DBConnection {
    public static Connection getConnection() {
        String url = "jdbc:sqlserver://localhost:57283;databaseName=StudentInformation;encrypt=true;trustServerCertificate=true;";
        String user = "sa";
        String password = "sasa10";

        try {
            System.out.println("Attempting to connect to the database...");
            Connection connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connection successful!");
            return connection;
        } catch (SQLException e) {
            System.err.println("Connection failed!");
            e.printStackTrace();
            return null;
        }
    }

    public static int updateStudentAddress(String studentName, String newAddress) {
        String sql = "UPDATE Student SET Address = ? WHERE Sname = ?";
        int rowsAffected = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newAddress);
            pstmt.setString(2, studentName);

            rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Address updated successfully for " + studentName);
            } else {
                System.out.println("No student found with the name: " + studentName);
            }

        } catch (SQLException e) {
            System.err.println("Error updating address: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return rowsAffected;
    }

    public static int deleteModuleByName(String moduleName) {
        String sql = "DELETE FROM Module WHERE Mname = ?";
        int rowsAffected = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, moduleName);

            rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Module '" + moduleName + "' deleted successfully.");
            } else {
                System.out.println("No module found with the name: " + moduleName);
            }

        } catch (SQLException e) {
            System.err.println("Error deleting module: " + e.getMessage());
            throw new RuntimeException(e);
        }
        return rowsAffected;
    }
}
