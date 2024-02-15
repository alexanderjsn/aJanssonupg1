<%@ page import="java.util.List" %>
<%@ page import="org.example.models.student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <link rel="stylesheet" href="css/style.css">

    <title>Title</title>
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
                <a href="student" class="active">Students</a>
            </li>
            <li>
                <a href="course">Courses</a>
            </li>
            <li>
                            <a href="attendance">Admin</a>
                        </li>
        </ul>
    </nav>
    </div>
</header>


<div class="form-container">
    <div class="form1">
  <h2>Search by firstname or surname</h2>
  <form action="student" method="post">
    <label for="searchFName">Förnamn:</label>
    <input type="text" id="searchFName" name="searchFName">
    <br>
     <label for="searchLName">Efternamn:</label>
     <input type="text" id="searchLName" name="searchLName">
     <br>
       <input type="submit" value="Sök">
  </form>
    </div>
    </div>


<div class="tablecontainer">
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
      </div>


</table>


</body>
</html>