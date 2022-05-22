<%-- 
    Document   : UpdateProduct
    Created on : May 21, 2022, 2:30:41 PM
    Author     : FV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Update Product</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/header.jsp"%>
    </header>
    <body>
        <div class="container-fluid">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Update Product</span></h2>
        <div class="row px-xl-5">
            <div class="col-lg-12 mb-5">
                <div class="contact-form bg-light p-30">
                    
<!--        <h1>Administrator - Update Product</h1>-->
        <p>Product Name</p>
        <input type="text" name="Pname" required>
        <p>Product Description</p>
        <input type="text" name="PDesc" required>
        <label for="School">Choose School:</label>
        <select name="School" id="school">
            <option value="ADMU">Ateneo De Manila University</option>
            <option value="DLSU">De La Salle University</option>
            <option value="UP">University of the Philippines</option>
            <option value="UST">Universtiy of Santo Tomas</option>
            <option value="FEU">Far Eastern University</option>
            <option value="UE">University of the East</option>
            <option value="NU">National University</option>
            <option value="ADU">Adamson University</option>
        </select>
        <label for="Apparel">Choose Apparel:</label>
        <select name="category" id="apparel">
        <option value="Caps">Caps</option>
            <option value="Classic Shirts">Classic Shirts</option>
            <option value="Polo Shirts">Polo Shirts</option>
            <option value="Jacket">Jackets</option>
            <option value="Bottoms">Bottoms</option>
            <option value="Shirts">Sweat Shirts</option>
            <option value="Pocket Tees">Pocket Tees</option>
        </select>
        <label for="Gender">Choose Gender:</label>
        <select name="gender" id="gender">
            <option value="U">Unisex</option>
            <option value="M">Male</option>
            <option value="F">Female</option>
        </select>
        <label for="Sizes">Choose Product Size:</label>
        <label class="container">S
            <input type="checkbox">
            <span class="checkmark"></span>
        </label>
        <label class="container">M
            <input type="checkbox">
            <span class="checkmark"></span>
        </label>
        <label class="container">L
            <input type="checkbox">
            <span class="checkmark"></span>
        </label>
         <p>Product Price</p>
        <input type="text" name="Pname" required>
        <p>Product Stock</p>
        <input type="text" name="Pname" required>
                    </div>
            </div>
        </div>
        </div>    
    </body>
</html>
