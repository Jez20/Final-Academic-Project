<%-- 
    Document   : AdminProduct
    Created on : May 18, 2022, 6:36:04 PM
    Author     : Joseph
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<html>
    <head>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if(session.getAttribute("userid") == null && session.getAttribute("role") == null){
            response.sendRedirect("GuestServlet");
                       }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/adminheader.jsp"%>
    </header>
    <body>
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Product List</span></h2>
            <div class="row px-xl-5">
                <div class="col-lg-12 mb-5">
                    <div class="contact-form bg-light p-30">
                        <div id="success"></div>
                        <table class="content-table">
                            <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Description</th>
                                    <th>School</th>
                                    <th>Category</th>
                                    <th>Product Image</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ResultSet rs = (ResultSet) request.getAttribute("rs");
                                    if (rs != null) {
                                        while (rs.next()) {
                                    String id = rs.getString(1);
                                    String name = rs.getString(2);                                    
                                    String desc = rs.getString(3);
                                    String school = rs.getString(4);
                                    String category = rs.getString(5);
                                    String imgLink = rs.getString(6);
                                            {%>
                                <form action="AdminServlet" method="GET">
                                    <tr>
                                    <td><%=name%></td>
                                    <td><%=desc%></td>
                                    <td><%=school%></td>
                                    <td><%=category%></td>
                                    <td><%=imgLink%></td>
                                    <td>
                                        <button name="action" value="update" type="Submit" class="btn btn-success">Update</button>
                                        <button name="action" value="delete" type="Submit" class="btn btn-danger">Delete</button>
                                        <input type="hidden" name="productid" value="<%=id%>"/>
                                        <input type="hidden" name="productname" value="<%=name%>"/>
                                        <input type="hidden" name="productdesc" value="<%=desc%>"/>
                                        <input type="hidden" name="productschool" value="<%=school%>"/>
                                        <input type="hidden" name="productcategory" value="<%=category%>"/>
                                        <input type="hidden" name="productimglink" value="<%=imgLink%>"/>
                                    </td>
                                </tr>
                                </form>
                                <%}
                                        }

                                    }

                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>            
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
        width: 95%;
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
