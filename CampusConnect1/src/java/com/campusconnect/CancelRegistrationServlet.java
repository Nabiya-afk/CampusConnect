package com.campusconnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CancelRegistrationServlet")
public class CancelRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("studentEmail") == null) {
            response.sendRedirect("student-login.jsp");
            return;
        }

        String email = (String) session.getAttribute("studentEmail");
        String registrationIdText =
                request.getParameter("registrationId");

        try {
            int registrationId =
                    Integer.parseInt(registrationIdText);

            String sql =
                    "UPDATE registrations r "
                    + "JOIN students s ON r.student_id = s.student_id "
                    + "SET r.status = 'CANCELLED' "
                    + "WHERE r.registration_id = ? "
                    + "AND s.email = ? "
                    + "AND r.status = 'REGISTERED'";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                ps.setInt(1, registrationId);
                ps.setString(2, email);

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect(
                            "MyRegistrationsServlet?message=cancelled");
                } else {
                    response.sendRedirect(
                            "MyRegistrationsServlet?message=failed");
                }
            }

        } catch (NumberFormatException e) {

            response.sendRedirect(
                    "MyRegistrationsServlet?message=invalid");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "MyRegistrationsServlet?message=failed");
        }
    }
}