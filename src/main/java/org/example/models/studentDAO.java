package org.example.models;

import org.example.utils.DBconnector;
import org.example.models.student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class studentDAO {

    // sql kommands

    // hämta data
    private static final String GET_STUDENTS = "SELECT * FROM students;";


    private static final String SEARCH_STUDENTS = "SELECT * FROM students WHERE Fname LIKE ? OR Lname LIKE ?";


    public studentDAO(int id, String fname, String lname, String city, String hobby) {
    }

    public studentDAO() {

    }


        public List<student> searchStudent(String searchFname, String searchLname)  {
           List<student> searchStudents = new ArrayList<>();

        try (Connection connection = DBconnector.getConnection();

             PreparedStatement pstmt = connection.prepareStatement(SEARCH_STUDENTS)) {
             pstmt.setString(1,"%" + searchFname + "%");
             pstmt.setString(2,"%" + searchLname + "%");
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                int id = rs.getInt("student_id");
                String Fname = rs.getString("Fname");
                String Lname = rs.getString("Lname");
                String city = rs.getString("city");
                String hobby = rs.getString("hobby");
                searchStudents.add(new student(id,Fname,Lname,city,hobby));
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return searchStudents;
    }

    //tar in java beans student klass
    public List<student> getStudents()  {

        // lista för student data som kan sättas in överallt i kod
        List<student> students = new ArrayList<>();
        // hämtar connection instans för att ansluta
        try (Connection connection = DBconnector.getConnection();
             // inj säkert statement
             PreparedStatement pstmt = connection.prepareStatement(GET_STUDENTS);
             // hämtar resultat av query
             ResultSet rs = pstmt.executeQuery()){

            // hämtar data
            while(rs.next()){
                int student_id = rs.getInt("student_id");
                String fname = rs.getString("Fname");
                String lname = rs.getString("Lname");
                String city = rs.getString("city");
                String hobby = rs.getString("hobby");

                students.add(new student(student_id,fname,lname,city,hobby));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return students;
    }



}


