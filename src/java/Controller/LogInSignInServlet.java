/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DatabaseManager;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nl.captcha.Captcha;
import static nl.captcha.Captcha.NAME;

/**
 *
 * @author FV
 */
public class LogInSignInServlet extends HttpServlet {

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
        String action = request.getParameter("action").trim();
        Captcha captcha = (Captcha) request.getSession().getAttribute(NAME);
        switch (action) {
            case "signup":
                if (captcha.isCorrect(request.getParameter("captcha").trim())) {
                    if (this.dbQueries.signUp(request)) {
                        response.sendRedirect("login.jsp");
                    } else {
                        response.sendRedirect("signup.jsp");
                    }
                } else {
                    response.sendRedirect("signup.jsp");
                }
                break;

            case "login":
                if (captcha.isCorrect(request.getParameter("captcha").trim())) {
                    if (this.dbQueries.logIn(request)) {
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                } else {
                    response.sendRedirect("login.jsp");
                }
                break;

            default:
                response.sendRedirect("index.jsp");
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
    }// </editor-fold>

}
