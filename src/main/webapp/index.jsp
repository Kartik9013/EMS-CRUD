<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page -- EMS</title>
   <link rel="stylesheet" href="index.css">
    <style></style>
</head>
<body>
     <div class="overlay"></div>

    <div class="login-container">
        <h2>Admin Login</h2>
        <%-- Display error message if login fails --%>
        <% if(request.getParameter("error") != null) { %>
            <p class="error">Invalid username or password. Try again.</p>
        <% } %>

        <form action="LoginServlet" method="post">
             <label for="username">Username:</label>
            <input type="text" id="username" name="username"
             required placeholder="Enter your username">

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" 
            required placeholder="Enter your password">

            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
