<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
    <link rel="stylesheet" href="addEmployee.css">
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
	<!-- Navigation Bar -->
    <nav>
    	<a href="dashboard.jsp">Home</a>
		<a href="ViewEmployeeServlet">View Employees</a>
		<a href="updateAdmin.jsp">Change Password</a>
		<a href="addAdmin.jsp">Add Admin</a>
		<a href="LogoutServlet">Log Out</a>
	</nav>
    
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

    <div class="container">
      <h2>Add New Employee</h2>
      <form action="AddEmployeeServlet" method="POST">
        <div class="form-group">
          <label for="name">Employee Name:</label>
          <input
            type="text"
            id="name"
            name="name"
            required
            placeholder="Enter Employee's Name"
          />
        </div>
        <div class="form-group">
          <label for="fathersName">Father's Name:</label>
          <input
            type="text"
            id="fathersName"
            name="fathersName"
            required
            placeholder="Enter Father's Name"
          />
        </div>
        <div class="form-group">
          <label for="dob">Date of Birth:</label>
          <input type="date" id="dob" name="dob" required />
        </div>
        <div class="form-group">
          <label for="salary">Salary:</label>
          <input
            type="number"
            id="salary"
            name="salary"
            required
            placeholder="50000"
            step="0.01"
          />
        </div>
        <div class="form-group">
          <label for="designation">Designation:</label>
          <input
            type="text"
            id="designation"
            name="designation"
            required
            placeholder="Software Engineer"
          />
        </div>
        <div class="form-group">
          <label for="address">Address:</label>
          <textarea
            id="address"
            name="address"
            required
            placeholder="123 Main Street, City"
          ></textarea>
        </div>
        <div class="form-group">
          <label for="phone">Phone:</label>
          <input
            type="text"
            id="phone"
            name="phone"
            required
            placeholder="9876543210"
          />
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            required
            placeholder="example@example.com"
          />
        </div>
        <div class="form-group">
          <label for="highestEducation">Highest Education:</label>
          <input
            type="text"
            id="highestEducation"
            name="highestEducation"
            required
            placeholder="MCA"
          />
        </div>
        <div class="form-group">
          <button type="submit">Add Employee</button>
        </div>
      </form>
      <a href="dashboard.jsp" style="color: white; display: inline-block; margin-top: 15px"
        >Back to Dashboard</a
      >
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

