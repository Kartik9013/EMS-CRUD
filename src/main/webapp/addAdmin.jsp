<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Admin Registration</title>
<link rel="stylesheet" href="addAdmin.css">
<style></style>
</head>
<%	session = request.getSession(false);
	if(session == null||session.getAttribute("admin") == null){
		response.sendRedirect("index.jsp");
		return;
	}
%>
<body>
	<nav>
    	<a href="dashboard.jsp">Home</a>
		<a href="ViewEmployeeServlet">View Employees</a>
		<a href="updateAdmin.jsp">Change Password</a>
		<a href="addAdmin.jsp">Add Admin</a>
		<a href="LogoutServlet">Log Out</a>
	</nav>
	
     <h2>Add New Admin</h2>
    <!-- Displaying Success or Error Message -->
    <%
        String message = request.getParameter("message");
        String messageType = request.getParameter("messageType");
        if (message != null) {
    %>
        <div class="<%= messageType %>">
            <%= message %>
        </div>
    <%
        }
    %>
    
        <!-- Registration Form -->
    <div class="container">
        <form action="AddAdminServlet" method="post">
            <div class="form-group">
                <label for="username">Enter Username:</label>
                <input type="text" name="username" id="username" placeholder="Username" required>
            </div>

            <div class="form-group">
                <label for="fullname">Enter Full Name:</label>
                <input type="text" name="fullname" id="fullname" placeholder="Full Name" required>
            </div>

            <div class="form-group">
                <label for="email">Enter Email:</label>
                <input type="email" name="email" id="email" placeholder="Email" required>
            </div>

            <div class="form-group">
                <label for="password">Create Password:</label>
                <input type="password" name="password" id="password" placeholder="Password" required>
            </div>

            <button type="submit">Add Admin</button>
        </form>
    </div>
</body>
</html>

