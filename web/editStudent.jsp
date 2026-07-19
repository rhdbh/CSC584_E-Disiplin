<%@page import="model.StudentDAO"%>
<%@page import="model.StudentBean"%>

<%

    int id = Integer.parseInt(request.getParameter("id"));

    StudentDAO dao = new StudentDAO();

    StudentBean student = dao.getStudentById(id);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student | E-Disiplin</title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
<div class="container">
    <h1>Edit Student</h1>
    
<%
if(student != null){
%>


        <form action="EditStudentServlet" method="post">

        <input type="hidden"
               name="studentId"
               value="<%= student.getStudentId() %>">

        <label>Student Name</label>
        <input type="text"
               name="studentName"
               value="<%= student.getStudentName() %>"
               required>

        <label>Matrix No</label>
        <input type="text"
               name="matrixNo"
               value="<%= student.getMatrixNo() %>"
               required>

        <label>Programme</label>
        <input type="text"
               name="programme"
               value="<%= student.getProgramme() %>"
               required>

        <label>Semester</label>
        <input type="number"
               name="semester"
               value="<%= student.getSemester() %>"
               required>

        <br><br>

        <button type="submit" class="button">
            Update Student
        </button>

    </form>

    <%
    } else {
    %>

    <h3>Student not found!</h3>

    <%
    }
    %>

    <a href="ViewStudentServlet" class="back-btn">
        Back to Student List
    </a>
</div>
</body>
</html>
