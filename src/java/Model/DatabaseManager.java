
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author FV
 */
public class DatabaseManager {

    private Connection conn;
    private Security encryptDecrypt;

    public DatabaseManager(String url, String userName, String pass, String dbDriver, String key) {
        try {
            this.conn = DriverManager.getConnection(url, userName, pass);
            this.encryptDecrypt = new Security(key);
            Class.forName(dbDriver);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException a) {
            a.printStackTrace();
        }
    }

    public ResultSet returnSizeCateg() {
        try {
            String query = "SELECT * FROM PRODUCT_SIZE_TABLE";
            PreparedStatement statement = this.conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            return statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet returnGenderCateg() {
        try {
            String query = "SELECT * FROM PRODUCT_GENDER_TABLE";
            PreparedStatement statement = this.conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            return statement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet returnproductSchool(HttpServletRequest request) {
        String query = "SELECT DISTINCT\n"
                + "PRODUCT_VARIANT_TABLE.PRODUCT_ID,\n"
                + "PRODUCT_TABLE.PRODUCT_NAME,\n"
                + "PRODUCT_TABLE.PRODUCT_DESC,\n"
                + "PRODUCT_TABLE.PRODUCT_SCHOOL,\n"
                + "PRODUCT_TABLE.PRODUCT_IMG_LINK,\n"
                + "PRODUCT_GENDER_TABLE.PRODUCT_GENDER,\n"
                + "PRODUCT_SIZE_TABLE.PRODUCT_SIZE,\n"
                + "PRODUCT_VARIANT_TABLE.PRODUCT_PRICE,\n"
                + "PRODUCT_VARIANT_TABLE.PRODUCT_STOCK\n"
                + "FROM PRODUCT_VARIANT_TABLE\n"
                + "JOIN PRODUCT_TABLE ON PRODUCT_TABLE.PRODUCT_ID = PRODUCT_VARIANT_TABLE.PRODUCT_ID\n"
                + "JOIN PRODUCT_GENDER_TABLE ON PRODUCT_VARIANT_TABLE.PRODUCT_GENDER_ID = PRODUCT_GENDER_TABLE.PRODUCT_GENDER_ID\n"
                + "JOIN PRODUCT_SIZE_TABLE ON PRODUCT_SIZE_TABLE.PRODUCT_SIZE_ID = PRODUCT_VARIANT_TABLE.PRODUCT_SIZE_ID\n"
                + "AND PRODUCT_TABLE.PRODUCT_SCHOOL = ? ";
        try {
            PreparedStatement stmt = this.conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            stmt.setString(1, request.getParameter("action"));
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean signUp(HttpServletRequest request) {
        try {
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirm_password");
            boolean match = password.equals(confirmPassword);
            String role = null;
            switch (request.getParameter("role")) {
                case "customer":
                    role = "customer";
                    break;
                case "administrator":
                    role = "administrator";
                    break;
            }
            if (match) {
                String query = "INSERT INTO USER_TABLE (USER_PASSWORD, USER_ROLE, USER_EMAIL) "
                        + "VALUES (?, ?, ?)";
                PreparedStatement stmt = this.conn.prepareStatement(query);
                stmt.setString(1, this.encryptDecrypt.encrypt(password));
                stmt.setString(2, role);
                stmt.setString(3, request.getParameter("email").trim());
                stmt.executeUpdate();
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean logIn(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();

            String query = "SELECT * FROM USER_TABLE WHERE USER_EMAIL = ?";
            PreparedStatement stmt = this.conn.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            stmt.setString(1, request.getParameter("email"));
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String dbPass = encryptDecrypt.decrypt(rs.getString(2));
                String userInputPass = request.getParameter("password");
                boolean match = dbPass.equals(userInputPass);
                if (match) {
                    session.setAttribute("userid", encryptDecrypt.encrypt(Integer.toString(rs.getInt(1))));
                    session.setAttribute("email", rs.getString(4));
                }
                rs.close();
                stmt.close();
                return match;
            }
            rs.close();
            stmt.close();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (NullPointerException ae) {
            ae.printStackTrace();
            return false;
        }
    }
}
