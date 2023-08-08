<%@ page import="java.sql.*" %>
<%@ page import="conn.DBConnection" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tachyons@4.12.0/css/tachyons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
        <title>Delete Customer Details</title>
    </head>
    <body class="tc">
        <h1>Delete Customer Details</h1>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                Connection connection = DBConnection.getConnection();
                stmt = connection.prepareStatement("DELETE FROM customers WHERE uid = ?");
                stmt.setInt(1, Integer.parseInt(request.getParameter("uid")));
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
        %>
        <p>Row deleted successfully.</p>
        <button onclick="goBack()" class="bg-gray white ph3 pv2 br2 bn pointer"><i class="fas fa-arrow-left"></i> Back</button>
        <script>
            function goBack() {
                window.history.back(); // Go back to the previous page
            }
        </script>
        <%
        } else {
        %>
        <p>No row found with that ID.</p>
        <button onclick="goBack()" class="bg-gray white ph3 pv2 br2 bn pointer"><i class="fas fa-arrow-left"></i> Back</button>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <p>An error occurred while deleting the row.</p>
        <button onclick="goBack()" class="bg-gray white ph3 pv2 br2 bn pointer"><i class="fas fa-arrow-left"></i> Back</button>
        <%
            } finally {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
        %>
    </body>
</html>
