
package com.campusconnect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        StudentDAO dao = new StudentDAO();

        if (email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()) {

            response.sendRedirect("student-login.jsp?error=invalid");
            return;
        }

        if (dao.validateLogin(email.trim(), password)) {

            HttpSession session = request.getSession();
            session.setAttribute("studentEmail", email.trim());

            response.sendRedirect("student-dashboard.jsp");

        } else {
            response.sendRedirect("student-login.jsp?error=invalid");
        }
    }
}
