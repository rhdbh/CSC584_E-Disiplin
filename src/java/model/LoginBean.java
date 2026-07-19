package model;

public class LoginBean {

    private String officerEmail;
    private String password;

    public LoginBean() {
    }

    public LoginBean(String officerEmail, String password) {
        this.officerEmail = officerEmail;
        this.password = password;
    }

    public String getOfficerEmail() {
        return officerEmail;
    }

    public void setOfficerEmail(String officerEmail) {
        this.officerEmail = officerEmail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
