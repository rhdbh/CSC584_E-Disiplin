package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String officerEmail =
                request.getParameter("officerEmail");

        String password =
                request.getParameter("password");

        System.out.println("Email = " + officerEmail);
        System.out.println("Password = " + password);

        try {

            Connection conn =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM HEP_OFFICER "
                    + "WHERE OFFICER_EMAIL=? "
                    + "AND OFFICER_PASSWORD=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setString(1, officerEmail);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if (rs.next()) {

                System.out.println("LOGIN SUCCESS");

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "officerId",
                        rs.getInt("OFFICER_ID"));

                session.setAttribute(
                        "officerName",
                        rs.getString("OFFICER_NAME"));

                session.setAttribute(
                        "officerEmail",
                        rs.getString("OFFICER_EMAIL"));

                response.sendRedirect("dashboard.jsp");

            } else {

                System.out.println("LOGIN FAILED");

                request.setAttribute(
                        "errorMessage",
                        "Invalid email or password!");

                request.getRequestDispatcher(
                        "login.jsp")
                        .forward(request, response);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Login error: " + e.getMessage());

            request.getRequestDispatcher(
                    "login.jsp")
                    .forward(request, response);
        }
    }
}
