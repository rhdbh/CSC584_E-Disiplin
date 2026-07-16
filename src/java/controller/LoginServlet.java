package controller;

import dao.LoginDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.LoginBean;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String staffID = request.getParameter("staffID");
        String password = request.getParameter("password");

        LoginBean loginBean = new LoginBean(staffID, password);

        LoginDAO loginDAO = new LoginDAO();

        if (loginDAO.validateLogin(loginBean)) {

            HttpSession session = request.getSession();
            session.setAttribute("loggedUser", loginBean);

            response.sendRedirect(
                    request.getContextPath() + "/dashboard.jsp"
            );

        } else {

            request.setAttribute(
                    "errorMessage",
                    "Invalid Staff ID/email or password."
            );

            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
        }
    }
}