package com.campusconnect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentRegisterServlet")
public class StudentRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String enrollmentNo = request.getParameter("enrollment_no");
        String branch = request.getParameter("branch");
        String semesterValue = request.getParameter("semester");

        String contextPath = request.getContextPath();

        try {

            // Check whether all fields are filled
            if (name == null || name.trim().isEmpty()
                    || email == null || email.trim().isEmpty()
                    || password == null || password.trim().isEmpty()
                    || enrollmentNo == null || enrollmentNo.trim().isEmpty()
                    || branch == null || branch.trim().isEmpty()
                    || semesterValue == null || semesterValue.trim().isEmpty()) {

                response.sendRedirect(
                        contextPath + "/student-register.jsp?error=empty");
                return;
            }

            // Validate semester
            int semester = Integer.parseInt(semesterValue);

            if (semester < 1 || semester > 8) {

                response.sendRedirect(
                        contextPath + "/student-register.jsp?error=semester");
                return;
            }

            // Create student object
            Student student = new Student(
                    name.trim(),
                    email.trim(),
                    password,
                    enrollmentNo.trim(),
                    branch,
                    semester
            );

            // Register student using DAO
            StudentDAO dao = new StudentDAO();

            if (dao.registerStudent(student)) {

                response.sendRedirect(
                        contextPath + "/student-register.jsp?success=true");

            } else {

                response.sendRedirect(
                        contextPath + "/student-register.jsp?error=failed");
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    contextPath + "/student-register.jsp?error=semester");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    contextPath + "/student-register.jsp?error=failed");
        }
    }
}
