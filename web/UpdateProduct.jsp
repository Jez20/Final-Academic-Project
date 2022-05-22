<%-- 
    Document   : UpdateProduct
    Created on : May 21, 2022, 2:30:41 PM
    Author     : FV
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/adminheader.jsp"%>
    </header>
    <body>
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Update Product</span></h2>
            <div class="row px-xl-5">
                <div class="col-lg-12 mb-5">
                    <div class="contact-form bg-light p-30">
                        <div id="success"></div>
                        <form name="sentMessage" id="contactForm" novalidate="novalidate">
                            <div class="control-group">
                                <input type="text" class="form-control" id="name" placeholder="Product Name"
                                       required="required" data-validation-required-message="Please enter the product name" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="text" class="form-control" id="email" placeholder="Product Description"
                                       required="required" data-validation-required-message="Please enter your product description" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <select class="form-control">
                                    <option selected value="No school selected">Choose a UAAP School...</option>
                                    <option value="ADMU">Ateneo De Manila University</option>
                                    <option value="DLSU">De La Salle University</option>
                                    <option value="AdU">Adamson University</option>
                                    <option value="UST">University of Santo Tomas</option>
                                    <option value="UP">University of the Philippines</option>
                                    <option value="UE">University of the East</option>
                                    <option value="FEU">Far Eastern University</option>
                                    <option value="NU">National University</option>
                                </select>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <select class="form-control">
                                    <option selected value="No category selected">Choose apparel catergory...</option>
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
                                       required="required" data-validation-required-message="Please enter product image link." />
                                <p class="help-block text-danger"></p>
                            </div>
                        </form>
                        <div>
                            <button class="btn btn-primary py-2 px-4" name="Action" type="submit" value="AddProduct" id="sendMessageButton">Update Product</button>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div style="overflow-x:auto;">
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
                                            String previousGender = "";
                                            while (rs.next()) {
                                                String id = rs.getString(1);
                                                String gender = rs.getString(2);
                                                String size = rs.getString(3);
                                                int price = rs.getInt(4);
                                                int stock = rs.getInt(5);
                                                {%>
                                <form action="AdminServlet" method="POST">
                                    <tr>
                                        <td>
                                            <div class="control-group">
                                                <select class="form-control">
                                                    <option selected value="<%=gender%>">Choose gender...</option>
                                                    <option value="U">Unisex</option>
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <select class="form-control">
                                                    <option selected value="<%=size%>">Choose Size...</option>
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
                                                <input type="number" class="form-control" id="email" placeholder="Product price..."
                                                       required="required" data-validation-required-message="Please enter price." value="<%=price%>" />
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <input type="number" class="form-control" id="email" placeholder="Product stock..."
                                                       required="required" data-validation-required-message="Please enter stock." value="<%=stock%>" />
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <!--                            <from action="some in here" method="GET">-->
                                                <button name=action" value="updatevariation" type="Submit" class="btn btn-warning">Add</button>
                                                <button name=action" value="deletevariation" type="Submit" class="btn btn-warning">delete</button>
                                                <input type="hidden" name="variationid" value="<%=id%>">
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                    </tr>
                                </form>
                                <%}

                                        }
                                    }

                                %>

                                <form>
                                    <tr>
                                        <td>
                                            <div class="control-group">
                                                <select class="form-control">
                                                    <option selected value="No category selected">Choose gender...</option>
                                                    <option value="U">Unisex</option>
                                                    <option value="M">Male</option>
                                                    <option value="F">Female</option>
                                                </select>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <select class="form-control">
                                                    <option selected value="No category selected">Choose Size...</option>
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
                                                <input type="number" class="form-control" id="email" placeholder="Product price..."
                                                       required="required" data-validation-required-message="Please enter price." />
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <input type="number" class="form-control" id="email" placeholder="Product price..."
                                                       required="required" data-validation-required-message="Please enter price." />
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="control-group">
                                                <!--                            <from action="some in here" method="GET">-->
                                                <button name=action" value="update" type="Submit" class="btn btn-warning">Add</button>
                                                <p class="help-block text-danger"></p>
                                            </div>
                                        </td>
                                    </tr>
                                </form>
                                </tbody>
                            </table>
                            <p class="help-block text-danger"></p>
                        </div>
                        <!--                            <div class="control-group">
                                                        <select class="form-control">
                                                            <option selected value="No gender selected">Choose gender...</option>
                                                            <option value="U">Unisex</option>
                                                            <option value="F">Female</option>
                                                            <option value="M">Male</option>
                                                        </select>
                                                        <p class="help-block text-danger"></p>
                                                    </div>
                                                    <div class="control-group">
                                                        <select class="form-control">
                                                            <option selected value="No gender selected">Choose product size...</option>
                                                            <option value="XS">Extra Small</option>
                                                            <option value="S">Small</option>
                                                            <option value="M">Medium</option>
                                                            <option value="L">Large</option>
                                                            <option value="XL">Extra Large</option>
                                                        </select>
                                                        <p class="help-block text-danger"></p>
                                                    </div>
                                                    <div class="control-group">
                                                        <input type="number" class="form-control" id="email" placeholder="Product price..."
                                                               required="required" data-validation-required-message="Please enter price." />
                                                        <p class="help-block text-danger"></p>
                                                    </div>
                                                    <div class="control-group">
                                                        <input type="number" class="form-control" id="email" placeholder="Product stock..."
                                                               required="required" data-validation-required-message="Please enter stock." />
                                                        <p class="help-block text-danger"></p>
                                                    </div>-->

                        </form>
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