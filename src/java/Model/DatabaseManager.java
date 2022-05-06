/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author FV
 */
public class DatabaseManager {

    private Connection conn;

    public DatabaseManager(String userName, String pass, String url, String dbDriver) {
        try {
            this.conn = DriverManager.getConnection(userName, pass, url);
            Class.forName(dbDriver);
        }
        catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
