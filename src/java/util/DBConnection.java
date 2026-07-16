package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL
            = "jdbc:derby://localhost:1527/edisiplin";

    private static final String USERNAME = "app";
    private static final String PASSWORD = "app";

    public static Connection getConnection() throws SQLException {

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                    "Apache Derby JDBC Driver not found.",
                    e
            );
        }

        return DriverManager.getConnection(
                URL,
                USERNAME,
                PASSWORD
        );
    }
}