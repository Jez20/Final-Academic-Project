<%-- 
    Document   : AdminProduct
    Created on : May 18, 2022, 6:36:04 PM
    Author     : Joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Product List</title>
    </head>
    <header>
         <%@ include file="HeaderAndFooter/header.jsp"%>
    </header>
    <body>
        <div style="overflow-x:auto;">
            <center><h1> Administrator - Product List</h1></center>
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
                    <tr>
                        <td>Green Archer T-shirt</td>
                        <td>DLSU T-shirt</td>
                        <td>DLSU</td>
                        <td>Shirts</td>
                        <td>img link here</td>
                        <td>
<!--                            <from action="some in here" method="GET">-->
                        <button name="Action" value="Update" type="Submit" class="btn btn-success">Update</button>
                        <button name="Action" value="Delete" type="Submit" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                                        <tr>
                        <td>Green Archer T-shirt</td>
                        <td>DLSU T-shirt</td>
                        <td>DLSU</td>
                        <td>Shirts</td>
                        <td>ewan</td><!-- comment -->
                        <td>
<!--                            <from action="some in here" method="GET">-->
                        <button name="Action" value="Update" type="Submit" class="btn btn-success">Update</button>
                        <button name="Action" value="Delete" type="Submit" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                                        <tr>
                        <td>Green Archer T-shirt</td>
                        <td>DLSU T-shirt</td>
                        <td>DLSU</td>
                        <td>Shirts</td>
                        <td>ewan</td><!-- comment -->
                        <td>
<!--                            <from action="some in here" method="GET">-->
                        <button name="Action" value="Update" type="Submit" class="btn btn-success">Update</button>
                        <button name="Action" value="Delete" type="Submit" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                                        <tr>
                        <td>Green Archer T-shirt</td>
                        <td>DLSU T-shirt</td>
                        <td>DLSU</td>
                        <td>Shirts</td>
                        <td>ewan</td><!-- comment -->
                        <td>
<!--                            <from action="some in here" method="GET">-->
                        <button name="Action" value="Update" type="Submit" class="btn btn-success">Update</button>
                        <button name="Action" value="Delete" type="Submit" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                                        <tr>
                        <td>Green Archer T-shirt</td>
                        <td>DLSU T-shirt</td>
                        <td>DLSU</td>
                        <td>Shirts</td>
                        <td>ewan</td><!-- comment -->
                        <td>
                        <!--<from action="some in here" method="GET">-->
                        <button name="Action" value="Update" type="Submit" class="btn btn-success">Update</button>
                        <button name="Action" value="Delete" type="Submit" class="btn btn-danger">Delete</button>
                        </td>
                    </tr>
                <!--some code here-->
                </tbody>
                </table>
        </div>
    </body>
    <footer>
        <%@ include file="HeaderAndFooter/footer.jsp"%>
    </footer>
</html>
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
</style>
