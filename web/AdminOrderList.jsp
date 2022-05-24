<%-- 
    Document   : AdminOrderList
    Created on : May 23, 2022, 9:22:09 PM
    Author     : Joseph
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Order List</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/adminheader.jsp"%>
    </header>
    <body>
        <form>
            <div class="container-fluid">
                <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Administrator - Order List</span></h2>
                <div class="row px-xl-5">
                    <div class="col-lg-12 mb-5">
                        <div class="contact-form bg-light p-30">
                            <div id="success"></div>
                            <table class="content-table">
                                <thead>
                                    <tr>
                                        <th>Customer Email</th>
                                        <th>Order Name</th>
                                        <th>Quantity</th>
                                        <th>Total Price</th>
                                        <th>Customer Address</th>
                                        <th>Order Date Created</th>
                                        <th>Date Completed</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <%
                                            ResultSet rs = (ResultSet) request.getAttribute("rs");
                                            if (rs != null) {
                                                while (rs.next()) {
                                                    int orderid = rs.getInt(1);
                                                    String orderEmail = rs.getString(2);
                                                    String orderName = rs.getString(3);
                                                    String orderQuantity = rs.getString(4);
                                                    int orderPrice = rs.getInt(5);
                                                    String orderAddress = rs.getString(6);
                                                    String orderDate = rs.getString(7);
                                                    String orderDateCompleted = rs.getString(8);
                                                    boolean ispaid = rs.getBoolean(9);
                                                    String status = "badge badge-success";
                                                    if (orderDateCompleted == null) {
                                                        status = "badge badge-warning";
                                                    }
                                                    String statusMessage = "Completed";
                                                    if (orderDateCompleted == null){
                                                    statusMessage = "Pending";
                                            }

                                                    {%><form action="AdminServlet" method="POST">
                                    <td><%=orderEmail%></td>
                                    <td><%=orderName%></td>
                                    <td><%=orderQuantity%></td>
                                    <td><%=orderPrice%></td>
                                    <td><%=orderAddress%></td>
                                    <td><%=orderDate%></td>
                                    <td><input name="orderdatecompleted" type="date" id="birthday"></td>
                                    <td>
                                        <input type="hidden" name="orderid" value="<%=orderid%>">
                                    <center>
                                        <span class="<%=status%>" id="status" name="status"><%=status%></span>
                                    </center>
                                    </td>
                                </form><%}
                                        }
                                    }
                                %>
                                </tr>
                                </tbody>
                                <tbody>
                                <form>
                                    <tr>
                                        <td>placeholder@hotgirls.com</td>
                                        <td>DLSU T-Shirt</td>
                                        <td>1</td>
                                        <td>200</td>
                                        <td>123 Cubao</td>
                                        <td>Date Field</td>
                                        <td><input type="date" id="birthday" name="birthday"></td>
                                        <td>
                                <center>
                                    <span class="badge badge-warning" id="status" name="status">Pending</span>
                                </center>
                                </td>
                                <td>
                                    <center>
                                    <button name="action" value="update" type="Submit" class="btn btn-warning">Update</button>
                                    </center>
                                </td>
                                </form>
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
