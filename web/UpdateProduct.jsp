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
    <div class="row px-xl-5">
    <div class="col-lg-12 mb-5">
    <div class="contact-form bg-light p-30">
        <h1>Administrator - Update Product</h1>
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
        <label for="">Choose Category:</label>
        <select name="category" id="category">
        <option value="Caps">Caps</option>
            <option value="Classic Shirts">Classic Shirts</option>
            <option value="Polo Shirts">Polo Shirts</option>
            <option value="Jacket">Jackets</option>
            <option value="Bottoms">Bottoms</option>
            <option value="Shirts">Sweat Shirts</option>
            <option value="Pocket Tees">Pocket Tees</option>
        </select>
        <label for="">Choose Gender:</label>
        <select name="gender" id="gender">
            <option value="U">Unisex</option>
            <option value="M">Male</option>
            <option value="F">Female</option>
        </select>
        <label for="">Choose Product Size:</label>
        <select name="gender" id="gender">
            <option value="U">Unisex</option>
            <option value="M">Male</option>
            <option value="F">Female</option>
        </select>
    </body>
    </div>
    </div>
    </div>
    </div>
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
