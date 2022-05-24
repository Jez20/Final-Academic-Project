<%-- 
    Document   : detail
    Created on : Apr 23, 2022, 11:52:16 AM
    Author     : USER
--%>

<%@page import="Model.Security"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%
    String servlet2 = "";
    if (session.getAttribute("email") == null && session.getAttribute("role") == null) {
        servlet2 = "GuestServlet";
    }
    if (session.getAttribute("email") != null && session.getAttribute("role") == null) {
        servlet2 = "LoggedInServlet";
    }
    if (session.getAttribute("email") != null && session.getAttribute("role") != null) {
        servlet2 = "LoggedInServlet";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Details</title>
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
                        <span class="breadcrumb-item active">Item Details</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Shop Detail Start -->
        <div class="container-fluid pb-5">
            <div class="row px-xl-5">
                <div class="col-lg-5 mb-30">
                    <div id="product-carousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner bg-light">

                            <div class="carousel-item active">
                                <img class="w-100 h-100" src="<%=request.getParameter("productimglink")%>" alt="Image">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                            <i class="fa fa-2x fa-angle-left text-dark"></i>
                        </a>
                        <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                            <i class="fa fa-2x fa-angle-right text-dark"></i>
                        </a>
                    </div>
                </div>

                <div class="col-lg-7 h-auto mb-30">
                    <div class="h-100 bg-light p-30">
                        <h3><%=request.getParameter("productname")%></h3>

                        <h3 class="font-weight-semi-bold mb-4">$150.00</h3>
                        <p class="mb-4"><%=request.getParameter("productdesc")%></p>
                        <form action="PaymentServlet" method="GET">
                            <div class="d-flex mb-3">
                                <strong class="text-dark mr-3">Gender:</strong>

                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="gender-1" name="productgender" value="U">
                                    <label class="custom-control-label" for="gender-1">U</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="gender-2" name="productgender" value="F">
                                    <label class="custom-control-label" for="gender-2">F</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="gender-3" name="productgender" value="M">
                                    <label class="custom-control-label" for="gender-3">M</label>
                                </div>

                            </div>
                            <div class="d-flex mb-3">
                                <strong class="text-dark mr-3">Sizes:</strong>

                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="size-1" name="productsize" value="XS">
                                    <label class="custom-control-label" for="size-1">XS</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="size-2" name="productsize" value="S">
                                    <label class="custom-control-label" for="size-2">S</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="size-3" name="productsize" value="M">
                                    <label class="custom-control-label" for="size-3">M</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="size-4" name="productsize" value="L">
                                    <label class="custom-control-label" for="size-4">L</label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" class="custom-control-input" id="size-5" name="productsize" value="XL">
                                    <label class="custom-control-label" for="size-5">XL</label>
                                </div>
                            </div>
                            <div class="d-flex align-items-center mb-4 pt-2">
                                <div class="input-group quantity mr-3" style="width: 130px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary btn-minus">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input name="productquantity" type="text" class="form-control bg-secondary border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                                <button name="action" class="btn btn-primary px-3" type="submit" value="addtocart"><i class="fa fa-shopping-cart mr-1"></i> Add To
                                    Cart</button>
                                
                                <input type="hidden" name="productid" value="<%=request.getParameter("productid")%>">
                                <input type="hidden" name="productname" value="<%=request.getParameter("productname")%>">
                                <input type="hidden" name="productdesc" value="<%=request.getParameter("productdesc")%>">
                                <input type="hidden" name="productschool" value="<%=request.getParameter("productschool")%>">
                                <input type="hidden" name="productimglink" value="<%=request.getParameter("productimglink")%>">
                                <input type="hidden" name="productprice" value="<%=request.getParameter("productprice")%>">
                            </div>
                        </form>
                        <div class="d-flex pt-2">
                            <strong class="text-dark mr-2">Share on:</strong>
                            <div class="d-inline-flex">
                                <a class="text-dark px-2" href="https://www.facebook.com" target="_blank">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a class="text-dark px-2" href="https://twitter.com" target="_blank">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a class="text-dark px-2" href="https://www.instagram.com" target="_blank">
                                    <i class="fab fa-instagram"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row px-xl-5">
                <div class="col">
                    <div class="bg-light p-30">
                        <div class="nav nav-tabs mb-4">
                            <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Description</a>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="tab-pane-1">
                                <h4 class="mb-3">Product Description</h4>
                                <p><%=request.getParameter("productdesc")%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Detail End -->

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
