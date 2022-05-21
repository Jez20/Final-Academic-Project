<%-- 
    Document   : AdminAddProduct
    Created on : May 18, 2022, 6:36:42 PM
    Author     : Joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Add Product</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/header.jsp"%>
    </header>
    <body>
        <h1> Administrator - Add Product</h1>
        <input type="text" name="Product Name" class="form-control" placeholder="Product Name" required>
        <input type="text" name="Product Description" class="form-control" placeholder="Product Description" required>
        <select name="school" id="school">
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
        <select name="Category" id="Category">
            <option selected value="No school selected">Choose apparel catergory...</option>
            <option value="Caps">Caps</option>
            <option value="Classic Shirts">Classic Shirts</option>
            <option value="Polo Shirts">Polo Shirts</option>
            <option value="Jackets">Jackets</option>
            <option value="Bottoms">Bottoms</option>
            <option value="Sweat Shirt">Sweat Shirt</option>
            <option value="Pocket Tees">Pocket Tees</option>
        </select>
        <p>Product Variations</p>
        
        <input type="text" name="img link" class="form-control" placeholder="image link" required>
    </body>
    <footer>
        <%--<%@ include file="HeaderAndFooter/footer.jsp"%>--%>
    </footer>
</html>
