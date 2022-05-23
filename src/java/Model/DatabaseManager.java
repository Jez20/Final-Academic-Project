
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.http.HttpSession;

/**
 *
 * @author FV
 */
public class DatabaseManager {

    private Connection conn;
    private Security encryptDecrypt;
    private Queries query;
    private ConstantCateg savedCategSizeandGender;

    public DatabaseManager(String url, String userName, String pass, String dbDriver, String key) {
        try {
            this.conn = DriverManager.getConnection(url, userName, pass);
            this.encryptDecrypt = new Security(key);
            this.savedCategSizeandGender = new ConstantCateg(returnSizeCateg(), returnGenderCateg());
            Class.forName(dbDriver);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException a) {
            a.printStackTrace();
        }
    }

    public ResultSet returnSizeCateg() {
        try {
            query = Queries.valueOf("returnSizeCateg");
            PreparedStatement statement = this.conn.prepareStatement(query.getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            return statement.executeQuery();
        } catch (SQLException e) {
            return null;
        }
    }

    public ResultSet returnGenderCateg() {
        try {
            query = Queries.valueOf("returnGenderCateg");
            PreparedStatement statement = this.conn.prepareStatement(query.getQuery(),
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);

            return statement.executeQuery();
        } catch (SQLException e) {
            return null;
        }
    }

    public ResultSet returnProductList() {
        try {
            query = Queries.valueOf("returnProductList");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(),
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery();
            return rs;

        } catch (Exception e) {
            return null;
        }

    }

    public ResultSet returnProductVariation(HttpServletRequest request) {
        try {
            query = Queries.valueOf("returnProductVariation");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(),
                    ResultSet.TYPE_SCROLL_INSENSITIVE,
                    ResultSet.CONCUR_READ_ONLY);
            stmt.setInt(1, Integer.parseInt(request.getParameter("productid")));
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean deleteProduct(HttpServletRequest request) {
        try {
            query = Queries.valueOf("deleteProductinVarition");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            stmt.setInt(1, Integer.parseInt(request.getParameter("productid")));
            stmt.executeUpdate();

            query = Queries.valueOf("deleteProduct");
            stmt = this.conn.prepareStatement(query.getQuery());
            stmt.setInt(1, Integer.parseInt(request.getParameter("productid")));
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteProductVariation(HttpServletRequest request) {
        try {
            query = Queries.valueOf("deleteProductVariation");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            stmt.setInt(1, Integer.parseInt(request.getParameter("variantid"))); //variant id
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean addProduct(HttpServletRequest request) {
        try {
            query = Queries.valueOf("addProduct");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(), Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, request.getParameter("productname"));
            stmt.setString(2, request.getParameter("productdesc"));
            stmt.setString(3, request.getParameter("productschool"));
            stmt.setString(4, request.getParameter("productcategory"));
            stmt.setString(5, request.getParameter("imgLink"));
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            int result = 0;
            if (rs.next()) {
                result = rs.getInt(1);
            }
            query = Queries.valueOf("addProductVariation");
            stmt = this.conn.prepareStatement(query.getQuery(), Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, result);
            stmt.setInt(2, savedCategSizeandGender.getGenderLabeltoIndex(request.getParameter("gender")));
            stmt.setInt(3, savedCategSizeandGender.getSizeLabeltoIndex(request.getParameter("size")));
            stmt.setInt(4, Integer.parseInt(request.getParameter("productprice")));
            stmt.setInt(5, Integer.parseInt(request.getParameter("productstock")));
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addProductVariation(HttpServletRequest request) {
        try {
            query = Queries.valueOf("addProductVariation");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(), Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, Integer.parseInt(request.getParameter("productid"))); //product id
            stmt.setInt(2, savedCategSizeandGender.getGenderLabeltoIndex(request.getParameter("productgender"))); //gender id
            stmt.setInt(3, savedCategSizeandGender.getSizeLabeltoIndex(request.getParameter("productsize"))); //product size id
            stmt.setInt(4, Integer.parseInt(request.getParameter("productprice"))); //product price
            stmt.setInt(5, Integer.parseInt(request.getParameter("productstock"))); // product stock
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean updateProduct(HttpServletRequest request) {
        try {
            query = Queries.valueOf("updateProduct");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            stmt.setString(1, request.getParameter("productname")); //product name
            stmt.setString(2, request.getParameter("productdescription")); //product desc
            stmt.setString(3, request.getParameter("productschool")); //school
            stmt.setString(4, request.getParameter("productcategory")); //category
            stmt.setString(5, request.getParameter("productimglink")); //img link
            stmt.setInt(6, Integer.parseInt(request.getParameter("productid"))); //product id
            stmt.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean insertNewOrder(HttpServletRequest request) {
        try {
            query = Queries.valueOf("insertnewOrder");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            stmt.setInt(1, 0); //user id
            stmt.setString(2, ""); //order name
            stmt.setInt(3, 0);//order quantity
            stmt.setInt(4, 0);//order price
            stmt.setString(5, "");//order address
            LocalDate date = LocalDate.now();
            stmt.setDate(6, Date.valueOf(date));//order date 
            stmt.setDate(7, null);//order date completed
            stmt.setBoolean(8, false); //is paid
            stmt.setString(9, ""); //img link
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean updateProductVariation(HttpServletRequest request) {
        try {
            query = Queries.valueOf("updateProductVariation");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            System.out.println(this.savedCategSizeandGender);
            System.out.println("product size: " + request.getParameter("productsize") );
            stmt.setInt(1, savedCategSizeandGender.getGenderLabeltoIndex(request.getParameter("productgender"))); //gender id
            stmt.setInt(2, savedCategSizeandGender.getSizeLabeltoIndex(request.getParameter("productsize"))); // size id
            stmt.setInt(3, Integer.parseInt(request.getParameter("productprice"))); // product price
            stmt.setInt(4, Integer.parseInt(request.getParameter("productstock"))); // product stock
            stmt.setInt(5, Integer.parseInt(request.getParameter("variantid"))); // variant id
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean updateOrder(HttpServletRequest request) {
        try {
            query = Queries.valueOf("updateOrder");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            stmt.setDate(1, null); //date completed
            stmt.setBoolean(2, true); //is paid
            stmt.setInt(3, -999); //order id
            stmt.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ResultSet applyFilter(HttpServletRequest request) {

        query = Queries.valueOf("querywithSize");
        int[] priceRange = new int[]{0, 999999};
        String selectedPriceRange = request.getParameter("price");
        boolean withOutSize = request.getParameter("size").equals("");
        if (withOutSize) {
            query = Queries.valueOf("querywithOutSize");
        }
        switch (selectedPriceRange) {
            case "100-300":
                priceRange[0] = 100;
                priceRange[1] = 300;
                break;
            case "300-600":
                priceRange[0] = 300;
                priceRange[1] = 600;
                break;
            case "600-900":
                priceRange[0] = 600;
                priceRange[1] = 900;
                break;
            case "900-1200":
                priceRange[0] = 900;
                priceRange[1] = 1200;
                break;
            case "1200-1500":
                priceRange[0] = 1200;
                priceRange[1] = 999999;
                break;
        }
        if (withOutSize) {
            try {
                PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                stmt.setString(1, "%" + request.getParameter("gender") + "%");
                stmt.setInt(2, priceRange[0]);
                stmt.setInt(3, priceRange[1]);
                stmt.setString(4, "%" + request.getParameter("university") + "%");
                ResultSet rs = stmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        } else {
            try {
                PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                stmt.setString(1, "%" + request.getParameter("gender") + "%");
                stmt.setInt(2, priceRange[0]);
                stmt.setInt(3, priceRange[1]);
                stmt.setString(4, "%" + request.getParameter("university") + "%");
                stmt.setString(5, request.getParameter("size"));
                ResultSet rs = stmt.executeQuery();
                return rs;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public ResultSet returnproductSchool(HttpServletRequest request) {
        query = Queries.valueOf("returnproductSchool");
        try {
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            stmt.setString(1, request.getParameter("action"));
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet returnallUsers() {
        query = Queries.valueOf("returnallUsers");
        try {
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet returnAllOrders() {
        try {
            query = Queries.valueOf("returnallOrders");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet returnAllPendingOrders() {
        try {
            query = Queries.valueOf("returnAllPendingOrders");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet returnOrderDateRange(HttpServletRequest request) {
        try {
            query = Queries.valueOf("returnOrderDateRange");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
            stmt.setDate(1, Date.valueOf(LocalDate.MAX)); //start date constraint by now
            stmt.setDate(2, Date.valueOf(LocalDate.MAX)); // end date contraint by the start date and now
            ResultSet rs = stmt.executeQuery();
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public ResultSet returnProductDetail(HttpServletRequest request) {
        query = Queries.valueOf("specificProduct");
        try {
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            stmt.setString(1, request.getParameter("action"));
            stmt.setString(2, request.getParameter("school"));
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
                query = Queries.valueOf("signUp");
                PreparedStatement stmt = this.conn.prepareStatement(query.getQuery());
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

            query = Queries.valueOf("logIn");
            PreparedStatement stmt = this.conn.prepareStatement(query.getQuery(), ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            stmt.setString(1, request.getParameter("email"));
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String dbPass = encryptDecrypt.decrypt(rs.getString(2));
                String userInputPass = request.getParameter("password");
                boolean match = dbPass.equals(userInputPass);
                if (match) {
                    session.setAttribute("userid", encryptDecrypt.encrypt(Integer.toString(rs.getInt(1))));
                    session.setAttribute("email", rs.getString(4));
                    if (rs.getString(3).equals("administrator")) {
                        session.setAttribute("role", rs.getString(3));
                    }
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

    public void printResultSets(ResultSet rs) {
        try {
            System.out.println("printing result set: ");
            ResultSetMetaData rsMd = rs.getMetaData();
            int columnNumber = rsMd.getColumnCount();
            int entityCount = 0;
            while (rs.next()) {
                for (int i = 1; i <= columnNumber; i++) {
                    System.out.println(String.format("%s: %s", rsMd.getColumnLabel(i), rs.getString(i)));
                }
                System.out.println("");
                entityCount++;
            }
            System.out.println(String.format("Number of Entities in the Result set: %d", entityCount));
            rs.beforeFirst();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
