<%@page import="com.ems.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DashBoard page -- EMS</title>
<link rel="stylesheet" href="dashboard.css">
<style></style>
</head>
<%
	session = request.getSession(false);
	if(session == null||session.getAttribute("admin") == null){
		response.sendRedirect("index.jsp");
		return;
	}
	
	Admin admin = new Admin();
	admin = (Admin)session.getAttribute("admin");

%>
<body>
	  <div class="dashboard-container">
        <h2>Welcome, <%= admin.getFullname() %> 👋</h2>

        <nav>
            <a href="addEmployee.jsp"><i class="fas fa-user-plus"></i> Add Employee</a>
            <a href="ViewEmployeeServlet"><i class="fas fa-users"></i> View Employees</a>
            <a href="updateAdmin.jsp"><i class="fas fa-user-edit"></i> Change Password</a>
            <a href="addAdmin.jsp"><i class="fas fa-user-shield"></i>Add Admin</a>
            <a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Log Out</a>
        </nav>
    </div>
</html>