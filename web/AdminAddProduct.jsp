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
        <title>Add Product</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/adminheader.jsp"%>
    </header>
    <body>
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Add Product</span></h2>
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
                                       <input type="text" class="form-control" id="text" placeholder="Product Description"
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
                            <div class="control-group">
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
                            </div>
                            <div>
                                <button class="btn btn-primary py-2 px-4" name="Action" type="submit" value="AddProduct" id="sendMessageButton">Add Product</button>
                            </div>
                    </div>
                    </form>
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
