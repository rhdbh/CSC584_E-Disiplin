package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;

public class StudentDAO {

    private Connection conn;

    public StudentDAO() {
        conn = DBConnection.getConnection();
    }
    
public boolean addStudent(StudentBean student) {

    boolean status = false;

    try {

        String sql = "INSERT INTO STUDENT "
                + "(STUDENT_NAME, MATRIX_NO, PROGRAMME, SEMESTER) "
                + "VALUES (?, ?, ?, ?)";

        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, student.getStudentName());
        ps.setString(2, student.getMatrixNo());
        ps.setString(3, student.getProgramme());
        ps.setInt(4, student.getSemester());

        int rows = ps.executeUpdate();

        status = rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
}
    
public StudentBean getStudentById(int id) {

    StudentBean student = new StudentBean();

    try {

        String sql =
                "SELECT * FROM STUDENT WHERE STUDENT_ID=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            student.setStudentId(
                    rs.getInt("STUDENT_ID"));

            student.setStudentName(
                    rs.getString("STUDENT_NAME"));

            student.setMatrixNo(
                    rs.getString("MATRIX_NO"));

            student.setProgramme(
                    rs.getString("PROGRAMME"));

            student.setSemester(
                    rs.getInt("SEMESTER"));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return student;
    }

public boolean updateStudent(StudentBean student) {

    boolean status = false;

    try {

        String sql =
                "UPDATE STUDENT "
                + "SET STUDENT_NAME=?, "
                + "MATRIX_NO=?, "
                + "PROGRAMME=?, "
                + "SEMESTER=? "
                + "WHERE STUDENT_ID=?";

        PreparedStatement ps =
                conn.prepareStatement(sql);

        ps.setString(1,
                student.getStudentName());

        ps.setString(2,
                student.getMatrixNo());

        ps.setString(3,
                student.getProgramme());

        ps.setInt(4,
                student.getSemester());

        ps.setInt(5,
                student.getStudentId());

        int rows = ps.executeUpdate();
        System.out.println("Rows updated = " + rows);
        status = rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return status;
    }

    public List<StudentBean> getAllStudents() {

        List<StudentBean> list = new ArrayList<StudentBean>();

        try {

            String sql = "SELECT * FROM STUDENT";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                StudentBean student = new StudentBean();

                student.setStudentId(
                        rs.getInt("STUDENT_ID"));

                student.setStudentName(
                        rs.getString("STUDENT_NAME"));

                student.setMatrixNo(
                        rs.getString("MATRIX_NO"));

                student.setProgramme(
                        rs.getString("PROGRAMME"));

                student.setSemester(
                        rs.getInt("SEMESTER"));

                list.add(student);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean deleteStudent(int studentId) {

        boolean status = false;

        try {

            String sql =
                    "DELETE FROM STUDENT WHERE STUDENT_ID=?";

            PreparedStatement ps =
                    conn.prepareStatement(sql);

            ps.setInt(1, studentId);

            int rows = ps.executeUpdate();
            System.out.println("Rows deleted = " + rows);
            status = rows > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}

