<%@ page import="java.sql.*" %>
<%@ page import="conn.DBConnection" %>
<%
    String id = request.getParameter("uid");
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String street = request.getParameter("street");
    String address = request.getParameter("address");
    String state = request.getParameter("state");
    String city = request.getParameter("city");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    if (first_name != null && last_name != null && street != null && address != null && state != null && city != null && email != null && phone != null) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE customers SET first_name = ?, last_name=?, street=?, address=?, state=?, city=?, email=?, phone=?  WHERE uid = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, first_name);
            pstmt.setString(2, last_name);
            pstmt.setString(3, street);
            pstmt.setString(4, address);
            pstmt.setString(5, state);
            pstmt.setString(6, city);
            pstmt.setString(7, email);
            pstmt.setString(8, phone);
            pstmt.setInt(9, Integer.parseInt(id));
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            response.sendRedirect("welcome.jsp");
        } catch (SQLException e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>

<% int ids = Integer.parseInt(request.getParameter("uid")); %>
<%

    Connection conn = DBConnection.getConnection();
    String sql = "SELECT * FROM  customers  WHERE uid = ?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, ids);

    ResultSet rs = pstmt.executeQuery();
    while (rs.next()) {

%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tachyons@4.12.0/css/tachyons.min.css">
        <title>Update User</title>
    </head>
    <body>
        <!--        <h1>Update User</h1>-->
        <!--        <form method="post" class="form w-60">
                    <label for="first_name">Name:</label>
                    <input type="text" name="first_name" class="form-control" value="<%= rs.getString("first_name")%>">
                    <br>
                    <label for="email">Email:</label>
                    <input type="email" name="email" class="form-control" value="<%= rs.getString("email")%>">
                    <br>
                    <label for="phone">Phone:</label>
                    <input type="tel" name="phone" class="form-control" value="<%= rs.getString("phone")%>">
                    <br>
                    <input type="submit" value="Update" class="btn btn-primary w-100">
                </form>
        -->
        <div class="mw6 center ba b--black-10 br3 bw2 mt6">
            <form method="post" class="mw6 center pa3">
                <p class="f2 tc underline">Update Customer Details</p>
                <div class="flex flex-wrap mb3">
                    <div class="w-50 pa2">
                        <label for="first_name" class="db fw6 mb2">First Name:</label>
                        <input type="text" name="first_name" id="first_name"  class="pa2 input-reset br3 b--black-20 w-100" value="<%= rs.getString("first_name")%>" >
                    </div>
                    <div class="w-50 pa2">
                        <label for="last_name" class="db fw6 mb2">Last Name:</label>
                        <input type="text" name="last_name" id="last_name" class="pa2 input-reset br3 b--black-20 w-100" value="<%= rs.getString("last_name")%>">
                    </div>
                    <div class="w-50 pa2">
                        <label for="street" class="db fw6 mb2">Street:</label>
                        <input type="text" name="street" id="street" class="pa2 input-reset br3 b--black-20 w-100" value="<%= rs.getString("street")%>"><br>
                    </div>
                    <div class="w-50 pa2">
                        <label for="address" class="db fw6 mb2">Address:</label>
                        <input type="text" name="address" id="address" class="pa2 input-reset br3 b--black-20 w-100" value="<%= rs.getString("address")%>"><br>
                    </div>
                    <div class="w-50 pa2">
                        <label for="state" class="db fw6 mb2">State:</label>
                        <input type="text" name="state" id="state" class="pa2 input-reset br3 b--black-20 w-100" value="<%= rs.getString("state")%>"><br>
                    </div>
                    <div class="w-50 pa2">
                        <label for="city" class="db fw6 mb2">City:</label>
                        <input type="text" name="city" id="city" class="pa2 input-reset br3 b--black-20 w-100 " value="<%= rs.getString("city")%>"><br>
                    </div>

                    <div class="w-50 pa2">
                        <label for="email" class="db fw6 mb2">Email:</label>
                        <input type="email" name="email" id="email" class="pa2 input-reset br3 b--black-20 w-100" value="<%= rs.getString("email")%>">
                    </div>
                    <div class="w-50 pa2">
                        <label for="phone" class="db fw6 mb2">Phone:</label>
                        <input type="tel" name="phone" id="phone" class="pa2 input-reset br3 b--black-20 w-100" value="<%= rs.getString("phone")%>">
                    </div>
                </div>
                <input type="submit" value="Submit" class="mt3 w-100 br3 pa2 grow bg-blue b--blue white db fw6">
            </form>
        </div>
    </body>
</html>

<%      }
    pstmt.close();
    conn.close();
    //response.sendRedirect("CompleteTable.jsp");


%>
