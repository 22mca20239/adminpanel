/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conn;

/**
 *
 * @author madhav
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection = null;
    
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Check if the connection has been established already
        if (connection != null && !connection.isClosed()) {
            return connection;
        }
        
        // Load the database driver class
        Class.forName("com.mysql.jdbc.Driver");
        
        // Replace "your_database_name", "your_database_username", and "your_database_password" with your actual database credentials
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/SunbaseData", "root", "Mysql@84096");
        
        return connection;
    }
}