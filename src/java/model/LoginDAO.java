package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.LoginBean;
import util.DBConnection;

public class LoginDAO {

    public boolean validateLogin(LoginBean loginBean) {

        String sql = "SELECT * FROM APP_USER "
                   + "WHERE STAFF_EMAIL = ? "
                   + "AND USER_PASSWORD = ?";

        try (
            Connection connection = DBConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, loginBean.getStaffID());
            statement.setString(2, loginBean.getPassword());

            try (ResultSet result = statement.executeQuery()) {
                return result.next();
            }

        } catch (SQLException e) {
            System.out.println("Login database error: " + e.getMessage());
            return false;
        }
    }
}
