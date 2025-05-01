<%@page import="com.ems.dao.EmployeeDao"%>
<%@ page import="java.util.*, java.time.LocalDate" %>
<%@ page import="com.ems.model.Employee" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
session = request.getSession(false);
if(session == null||session.getAttribute("admin") == null){
	response.sendRedirect("index.jsp");
	return;
}

int id = Integer.parseInt(request.getParameter("id"));
EmployeeDao employeeDao = new EmployeeDao();
Employee employee = employeeDao.getEmployeeById(id);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>
    <link rel="stylesheet" href="editEmployee.css">
    <style></style>
</head>
<body>
	<!-- Navigation Bar -->
    <nav>
    	<a href="dashboard.jsp">Home</a>
		<a href="ViewEmployeeServlet">View Employees</a>
		<a href="updateAdmin.jsp">Change Password</a>
		<a href="addAdmin.jsp">Add Admin</a>
		<a href="LogoutServlet">Log Out</a>
	</nav>
<div class="container">
    <h2>Update Employee</h2>
    <form action="EditEmployeeServlet" method="post">
        <input type="hidden" name="id" value="<%= employee.getId() %>">

        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" value="<%= employee.getName() %>" required>

        <label for="fathersName">Father's Name:</label>
        <input type="text" id="fathersName" name="fathersName" value="<%= employee.getFathersName() %>" required>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" value="<%= employee.getDob() %>" required>

        <label for="salary">Salary:</label>
        <input type="number" id="salary" name="salary" value="<%= employee.getSalary() %>" step="0.01" required>

        <label for="designation">Designation:</label>
        <input type="text" id="designation" name="designation" value="<%= employee.getDesignation() %>" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="<%= employee.getAddress() %>" required>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="<%= employee.getPhone() %>" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= employee.getEmail() %>" required>

        <label for="highestEducation">Highest Education:</label>
        <input type="text" id="highestEducation" name="highestEducation" 
        value="<%= employee.getHighestEducation() %>" required>
        <div class="btn-container">
            <button type="submit" class="btn">Update</button>
            <a href="ViewEmployeeServlet" class="btn btn-danger">Cancel</a>
        </div>
    </form>
</div>

<script>
      let lastScrollTop = 0;
      const nav = document.querySelector("nav");

      window.addEventListener("scroll", function () {
        let currentScroll =
          window.pageYOffset || document.documentElement.scrollTop;
        if (currentScroll > lastScrollTop) {
          // Scroll down
          nav.style.top = "-70px";
        } else {
          // Scroll up
          nav.style.top = "0";
        }
        lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
      });
</script>
</body>
</html>
