# CampusConnect – College Event Management System

## 1. Project Description

CampusConnect is a web-based College Event Management System developed to simplify the process of managing college events and student registrations.

The application provides separate modules for students and administrators. Students can create accounts, log in, browse upcoming events, register for events and view their registration history.

Administrators can log in, add events, update event details, delete events and view registered participants.

## 2. Technologies and Tools Used

- Java
- JSP (JavaServer Pages)
- Java Servlets
- JDBC
- MySQL
- HTML
- CSS
- JavaScript
- Apache NetBeans
- Apache Tomcat
- XAMPP
- MySQL Connector/J

## 3. Features and Functionalities

### Student Module
- Student registration
- Student login and logout
- Student dashboard
- Browse upcoming events
- Register for events
- View event registration history
- Duplicate registration checking
- Event capacity checking

### Administrator Module
- Administrator login and logout
- Admin dashboard
- Add new events
- View and manage events
- Update event details
- Delete events
- View registered participants

## 4. Project Structure

The project is maintained in the `CampusConnect1` NetBeans web application folder.

It contains:
- Java source files and Servlets
- JSP and HTML pages
- CSS and JavaScript resources
- WEB-INF configuration
- NetBeans project configuration
- Required libraries

## 5. Software Requirements

- JDK 17
- Apache NetBeans
- Apache Tomcat compatible with the application's `javax.servlet` API
- XAMPP / MySQL Server
- MySQL Connector/J

## 6. Database Setup Instructions

1. Install and open XAMPP.
2. Start Apache and MySQL services.
3. Open phpMyAdmin.
4. Create or import the `campusconnect` database.
5. Import the provided `campusconnect.sql` file.
6. Verify that the required tables are available:
   - admins
   - students
   - events
   - registrations

## 7. Installation and Execution Instructions

1. Download or clone this repository.
2. Open Apache NetBeans.
3. Select File → Open Project.
4. Open the `CampusConnect1` project folder.
5. Add the MySQL Connector/J library if it is not already configured.
6. Check the database connection settings in the JDBC connection class.
7. Ensure that the database name and credentials match your local MySQL configuration.
8. Configure the compatible Apache Tomcat server in NetBeans.
9. Clean and Build the project.
10. Run the project using NetBeans.
11. Open the application in your browser.

## 8. Screenshots

Application screenshots are included in the project documentation. Additional screenshots can be added to a repository folder named `screenshots`.

## 9. GitHub Repository

https://github.com/Nabiya-afk/CampusConnect

## 10. Deployment

The deployed application URL will be added after successful deployment and testing.

## 11. Conclusion

CampusConnect provides a centralized platform for managing college events and student participation using JSP, Java Servlets, JDBC and MySQL.
