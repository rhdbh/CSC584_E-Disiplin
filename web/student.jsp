<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.StudentBean"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student List | E-Disiplin</title>
    <link rel="stylesheet" href="css/styles.css">
</head>


<body>


<div class="container">


<h1>Student List</h1>


<table>


<thead>

<tr>

<th>ID</th>
<th>Student Name</th>
<th>Matrix No</th>
<th>Programme</th>
<th>Semester</th>
<th>Actions</th>

</tr>

</thead>



<tbody>


<%

List<StudentBean> list =
        (List<StudentBean>) request.getAttribute("studentList");


if(list != null){

    for(StudentBean s : list){

%>
<tr>
<td>
<%= s.getStudentId() %>
</td>
<td>
<%= s.getStudentName() %>
</td>
<td>
<%= s.getMatrixNo() %>
</td>
<td>
<%= s.getProgramme() %>
</td>
<td>
<%= s.getSemester() %>
</td>
<td>
<a href="editStudent.jsp?id=<%= s.getStudentId() %>" class="action-btn edit-btn">
        Edit
    </a>


<a href="DeleteStudentServlet?id=<%= s.getStudentId() %>"
   class="action-btn delete-btn"
   onclick="return confirm('Delete this student?')">
    Delete
</a>
</td>
</tr>
<%

    }

}

%>
</tbody>
</table>
<div class="nav-link">
<a href="addStudent.jsp" class="button">Add New Student</a>
</div>
</div>
</body>
</html>
