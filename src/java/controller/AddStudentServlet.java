package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.StudentBean;
import model.StudentDAO;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            StudentBean student = new StudentBean();

            student.setStudentName(
                    request.getParameter("studentName"));

            student.setMatrixNo(
                    request.getParameter("matrixNo"));

            student.setProgramme(
                    request.getParameter("programme"));

            student.setSemester(
                    Integer.parseInt(
                            request.getParameter("semester")));

            StudentDAO dao = new StudentDAO();

            boolean status = dao.addStudent(student);

            if (status) {
                response.sendRedirect("ViewStudentServlet");
            } else {
                response.getWriter().println(
                        "Failed to insert student.");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "Error: " + e.getMessage());
        }
    }
}
