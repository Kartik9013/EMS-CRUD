<%@page import="com.ems.model.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Employees</title>
    <link rel="stylesheet" href="viewEmployee.css">
    <style></style>
</head>
<%
session = request.getSession(false);
if(session == null||session.getAttribute("admin") == null){
	response.sendRedirect("index.jsp");
	return;
}

%>
<body>
	
	<nav>
		<a href="dashboard.jsp">Home</a><br>
		<a href="addEmployee.jsp">Add Employee</a><br>
		<a href="updateAdmin.jsp">Update Profile</a><br>
		<a href="addAdmin.jsp">New Admin Enrollment</a><br>
		<a href="LogoutServlet">Log Out</a><br>
	</nav>
	
	
    <h2>Employee List</h2>

    <!-- Display Success or Error Message -->
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

    <!-- Employee Table -->
    <div class="table-container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Father's Name</th>
                <th>Date of Birth</th>
                <th>Salary</th>
                <th>Designation</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Email</th>
                <th>Highest Education</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
      <!-- Fetch and display employee data -->
     <%
     	@SuppressWarnings("unchecked")
         List<Employee> employees = (List<Employee>) request.getAttribute("employees");
         for (Employee emp : employees) {
     %>
   <tr>
       <td><%= emp.getId() %></td>
       <td><%= emp.getName() %></td>
       <td><%= emp.getFathersName() %></td>
       <td><%= emp.getDob() %></td>
       <td><%= emp.getSalary() %></td>
       <td><%= emp.getDesignation() %></td>
       <td><%= emp.getPhone() %></td>
       <td><%= emp.getAddress() %></td>
       <td><%= emp.getEmail() %></td>
       <td><%= emp.getHighestEducation() %></td>
       <td>
        <div class="action-container">
           <a href="editEmployee.jsp?id=<%= emp.getId() %>" 
           class="action-btn edit-btn">Edit</a>
           
           <a href="DeleteEmployeeServlet?id=<%= emp.getId() %>" 
           class="action-btn delete-btn" 
           onclick="return confirm('Are you sure you want to delete this employee?')">Delete</a>
           
            </div>
       </td>
   </tr>
            <%
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
