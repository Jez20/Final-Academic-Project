/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DatabaseManager;
import Model.pdfGenerator;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
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
public class PdfServlet extends HttpServlet {

    private DatabaseManager dbQueries;
    private pdfGenerator reportGenerate;

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
        this.reportGenerate = new pdfGenerator();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        OutputStream out = response.getOutputStream();
        HttpSession session = request.getSession();
        String pdfType = request.getParameter("pdftype");
        if (session.getAttribute("userid") != null && session.getAttribute("role") != null) {
            try {
                Document document = new Document(PageSize.A4);
                PdfWriter writer = PdfWriter.getInstance(document, out);
                System.out.println(String.format("pdftype: %s", request.getParameter("pdftype")));
                String email = (String) session.getAttribute("email");
                switch (pdfType) {
                    case "userreport":
                        this.reportGenerate.generateUserReport(writer, document, dbQueries.returnallUsers(), out, email,response);
                        document.close();
                        writer.close();
                        break;
                    case "pendingorders":
                        this.reportGenerate.pendingOrderReport(writer, document, dbQueries.returnAllPendingOrders(), out, email,response);
                        document.close();
                        writer.close();
                        break;
                    case "inventoryreport":
                        this.reportGenerate.generateInventoryReport(writer, document, dbQueries.returnInventory(), out, email,response);
                        document.close();
                        writer.close();
                        break;
                    case "salesreport":
                        this.reportGenerate.salesReport(writer, document, dbQueries.returnSalesQuery(request), out, email,response);
                        dbQueries.printResultSets(dbQueries.returnSalesQuery(request));
                        document.close();
                        writer.close();
                        break;
                    case "completedorders":
                        this.reportGenerate.completedOrdersReport(writer, document, dbQueries.returnAllCompleted(), out, email,response);
                        document.close();
                        writer.close();
                        break;
                    default:
                        response.sendRedirect("GuestServlet");
                        break;
                }
            } catch (DocumentException exc) {
                exc.printStackTrace();
            } 
        }
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
