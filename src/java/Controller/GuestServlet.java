/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DatabaseManager;
import Model.Security;
import java.io.IOException;
import java.io.PrintWriter;
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
public class GuestServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private DatabaseManager dbQueries;
    private Security encryptDecrypt;
    private Security displayEncrypt;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        String driver = getServletContext().getInitParameter("jdbcClassName");
        String username = getServletContext().getInitParameter("dbUserName");
        String password = getServletContext().getInitParameter("dbPassword");
        StringBuffer url = new StringBuffer(getServletContext().getInitParameter("jdbcDriverurl"))
                .append("://")
                .append(getServletContext().getInitParameter("dbHostName"))
                .append(":")
                .append(getServletContext().getInitParameter("dbPort"))
                .append("/")
                .append(getServletContext().getInitParameter("databaseName"));
        this.dbQueries = new DatabaseManager(url.toString(), username, password, driver, config.getInitParameter("key"));
        this.encryptDecrypt = new Security(config.getInitParameter("key"));
        this.displayEncrypt = new Security(config.getInitParameter("displaykey"));
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = "";
        HttpSession session = request.getSession();
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        System.out.println(String.format("action: %s", action));

        switch (action) {
            case "detail":
                ResultSet rs = dbQueries.returnProductVariation(request,this.displayEncrypt);
                request.setAttribute("rs", rs);
                request.getRequestDispatcher("detail.jsp").forward(request, response);
                break;
            case "filter":
                ResultSet rs1 = dbQueries.applyFilter(request);
                request.setAttribute("rs", rs1);
                request.setAttribute("encrypt", this.displayEncrypt);
                request.getRequestDispatcher("shop.jsp").forward(request, response);
                break;
            case "ADAMSON":
                toTheshop(request, response);
                break;
            case "ATENEO":
                toTheshop(request, response);
                break;
            case "LA SALLE":
                toTheshop(request, response);
                break;
            case "FEU":
                toTheshop(request, response);
                break;
            case "NU":
                toTheshop(request, response);
                break;
            case "UP":
                toTheshop(request, response);
                break;
            case "UE":
                toTheshop(request, response);
                break;
            case "UST":
                toTheshop(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    protected void toTheshop(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResultSet rs = this.dbQueries.returnproductSchool(request);
        request.setAttribute("rs", rs);
        request.setAttribute("encrypt", this.displayEncrypt);
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
