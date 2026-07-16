<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&display=swap"
          rel="stylesheet">

    <title>Welcome | E-Disiplin</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: "Tinos", serif;

            background-image:
                url("<%= request.getContextPath() %>/img/background.jpg");

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;

            margin: 0;
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;

            width: 700px;
            max-width: 90%;

            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .header {
            text-align: center;
        }

        .card-img {
            width: 20%;
            height: auto;
            object-fit: contain;
            margin-bottom: 5px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input {
            width: 100%;
            margin: 8px 0 15px;
            padding: 10px;

            border: 1px solid #cccccc;
            border-radius: 5px;

            font-family: "Tinos", serif;
            font-size: 15px;
        }

        input:focus {
            outline: none;
            border-color: #527FFA;
            box-shadow: 0 0 4px rgba(82, 127, 250, 0.5);
        }

        .button-container {
            text-align: center;
            margin-top: 10px;
        }

        .button {
            font-family: "Tinos", serif;
            font-size: 15px;

            background-color: #527FFA;
            color: #ffffff;

            padding: 10px 20px;
            border-radius: 5px;

            cursor: pointer;
            border: none;
        }

        .button:hover {
            background-color: #2C4485;
        }

        .error-message {
            color: red;
            text-align: center;
            font-weight: bold;
            min-height: 20px;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="header">

        <img src="<%= request.getContextPath() %>/img/logo.png"
             alt="E-Disiplin Logo"
             class="card-img">

        <h1>Welcome to E-Disiplin!</h1>

        <p>Login to your account</p>

    </div>

    <div class="error-message">
        ${requestScope.errorMessage}
    </div>

    <form id="loginForm"
          action="<%= request.getContextPath() %>/LoginServlet"
          method="post">

        <label for="staffID">
            Staff ID / Email
        </label>

        <input type="email"
               id="staffID"
               name="staffID"
               placeholder="Enter your staff email"
               autocomplete="username"
               required>

        <label for="password">
            Password
        </label>

        <input type="password"
               id="password"
               name="password"
               placeholder="Enter your password"
               autocomplete="current-password"
               required>

        <div class="button-container">

            <button type="submit"
                    class="button">
                → LOGIN
            </button>

        </div>

    </form>

</div>

</body>

</html>