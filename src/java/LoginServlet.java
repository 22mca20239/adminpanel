import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import conn.DBConnection;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC connection parameters
//    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mcsharp";
//    private static final String JDBC_USERNAME = "root";
//    private static final String JDBC_PASSWORD = "Mysql@84096";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // JDBC logic to authenticate user
        boolean isAuthenticated = authenticateUser(username, password);
          HttpSession session = request.getSession();

        if (isAuthenticated) {
            // Successful login
            session.setAttribute("username", username); // Set the username attribute in the session
            response.sendRedirect("welcome.jsp"); // You can replace with the welcome page
        } else {
            // Failed login
            response.sendRedirect("index.html?error=true"); //send to same login page
        }
    }

    private boolean authenticateUser(String username, String password) {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            boolean userExists;
            // Prepare the SQL statement
            try ( // Establish the connection
                    Connection connection = DBConnection.getConnection()) {
                // Prepare the SQL statement
                String sql = "SELECT * FROM Admin WHERE username = ? AND password = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
//                HttpSession session = request.getSession();
//                session.setAttribute("username",username);
                // Execute the query
                ResultSet resultSet = preparedStatement.executeQuery();
                // Check if the user exists and credentials are correct
                userExists = resultSet.next();
                // Close resources
                resultSet.close();
                preparedStatement.close();
            }

            return userExists;

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
