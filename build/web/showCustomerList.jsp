<%@ page import="java.sql.*" %>
<%@ page import="conn.DBConnection" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Show Customers List</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tachyons@4.12.0/css/tachyons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    </head>
    <body class="bg-light-gray calisto">
        <table class="collapse ba br2 b--black-10 pv2 ph3 w-100">
            <thead class="bg-white">
                <tr>
                    <th class="pv2 ph3 tl">First Name</th>
                    <th class="pv2 ph3 tl">Last Name</th>
                    <th class="pv2 ph3 tl">Street</th>
                    <th class="pv2 ph3 tl">Address</th>
                    <th class="pv2 ph3 tl">City</th>
                    <th class="pv2 ph3 tl">State</th>
                    <th class="pv2 ph3 tl">Email</th>
                    <th class="pv2 ph3 tl">Phone No.</th>
                    <th class="pv2 ph3 tl">Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Connection connection = DBConnection.getConnection();
                        stmt = connection.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM customers");
                        while (rs.next()) {
                            int id = rs.getInt("uid");
                            String first_name = rs.getString("first_name");
                            String last_name = rs.getString("last_name");
                            String street = rs.getString("street");
                            String address = rs.getString("address");
                            String state = rs.getString("state");
                            String city = rs.getString("city");
                            String email = rs.getString("email");
                            String phone = rs.getString("phone");
                %>
                <tr>
                    <td class="pv2 ph3 tl"><%= first_name%></td>
                    <td class="pv2 ph3 tl"><%= last_name%></td>
                    <td class="pv2 ph3 tl"><%= street%></td>
                    <td class="pv2 ph3 tl"><%= address%></td>
                    <td class="pv2 ph3 tl"><%= state%></td>
                    <td class="pv2 ph3 tl"><%= city%></td>
                    <td class="pv2 ph3 tl"><%= email%></td>
                    <td class="pv2 ph3 tl"><%= phone%></td>
                    <td class="pv2 ph3 tl">
                        <button onclick="deleteRow(<%= id%>)" class="bg-red white ph3 pv2 br2 bn pointer">
                            <i class="fas fa-trash-alt"></i> 
                        </button>
                        <button onclick="updateRow(<%= id%>)" class="bg-blue white ph3 pv2 br2 bn ml2 pointer">
                            <i class="fas fa-edit"></i>
                        </button>

                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) {
                            rs.close();
                        }
                        if (stmt != null) {
                            stmt.close();
                        }
                        if (conn != null) {
                            conn.close();
                        }
                    }
                %>
            </tbody>
        </table>
        <script>
            function deleteRow(id) {
                if (confirm("Are you sure you want to delete this row?")) {
                    window.location.href = "deleteCustomer.jsp?uid=" + id;
                }
            }
            function updateRow(id) {
                window.location.href = "updateCustomer.jsp?uid=" + id;
            }
        </script>
    </body>
</html>