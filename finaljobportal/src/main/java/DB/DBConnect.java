/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
//import java.sql.Driver;
import java.sql.DriverManager;

/**
 *
 * @author KUSH
 */
public class DBConnect {

    private static Connection conn;

    public static Connection getConn() {
        try {
            if (conn == null) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myjobportal", "root", "12345");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}
