package com.campusconnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {

    // CREATE - Add Event
    public boolean addEvent(Event event) {

        String sql = "INSERT INTO events "
                + "(event_name, description, event_date, venue, max_participants, admin_id) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, event.getEventName());
            ps.setString(2, event.getDescription());
            ps.setString(3, event.getEventDate());
            ps.setString(4, event.getVenue());
            ps.setInt(5, event.getMaxParticipants());
            ps.setInt(6, event.getAdminId());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            System.out.println("Database error while adding event:");
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Message: " + e.getMessage());

            return false;
        }
    }

    // READ - Get all Events
    public List<Event> getAllEvents() {

        List<Event> events = new ArrayList<>();

        String sql = "SELECT * FROM events";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Event event = new Event();

                event.setEventId(rs.getInt("event_id"));
                event.setEventName(rs.getString("event_name"));
                event.setDescription(rs.getString("description"));
                event.setEventDate(rs.getString("event_date"));
                event.setVenue(rs.getString("venue"));
                event.setMaxParticipants(rs.getInt("max_participants"));
                event.setAdminId(rs.getInt("admin_id"));

                events.add(event);
            }

        } catch (SQLException e) {

            System.out.println("Database error while retrieving events:");
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Message: " + e.getMessage());
        }

        return events;
    }

    // UPDATE - Edit Event
    public boolean updateEvent(Event event) {

        String sql = "UPDATE events SET "
                + "event_name=?, description=?, event_date=?, venue=?, "
                + "max_participants=?, admin_id=? "
                + "WHERE event_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, event.getEventName());
            ps.setString(2, event.getDescription());
            ps.setString(3, event.getEventDate());
            ps.setString(4, event.getVenue());
            ps.setInt(5, event.getMaxParticipants());
            ps.setInt(6, event.getAdminId());
            ps.setInt(7, event.getEventId());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            System.out.println("Database error while updating event:");
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Message: " + e.getMessage());

            return false;
        }
    }

    // DELETE - Delete Event
    public boolean deleteEvent(int eventId) {

        String sql = "DELETE FROM events WHERE event_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, eventId);

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (SQLException e) {

            System.out.println("Database error while deleting event:");
            System.out.println("Error Code: " + e.getErrorCode());
            System.out.println("SQL State: " + e.getSQLState());
            System.out.println("Message: " + e.getMessage());

            return false;
        }
    }
}