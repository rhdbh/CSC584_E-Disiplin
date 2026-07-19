package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.StudentDAO;

@WebServlet("/ViewStudentServlet")
public class ViewStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        StudentDAO dao = new StudentDAO();

        request.setAttribute(
                "studentList",
                dao.getAllStudents());

        RequestDispatcher rd =
                request.getRequestDispatcher("student.jsp");

        rd.forward(request, response);
    }
}
