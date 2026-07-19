<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css">
    <title>Welcome | E-Disiplin</title>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="<%= request.getContextPath() %>/img/logo.png" alt="E-Disiplin Logo" class="logo-img">
        <h1>Welcome to E-Disiplin!</h1>
        <p>Please login to your account.</p>
    </div>
    <div class="error-message">
        ${requestScope.errorMessage}
    </div>
    <form id="loginForm" action="<%= request.getContextPath() %>/LoginServlet" method="post">
        <label for="officerEmail">
            Officer Email
        </label>
        <input type="email" id="officerEmail" name="officerEmail" placeholder="Enter your officer email" autocomplete="username" required>
        <label for="password">
            Password
        </label>
        <input type="password" id="password" name="password" placeholder="Enter your password" autocomplete="current-password" required>
        <div class="button-container">
            <button type="submit" class="button">
                LOGIN
            </button>
        </div>
    </form>
</div>
</body>
</html>
