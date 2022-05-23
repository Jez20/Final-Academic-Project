<%-- 
    Document   : Reports
    Created on : May 23, 2022, 9:58:08 PM
    Author     : Joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Reports</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/adminheader.jsp"%>
    </header>
    <body>
        <form>
            <div class="container-fluid">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Administrator - Reports</span></h2>
                <div class="row px-xl-5">
                    <div class="col-lg-12 mb-5">
                        <div class="contact-form bg-light p-30">
                            <div id="success"></div>
                            <table class="content-table">
                                <thead>
                                    <tr>
                                        <th>Date Started</th>
                                        <th>Date Finished</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="date" id="birthday" name="datestarted"></td>
                                        <td><input type="date" id="birthday" name="birthday"></td>
                                        <td>
                                            <div>
                                                <button onclick="location.href='PdfServlet?pdftype=salesreport'" type="button" class="btn btn-primary py-2 px-4" name="action" value="updateproduct">Generate Sales Report</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <center>
                                        <td> --- </td>
                                        <td> --- </td>
                                        </center>
                                        <td>
                                            <div>
                                            <button onclick="location.href='PdfServlet?pdftype=userreport'" type="button" class="btn btn-primary py-2 px-4" name="action" value="updateproduct">Generate User Report</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <center>
                                        <td> --- </td>
                                        <td> --- </td>
                                        </center>
                                        <td>
                                            <div>
                                                <button onclick="location.href='PdfServlet?pdftype=pendingorders'" type="button" class="btn btn-primary py-2 px-4" name="action" value="updateproduct">Generate Pending Orders Report</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <center>
                                        <td> --- </td>
                                        <td> --- </td>
                                        </center>
                                        <td>
                                            <div>
                                                 <button onclick="location.href='PdfServlet?pdftype=pendingorders'" type="button" class="btn btn-primary py-2 px-4" name="action" value="updateproduct">Generate Completed Orders Report</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <center>
                                        <td> --- </td>
                                        <td> --- </td>
                                        </center>
                                        <td>
                                            <div>
                                             <button onclick="location.href='PdfServlet?pdftype=inventoryreport'" type="button" class="btn btn-primary py-2 px-4" name="action" value="updateproduct">Generate Inventory Report</button>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>            
    </body>
    <footer>
        <%@ include file="HeaderAndFooter/footer.jsp"%>
    </footer>
    
    <!-- Back to Top -->
    <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Contact Javascript File -->
    <script src="mail/jqBootstrapValidation.min.js"></script>
    <script src="mail/contact.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</html>
<style>
    .content-table{
        border-collapse: collapse;
        font-size: 16px;
        min-width: 400px;
        margin-left: auto;
        margin-right: auto;
        width: 100%;
    }
    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #3D464D;
        color: white;
    }
    h1{
        font-size: 32px;
        margin-left: auto;
        margin-right: auto;
    }
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>
