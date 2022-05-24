/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DatabaseManager;
import Model.Order;
import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
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
        HttpSession session = request.getSession();
        String action = request.getParameter("action");
        if (session.getAttribute("userid") != null && session.getAttribute("email") != null) {
            switch (action) {
                case "deletesample":
                    ArrayList<Order> cart2 = new ArrayList<Order>();
                    cart2 = (ArrayList<Order>) session.getAttribute("cart");
                    cart2.remove(Integer.parseInt(request.getParameter("cartindex")));
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                    break;
                case "deletecart":
                    session.removeAttribute("counter");
                    session.removeAttribute("cart");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                    break;
                case "confirm":
                    try {
                    if (dbQueries.insertNewOrder(request)) {
                        String payment = request.getParameter("payment");
                        switch (payment) {
                            case "gcash":
                                session.removeAttribute("counter");
                                session.removeAttribute("cart");
                                response.sendRedirect("confirmationGcash.jsp");
                                break;
                            case "paymaya":
                                session.removeAttribute("counter");
                                session.removeAttribute("cart");
                                response.sendRedirect("confirmationPaymaya.jsp");
                                break;
                        }
                    } else {
                        request.getRequestDispatcher("cart.jsp");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                }
                break;
                case "checkout":
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                    break;
                case "addtocart":
                                try {
                    ArrayList<Order> cart = new ArrayList<>();
                    ResultSet available = dbQueries.checkAvailability(request);
                    if (session.getAttribute("cart") != null) {
                        cart = (ArrayList<Order>) session.getAttribute("cart");
                    }
                    Order createdorder = new Order();
                    if (available.next()) {
                        createdorder.setImgLink(request.getParameter("productimglink"));
                        int stock = available.getInt(5);
                        int wantedQuantity = Integer.parseInt(request.getParameter("productquantity"));
                        if (wantedQuantity < stock) {
                            createdorder.setOrderQuantity(wantedQuantity);
                        } else {
                            String induceException = "1x";
                            createdorder.setOrderQuantity(Integer.parseInt(induceException));
                        }
                        createdorder.setVariantId(available.getInt(1));
                        createdorder.setIsPaid(false);
                        createdorder.setOrderName(request.getParameter("productname"));
                        createdorder.setOrderPrice(available.getInt(4) * wantedQuantity);
                       createdorder.setOrderQuantity(wantedQuantity);
                        LocalDate dateNow = LocalDate.now();
                        createdorder.setOrderDate(dateNow);
                        createdorder.setOrderDateCompleted(null);
                    }
                    cart.add(createdorder);
                    session.setAttribute("cart", cart);
                    if (session.getAttribute("counter") != null) {
                        int counter = (Integer) session.getAttribute("counter");
                        counter++;
                        session.setAttribute("counter", counter);

                    } else {
                        session.setAttribute("counter", 1);
                    }
                    response.sendRedirect("cart.jsp");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.getRequestDispatcher("detail.jsp").forward(request, response);
                }
                break;
                default:
                    response.sendRedirect("LoggedInServlet");
                    break;
            }
        } else {
            response.sendRedirect("login.jsp");
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
