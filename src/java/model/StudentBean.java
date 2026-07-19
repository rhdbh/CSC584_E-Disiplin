package model;

public class StudentBean {

    private int studentId;
    private String studentName;
    private String matrixNo;
    private String programme;
    private int semester;

    public StudentBean() {
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getMatrixNo() {
        return matrixNo;
    }

    public void setMatrixNo(String matrixNo) {
        this.matrixNo = matrixNo;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }
}
