<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management | E-Disiplin</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<div class="container">

    <h1>Student Management</h1>

    <form action="AddStudentServlet" method="post">

        <input type="text"
               id="studentName"
               name="studentName"
               placeholder="Student Name"
               required>

        <input type="text"
               id="programme"
               name="programme"
               placeholder="Programme"
               required>

        <input type="text"
               id="matrixNo"
               name="matrixNo"
               placeholder="Matrix Number"
               required>

        <select id="semester"
                name="semester"
                required>

            <option value="">Select Semester</option>
            <option value="1">Semester 1</option>
            <option value="2">Semester 2</option>
            <option value="3">Semester 3</option>
            <option value="4">Semester 4</option>
            <option value="5">Semester 5</option>
            <option value="6">Semester 6</option>
            <option value="7">Semester 7</option>
            <option value="8">Semester 8</option>
            <option value="9">Semester 9</option>
            <option value="10">Semester 10</option>

        </select>

        <br><br>

        <button type="submit" class="button">
            Add Student
        </button>

    </form>

    <a href="ViewStudentServlet" class="back-btn">
        View Student List
    </a>

</div>

</body>
</html>
