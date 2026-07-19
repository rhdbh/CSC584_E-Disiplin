<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    response.setHeader("Cache-Control",
            "no-cache, no-store, must-revalidate");

    response.setHeader("Pragma",
            "no-cache");

    response.setDateHeader("Expires", 0);

    if (session.getAttribute("officerEmail") == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/login.jsp");

        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&display=swap"
          rel="stylesheet">

    <title>Main Menu | E-Disiplin</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: "Tinos", serif;

            background-image:
                url("${pageContext.request.contextPath}/img/background.jpg");

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;

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

            width: 950px;
            max-width: 95%;

            box-shadow: 0 0 10px rgba(0, 0, 0, 0.25);
        }

        .page-title {
            text-align: center;
            margin-top: 5px;
            margin-bottom: 10px;
        }

        .welcome-text {
            text-align: center;
            font-size: 18px;
            margin-bottom: 25px;
        }

        .card-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .card-link {
            color: #000000;
            text-decoration: none;
            display: block;
        }

        .card {
            background-color: #f9f9f9;
            min-height: 155px;
            padding: 15px;
            border-radius: 8px;
            text-align: center;

            box-shadow: 0 0 5px rgba(0, 0, 0, 0.65);

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;

            transition:
                transform 0.2s ease,
                box-shadow 0.2s ease,
                background-color 0.2s ease;
        }

        .card:hover {
            background-color: #eef3ff;
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.35);
        }

        .card-img {
            width: 45px;
            height: 45px;
            object-fit: contain;
            margin-bottom: 10px;
        }

        .card-title {
            font-size: 19px;
            font-weight: bold;
            margin: 0;
        }

        .logout-icon {
            width: 45px;
            height: 45px;
            margin-bottom: 10px;
        }

        @media screen and (max-width: 800px) {
            .card-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media screen and (max-width: 500px) {
            .card-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<div class="container">

    <h1 class="page-title">
        Main Menu | E-Disiplin
    </h1>

    <p class="welcome-text">
    Welcome,
    <%= session.getAttribute("officerName") %>

    </p>

    <div class="card-container">

        <!-- Student Management -->
        <a class="card-link"
           href="${pageContext.request.contextPath}/ViewStudentServlet">

            <div class="card">

                <img class="card-img"
                     src="${pageContext.request.contextPath}/img/student.png"
                     alt="Student Management">

                <p class="card-title">
                    Student Management
                </p>

            </div>
        </a>

        <!-- User Management -->
        <a class="card-link"
           href="${pageContext.request.contextPath}/user.html">

            <div class="card">

                <img class="card-img"
                     src="${pageContext.request.contextPath}/img/user.png"
                     alt="User Management">

                <p class="card-title">
                    User Management
                </p>

            </div>
        </a>

        <!-- Offenses Management -->
        <a class="card-link"
           href="${pageContext.request.contextPath}/offense.html">

            <div class="card">

                <img class="card-img"
                     src="${pageContext.request.contextPath}/img/offense.png"
                     alt="Offenses Management">

                <p class="card-title">
                    Offenses Management
                </p>

            </div>
        </a>

        <!-- Counselling Appointment -->
        <a class="card-link"
           href="${pageContext.request.contextPath}/appointment.html">

            <div class="card">

                <img class="card-img"
                     src="${pageContext.request.contextPath}/img/appointment.png"
                     alt="Counselling Appointment">

                <p class="card-title">
                    Counselling Appointment
                </p>

            </div>
        </a>

        <!-- Counselling Log -->
        <a class="card-link"
           href="${pageContext.request.contextPath}/session-list.html">

            <div class="card">

                <img class="card-img"
                     src="${pageContext.request.contextPath}/img/counselling.png"
                     alt="Counselling Log">

                <p class="card-title">
                    Counselling Log
                </p>

            </div>
        </a>

        <!-- Dashboard and Analytics -->
        <a class="card-link"
           href="${pageContext.request.contextPath}/analytics.jsp">

            <div class="card">

                <img class="card-img"
                     src="${pageContext.request.contextPath}/img/dashboard.png"
                     alt="Dashboard and Analytics">

                <p class="card-title">
                    Dashboard &amp; Analytics
                </p>

            </div>
        </a>

        <!-- Reports -->
        <a class="card-link"
           href="#"
           onclick="alert('Reports module is not available yet.'); return false;">

            <div class="card">

                <img class="card-img"
                     src="${pageContext.request.contextPath}/img/report.png"
                     alt="Reports">

                <p class="card-title">
                    Reports
                </p>

            </div>
        </a>

        <!-- Logout -->
        <a class="card-link"
           href="${pageContext.request.contextPath}/LogoutServlet">

            <div class="card">

                <svg class="logout-icon"
                     viewBox="0 0 24 24"
                     fill="none"
                     xmlns="http://www.w3.org/2000/svg">

                    <path d="M10 4H5C4.45 4 4 4.45 4 5V19C4 19.55 4.45 20 5 20H10"
                          stroke="#000000"
                          stroke-width="2"
                          stroke-linecap="round"/>

                    <path d="M14 8L18 12L14 16"
                          stroke="#000000"
                          stroke-width="2"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>

                    <path d="M18 12H9"
                          stroke="#000000"
                          stroke-width="2"
                          stroke-linecap="round"/>

                </svg>

                <p class="card-title">
                    Logout
                </p>

            </div>
        </a>

    </div>

</div>

</body>

</html>
