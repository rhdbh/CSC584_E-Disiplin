package model;

public class LoginBean {

    private String staffID;
    private String password;

    public LoginBean() {
    }

    public LoginBean(String staffID, String password) {
        this.staffID = staffID;
        this.password = password;
    }

    public String getStaffID() {
        return staffID;
    }

    public void setStaffID(String staffID) {
        this.staffID = staffID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}