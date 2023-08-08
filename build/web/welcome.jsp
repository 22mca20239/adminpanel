<%@ page import="conn.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tachyons@4.12.0/css/tachyons.min.css">
         <script>
        function insertRecord() {
            window.location.href = 'addCustomer.jsp';
        }
    </script>
    </head>
    <body class="bg-light-gray">
        <nav class="bg-dark-blue white pa3">
            <div class="container flex justify-between items-center">
                <h1 class="f4 ma0">Welcome, <%= session.getAttribute("username")%>!</h1>
                <a href="index.html" class="link dim white f4 fw6">Logout</a>
            </div>
        </nav>
       
        <div class="flex items-center ml3 justify-start">
            <button class="btn btn-primary br3 pa2 grow bg-blue b--blue white db fw6 pointer" onclick="insertRecord()">Add Customer</button>
            <h2 class="f3 tc fl w-two-thirds underline">Customers List</h2>
        </div>
            <jsp:include page="showCustomerList.jsp" /> 
    </body>
</html>
