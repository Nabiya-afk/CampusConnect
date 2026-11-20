
package com.campusconnect;

public class Student {

    private String name;
    private String email;
    private String password;
    private String enrollmentNo;
    private String branch;
    private int semester;

    public Student(String name, String email, String password,
                   String enrollmentNo, String branch, int semester) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.enrollmentNo = enrollmentNo;
        this.branch = branch;
        this.semester = semester;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getEnrollmentNo() {
        return enrollmentNo;
    }

    public String getBranch() {
        return branch;
    }

    public int getSemester() {
        return semester;
    }
}
