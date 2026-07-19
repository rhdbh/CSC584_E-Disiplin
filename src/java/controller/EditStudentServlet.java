package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.StudentBean;
import model.StudentDAO;

@WebServlet("/EditStudentServlet")
public class EditStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentBean student =
                new StudentBean();

        student.setStudentId(
                Integer.parseInt(
                        request.getParameter("studentId")));

        student.setStudentName(
                request.getParameter("studentName"));

        student.setMatrixNo(
                request.getParameter("matrixNo"));

        student.setProgramme(
                request.getParameter("programme"));

        student.setSemester(
                Integer.parseInt(
                        request.getParameter("semester")));

        StudentDAO dao =
                new StudentDAO();

        dao.updateStudent(student);

        response.sendRedirect(
                "ViewStudentServlet");
    }
}
