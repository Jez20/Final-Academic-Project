/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.PdfReportGenerator;
import Model.Security;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author FV
 */
public class PaymentServlet extends HttpServlet {

    private PdfReportGenerator pdfGenerate;
    private Security encryptDecrypt;
    private DatabaseManager managesDB;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        String dbDriver = config.getInitParameter("jdbcClassName");
        StringBuffer url = new StringBuffer(config.getInitParameter("jdbcDriverUrl"))
                .append("://")
                .append(config.getInitParameter("dbHostName"))
                .append(":")
                .append(config.getInitParameter("dbPort"))
                .append("/")
                .append(config.getInitParameter("databaseName"));
        String dbPassword = config.getInitParameter("dbPassword");
        String dbUsername = config.getInitParameter("dbUserName");
        String key = config.getInitParameter("key");
        this.pdfGenerate = new PdfReportGenerator();
        this.encryptDecrypt = new Security();
        this.managesDB = new DatabaseManager();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
