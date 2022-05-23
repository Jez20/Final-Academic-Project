/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DatabaseManager;
import Model.Security;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author FV
 */
public class PaymentServlet extends HttpServlet {

    private Security encryptDecrypt;
    private DatabaseManager dbQueries;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        String dbDriver = getServletContext().getInitParameter("jdbcClassName");
        StringBuffer url = new StringBuffer(getServletContext().getInitParameter("jdbcDriverurl"))
                .append("://")
                .append(getServletContext().getInitParameter("dbHostName"))
                .append(":")
                .append(getServletContext().getInitParameter("dbPort"))
                .append("/")
                .append(getServletContext().getInitParameter("databaseName"));
        String dbPassword = getServletContext().getInitParameter("dbPassword");
        String dbUsername = getServletContext().getInitParameter("dbUserName");
        String key = config.getInitParameter("key");
        this.encryptDecrypt = new Security();
        this.dbQueries = new DatabaseManager(url.toString(), dbPassword, dbDriver, dbDriver, key);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        switch (action) {
            case "":
                break;
            default:
                response.sendRedirect("LoggedInServlet");
                break;
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
