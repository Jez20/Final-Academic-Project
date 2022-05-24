<%-- 
    Document   : UpdateProduct
    Created on : May 21, 2022, 2:30:41 PM
    Author     : FV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Update Product</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/adminheader.jsp"%>
    </header>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("userid") == null && session.getAttribute("role") == null) {
            response.sendRedirect("GuestServlet");
        }
        String productName = "";
        String productDesc = "";
        String productSchool = "";
        String productCateg = "";
        String imgLink = "";
        String productid = "";
        if (request.getParameter("productname") != null) {
            productName = request.getParameter("productname");
        }
        if (request.getParameter("productdesc") != null) {
            productDesc = request.getParameter("productdesc");
        }
        if (request.getParameter("productschool") != null) {
            productSchool = request.getParameter("productschool");
        }
        if (request.getParameter("productcategory") != null) {
            productCateg = request.getParameter("productcategory");
        }
        if (request.getParameter("productimglink") != null) {
            imgLink = request.getParameter("productimglink");
        }
        if (request.getParameter("productid") != null) {
            productid = request.getParameter("productid");
        }
    %>
    <body>
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Administrator - Update Product</span></h2>
            <div class="row px-xl-5">
                <div class="col-lg-9 mb-5">
                    <div class="contact-form bg-light p-30">
                        <div id="success"></div>
                        <form action="AdminServlet" method="POST" >
                            <div class="control-group">
                                <input type="text" class="form-control" id="name" placeholder="Product Name"
                                       required="required" data-validation-required-message="Please enter the product name" name="productname" value="<%=productName%>" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control" id="email" placeholder="Product Description"
                                       required="required" data-validation-required-message="Please enter your product description" name="productdescription" value="<%=productDesc%>" />
                                <p class="help-block text-danger"></p>
                            </div>

                            <div class="control-group">
                                <select name="productschool" class="form-control">
                                    <option selected value="<%=productSchool%>"><%=productSchool%></option>
                                    <option value="ATENEO">ATENEO</option>
                                    <option value="LA SALLE">LA SALLE</option>
                                    <option value="ADAMSON">ADAMSON</option>
                                    <option value="UST">UST</option>
                                    <option value="UP">UP</option>
                                    <option value="UE">UE</option>
                                    <option value="FEU">FEU</option>
                                    <option value="NU">NU</option>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <select name="productcategory" class="form-control">
                                    <option selected value="<%=productCateg%>"><%=productCateg%></option>
                                    <option value="Caps">Caps</option>
                                    <option value="Classic Shirts">Classic Shirts</option>
                                    <option value="Polo Shirts">Polo Shirts</option>
                                    <option value="Jackets">Jackets</option>
                                    <option value="Bottoms">Bottoms</option>
                                    <option value="Sweat Shirt">Sweat Shirt</option>
                                    <option value="Pocket Tees">Pocket Tees</option>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control" id="email" placeholder="Product image link"
                                       required="required" data-validation-required-message="Please enter product image link." name="productimglink" value="<%=imgLink%>" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div>
                                <button class="btn btn-primary py-2 px-4" name="action" type="submit" value="updateproduct" id="sendMessageButton">Update Product</button>
                                <input type="hidden" name="productid" value="<%=productid%>"/>
                            </div>
                        </form>
                        <div class="contact-form bg-light p-30">
                            <div id="success"></div>
                            <table class="content-table">
                                <thead>
                                    <tr>
                                        <th>Gender</th>
                                        <th>Size</th>
                                        <th>Price</th>
                                        <th>Stock</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        ResultSet rs = (ResultSet) request.getAttribute("rs");
                                        if (rs != null) {
                                            while (rs.next()) {
                                                String id = rs.getString(1);
                                                String gender = rs.getString(2);
                                                String size = rs.getString(3);
                                                String price = rs.getString(4);
                                                String stock = rs.getString(5);

                                                {%>
                                <form action="AdminServlet" method="GET">
                                    <tr>
                                        <td>
                                            <div class="control-group">
                                                <select name ="productgender" class="form-control">
                                                    <option selected value="<%=gender%>"><%=gender%></option>
                                                    <option value="U">Unisex</option>
                                                    <option value="F">Female</option>
                                                    <option value="M">Male</option>
                                                </select>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <select name="productsize" class="form-control">
                                                    <option selected value="<%=size%>"><%=size%></option>
                                                    <option value="XS">Extra Small</option>
                                                    <option value="S">Small</option>
                                                    <option value="M">Medium</option>
                                                    <option value="L">Large</option>
                                                    <option value="XL">Extra Large</option>
                                                </select>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <input name="productprice" type="number" class="form-control" id="email" placeholder="Product price..."
                                                       required="required" data-validation-required-message="Please enter price." name="price" value="<%=price%>"/>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <input name="productstock" type="number" class="form-control" id="email" placeholder="Product stock..."
                                                       required="required" data-validation-required-message="Please enter stock." value="<%=stock%>" />
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <button name="action" value="updatevariation" type="Submit" class="btn btn-success">Update</button>
                                            <button name="action" value="deletevariation" type="Submit" class="btn btn-danger">Delete</button>
                                            <input type="hidden" name="variantid" value="<%=id%>"/>
                                            <input type="hidden" name="productname" value="<%=productName%>"/>
                                            <input type="hidden" name="productdesc" value="<%=productDesc%>"/>
                                            <input type="hidden" name="productschool" value="<%=productSchool%>"/>
                                            <input type="hidden" name="productcategory" value="<%=productCateg%>"/>
                                            <input type="hidden" name="productimglink" value="<%=imgLink%>"/>
                                            <input type="hidden" name="productid" value="<%=productid%>"/>
                                        </td>
                                    </tr>
                                </form>
                                <%}
                                        }
                                    }
                                %>
                                <form action="AdminServlet" method="POST">
                                    <tr>
                                        <td>
                                            <div class="control-group">
                                                <select name="productgender" class="form-control">
                                                    <option selected value="">Choose gender...</option>
                                                    <option value="U">Unisex</option>
                                                    <option value="F">Female</option>
                                                    <option value="M">Male</option>
                                                </select>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <select name="productsize" class="form-control">
                                                    <option selected value="">Choose size...</option>
                                                    <option value="XS">Extra Small</option>
                                                    <option value="S">Small</option>
                                                    <option value="M">Medium</option>
                                                    <option value="L">Large</option>
                                                    <option value="XL">Extra Large</option>
                                                </select>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td><div class="control-group">
                                                <input name="productprice" type="number" class="form-control" id="email" placeholder="Product price..."
                                                       required="required" data-validation-required-message="Please enter price." />
                                                <p class="help-block text-danger"></p>
                                            </div></td>
                                        <td>
                                            <div class="control-group">
                                                <input name="productstock" type="number" class="form-control" id="email" placeholder="Product stock..."
                                                       required="required" data-validation-required-message="Please enter price." />
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <button name="action" value="addvariation" type="Submit" class="btn btn-warning">Add</button>
                                            <input type="hidden" name="productname" value="<%=productName%>"/>
                                            <input type="hidden" name="productdesc" value="<%=productDesc%>"/>
                                            <input type="hidden" name="productschool" value="<%=productSchool%>"/>
                                            <input type="hidden" name="productcategory" value="<%=productCateg%>"/>
                                            <input type="hidden" name="productimglink" value="<%=imgLink%>"/>
                                            <input type="hidden" name="productid" value="<%=productid%>"/>
                                        </td>
                                    </tr>
                                </form>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </body>

    <footer>
        <%@ include file="HeaderAndFooter/adminfooter.jsp"%>
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