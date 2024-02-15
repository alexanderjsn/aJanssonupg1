<%@ page import="java.util.List" %>
<%@ page import="org.example.models.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
                <a href="index.html" >Home</a>
            </li>
            <li>
                <a href="student">Students</a>
            </li>
            <li>
                <a href="course" class="active">Courses</a>
            </li>
            <li>
                            <a href="attendance">Admin</a>
                        </li>
        </ul>
    </nav>
    </div>
</header>



<div class="tablecontainer">
    <div class="box">
        <h2>Kurser</h2>
<table border="1">
    <tr>
        <th>Kurs-ID</th>
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
        </div>
    </div>


</table>
</body>
</html>