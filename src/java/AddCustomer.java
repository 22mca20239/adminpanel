

import conn.DBConnection; // Import the DBConnection class

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddCustomer extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String street = request.getParameter("street");
        String address = request.getParameter("address");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        if (first_name != null && last_name != null && street != null && address != null && state != null && city != null && email != null && phone != null) {
            if (first_name.isEmpty() || last_name.isEmpty() || street.isEmpty() || address.isEmpty() || state.isEmpty() || city.isEmpty() || email.isEmpty() || phone.isEmpty()) {
                response.getWriter().write("<p style='color:red;'>Please fill all the fields!</p>");
            } else {
                try {
                    Connection conn = DBConnection.getConnection();

                    String query = "INSERT INTO customers(first_name, last_name, street, address, state, city, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, first_name);
                    pstmt.setString(2, last_name);
                    pstmt.setString(3, street);
                    pstmt.setString(4, address);
                    pstmt.setString(5, state);
                    pstmt.setString(6, city);
                    pstmt.setString(7, email);
                    pstmt.setString(8, phone);
                    pstmt.executeUpdate();

                    response.getWriter().write("<p style='color:green;'>Data inserted successfully!</p>");
                    pstmt.close();
                    conn.close();
                    response.sendRedirect("welcome.jsp");
                } catch (ClassNotFoundException | SQLException e) {
                    response.getWriter().write("<p style='color:red;'>An error occurred while processing your request.</p>");
                    // Log the exception for debugging purposes
                    e.printStackTrace();
                }
            }
        } else {
            response.sendRedirect("addCustomer.jsp");
            response.getWriter().write("<p style='color:red;'>Please fill all the fields!</p>");
            
        }
    }
}
