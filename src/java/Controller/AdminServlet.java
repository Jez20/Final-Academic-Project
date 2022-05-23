/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DatabaseManager;
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
public class AdminServlet extends HttpServlet {

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
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = "";
        HttpSession session = request.getSession();
        if (request.getParameter("action") != null) {
            action = request.getParameter("action");
        }
        System.out.println(String.format("action: %s", action));
        if (session.getAttribute("email") != null && session.getAttribute("role") != null) {
            switch (action) {
                case "detail":
                    ResultSet rs = dbQueries.returnProductVariation(request);
                    request.setAttribute("rs", rs);
                    request.getRequestDispatcher("detail.jsp").forward(request, response);
                    break;
                case "addvariation":
                    if (dbQueries.addProductVariation(request)) {
                        ResultSet rs2 = dbQueries.returnProductVariation(request);
                        request.setAttribute("rs", rs2);
                        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                    } else {
                        ResultSet rs2 = dbQueries.returnProductVariation(request);
                        request.setAttribute("rs", rs2);
                        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                    }
                    break;
                case "deletevariation":
                    if (dbQueries.deleteProductVariation(request)) {
                        ResultSet rs2 = dbQueries.returnProductVariation(request);
                        request.setAttribute("rs", rs2);
                        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                    } else {
                        ResultSet rs2 = dbQueries.returnProductVariation(request);
                        request.setAttribute("rs", rs2);
                        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                    }
                    break;
                case "updatevariation":
                    if (dbQueries.updateProductVariation(request)) {
                        ResultSet rs2 = dbQueries.returnProductVariation(request);
                        request.setAttribute("rs", rs2);
                        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                    } else {
                        ResultSet rs2 = dbQueries.returnProductVariation(request);
                        request.setAttribute("rs", rs2);
                        request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
                    }
                    break;
                case "delete":
                    if (dbQueries.deleteProduct(request)) {
                        response.sendRedirect("AdminServlet?action=viewproducts");
                    } else {
                        response.sendRedirect("AdminServlet?action=viewproducts");
                    }
                    break;
                case "updateproduct":
                    if (dbQueries.updateProduct(request)) {
                        response.sendRedirect("AdminServlet?action=viewproducts");
                    } else {
                        response.sendRedirect("AdminServlet?action=viewproducts");
                    }
                    break;
                case "addproduct":
                    if (dbQueries.addProduct(request)) {
                        response.sendRedirect("AdminServlet?action=viewproducts");
                    } else {
                        response.sendRedirect("AdminServlet");
                    }
                    break;
                case "viewproducts":
                    ResultSet rs2 = dbQueries.returnProductList();
                    request.setAttribute("rs", rs2);
                    request.getRequestDispatcher("AdminProductList.jsp").forward(request, response);
                    break;
                case "filter":
                    ResultSet rs1 = dbQueries.applyFilter(request);
                    request.setAttribute("rs", rs1);
                    request.getRequestDispatcher("shop.jsp").forward(request, response);
                    break;
                case "update":
                    ResultSet rs3 = dbQueries.returnProductVariation(request);
                    request.setAttribute("rs", rs3);
                    request.getRequestDispatcher("UpdateProduct.jsp").forward(request, response);
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
                case "logout":
                    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                    session.removeAttribute("email");
                    session.removeAttribute("userid");
                    session.removeAttribute("cart");
                    session.removeAttribute("counter");
                    session.removeAttribute("role");
                    session.invalidate();
                    response.sendRedirect("GuestServlet");

                    break;
                case "":
                    session.removeAttribute("email");
                    session.removeAttribute("userid");
                    session.removeAttribute("role");
                    session.invalidate();
                    response.sendRedirect("GuestServlet");

                    break;
            }
        } else {
            response.sendRedirect("GuestServlet");
        }
    }

    protected void toTheshop(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResultSet rs = this.dbQueries.returnproductSchool(request);
        request.setAttribute("rs", rs);
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
