<%@ page import="java.util.List" %>
<%@ page import="org.example.models.Course" %>
<%@ page import="org.example.models.student" %>
<%@ page import="org.example.models.association" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="/script/script.js"></script>
    <title>Title</title>
        <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
<div class="header">
    <h1 class="logo">Grit Academy</h1>
    <nav>
        <ul id="menu">
            <li>
                <a href="index.html">Home</a>
            </li>
            <li>
                <a href="student">Students</a>
            </li>
            <li>
                <a href="course">Courses</a>
            </li>
            <li>
                            <a href="attendance" class="active">Admin</a>
                        </li>
        </ul>
    </nav>
    </div>
</header>



<div class="tablecontainer">
    <div class="box">

    <h2>Kurser</h2>
    <table border="1" id="courses">
        <tr>
            <th>ID</th>
            <th>Namn</th>
            <th>YHP</th>
            <th>Beskrivning</th>
        </tr>
        <% List<Course> courseList = (List<Course>) request.getAttribute("courseList");
          for (Course course : courseList) { %>
            <tr>
                <td><%= course.getCourseId() %></td>
                <td><%= course.getName() %></td>
                <td><%= course.getYhp() %></td>
                <td><%= course.getDescription() %></td>
            </tr>
            <% } %>
    </table>
    </div>
    <div class="box">

    <h2>Elever</h2>
    <table border="1" id="students">
        <tr>
            <th>Id</th>
            <th>First Names</th>
            <th>Last Name</th>
            <th>City</th>
            <th>Hobby</th>
        </tr>
        <% List<student> students = (List<student>) request.getAttribute("students");
          for (student student : students) { %>
          <tr>
                    <td><%= student.getStudent_id() %></td>
                    <td><%= student.getFname() %></td>
                    <td><%= student.getLname() %></td>
                    <td><%= student.getCity() %></td>
                    <td><%= student.getHobby() %></td>
          </tr>
          <% } %>
          </table>
    </div>
    <div class="box">
        <h2>Association</h2>
       <table border="1" id="association">
              <tr>
                  <th>Association ID</th>
                  <th>Student ID</th>
                  <th>Kurs ID</th>
              </tr>
              <% List<association> associationList = (List<association>) request.getAttribute("associationList");
                 for (association association : associationList) { %>

                  <tr>
                       <td><%= association.getId() %></td>
                        <td><%= association.getStudentId() %></td>
                       <td><%= association.getCourseId() %></td>
                  </tr>
                  <% } %>
          </table>
    </div>
</div>

</body>
</html>
