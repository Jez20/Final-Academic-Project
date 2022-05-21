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
                        <th>Gender</th>
                        <th>Size</th>
                        <th>Price</th>
                        <th>Product Image</th>
                        <th>Stock</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Green Archer T-shirt</td>
                        <td>DLSU T-shirt</td>
                        <td>DLSU</td>
                        <td>Shirts</td>
                        <td>Male</td>
                        <td>XL</td>
                        <td>PHP2000</td>
                        <td>img link here</td>
                        <td>100</td>
                        <td>
<!--                            <from action="some in here" method="GET">-->
                        <button name="Action" value="Update" type="Submit" class="btn btn-success">Update</button>
                        <button name="Action" value="Delete" type="Submit" class="btn btn-danger">Delete</button>
                        </td>
                <!--some code here-->
                </tbody>
                </table>
        </div>
    </body>
    <footer>
        <%@ include file="HeaderAndFooter/footer.jsp"%>
    </footer>
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
</style>
