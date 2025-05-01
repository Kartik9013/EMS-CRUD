<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.ems.model.Admin" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Admin</title>
    <link rel="stylesheet" href="updateAdmin.css">
    <style></style>
</head>
<%
    session = request.getSession(false);
    Admin admin = (Admin) session.getAttribute("admin");

    if (admin == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    String message = request.getParameter("message");
    String messageType = request.getParameter("messageType");
%>
<body>

    <!-- Navigation Bar -->
    <nav>
    	<a href="dashboard.jsp">Home</a>
		<a href="ViewEmployeeServlet">View Employees</a>
		<a href="updateAdmin.jsp">Change Password</a>
		<a href="addAdmin.jsp">Add Admin</a>
		<a href="LogoutServlet">Log Out</a>
	</nav>

    <h2>Update Admin Profile</h2>

    <!-- Message Display -->
    <% if (message != null) { %>
        <div class="<%= messageType %>"><%= message %></div>
    <% } %>

    <!-- Update Form -->
    <div class="container">
        <form action="UpdateAdminServlet" method="post">
            <input type="hidden" name="username" value="<%= admin.getUsername() %>">

            <div class="form-group">
                <label>Old Password:</label>
                <input type="password" name="oldPassword" required>
            </div>

            <div class="form-group">
                <label>New Password:</label>
                <input type="password" name="newPassword" required>
            </div>

            <div class="form-group">
                <label>Confirm New Password:</label>
                <input type="password" name="confirmPassword" required>
            </div>

            <button type="submit">Update Password</button>
        </form>
    </div>
</body>
</html>
