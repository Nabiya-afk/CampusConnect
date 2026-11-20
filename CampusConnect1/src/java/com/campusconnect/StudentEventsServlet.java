
package com.campusconnect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StudentEventsServlet")
public class StudentEventsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("studentEmail") == null) {
            response.sendRedirect("student-login.jsp");
            return;
        }

        String email = (String) session.getAttribute("studentEmail");

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT name FROM students WHERE email = ?";

            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, email);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("studentName", rs.getString("name"));
                    } else {
                        response.sendRedirect("student-login.jsp");
                        return;
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to load student details.");
            return;
        }

        EventDAO dao = new EventDAO();
        List<Event> events = dao.getAllEvents();

        request.setAttribute("eventsList", events);

        request.getRequestDispatcher("student-events.jsp")
                .forward(request, response);
    }
}
