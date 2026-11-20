
package com.campusconnect;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty()
                || password == null || password.isEmpty()) {

            response.sendRedirect("admin-login.jsp?error=invalid");
            return;
        }

        AdminDAO dao = new AdminDAO();

        Admin admin = dao.validateLogin(email.trim(), password);

        if (admin != null) {

            HttpSession session = request.getSession();
            session.setAttribute("adminId", admin.getAdminId());
            session.setAttribute("adminName", admin.getName());
            session.setAttribute("adminEmail", admin.getEmail());

            response.sendRedirect("admin-dashboard.jsp");

        } else {
            response.sendRedirect("admin-login.jsp?error=invalid");
        }
    }
}
