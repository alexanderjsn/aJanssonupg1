package org.example.models;

import org.example.utils.DBconnector;
import org.example.models.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class courseDAO {

    // sql kommands



    // hämta data
    private static final String GET_COURSES = "SELECT * FROM courses;";

    // skicka data

    // ta bort data


    //tar in java beans student klass
    public List<Course> getCourse() {

        // lista för student data som kan sättas in överallt i kod
        List<Course> courses = new ArrayList<>();
        // hämtar connection instans för att ansluta
        try (Connection connection = DBconnector.getConnection();
             // inj säkert statement
             PreparedStatement pstmt = connection.prepareStatement(GET_COURSES);
             // hämtar resultat av query
             ResultSet rs = pstmt.executeQuery()){

            // hämtar data
            while(rs.next()){
                int courseId = rs.getInt("course_id");
                String name = rs.getString("name");
                int yhp = rs.getInt("YHP");
                String description = rs.getString("description");
                courses.add(new Course(courseId,name,yhp,description));
            }
        }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return courses;
    }}