<%-- 
    Document   : confirmation
    Created on : May 18, 2022, 9:23:22 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation</title>
    </head>
        <header>
        <%@ include file="HeaderAndFooter/header.jsp"%>
    </header>
<body>
    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="index.jsp">Home</a>
                    <span class="breadcrumb-item active">Orders</span>
                    <span class="breadcrumb-item active">Confirmation</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Confirmation Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-2.5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Gcash</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <img src="img/Gcash.jpeg" alt=""/>
                    </div>
                </div>
            <div class="bg-light p-30">
            <button class="btn btn-block btn-primary font-weight-bold py-3">Print Gcash Invoice</button>
            </div>
            </div>
            &nbsp
            &nbsp
            &nbsp
            &nbsp
            <div class="col-lg-2.5">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Paymaya</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <img src="img/Paymaya.jpeg" alt="" />
                    </div>
                </div>
            <div class="bg-light p-30">
            <button class="btn btn-block btn-primary font-weight-bold py-3">Print Paymaya Invoice</button>
            </div>
            </div>

        </div>
    </div>
    <!-- Confirmation End -->
    
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
    
    </body>
    <footer>
        <%@ include file="HeaderAndFooter/footer.jsp"%>
    </footer>
</html>
