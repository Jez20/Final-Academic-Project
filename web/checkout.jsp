<%-- 
    Document   : checkout
    Created on : Apr 23, 2022, 11:51:37 AM
    Author     : USER
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Order"%>
<%@page import="Model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%
    String servlet2 = "";
    if (session.getAttribute("email") == null && session.getAttribute("role") == null) {
        response.sendRedirect("GuestServlet");
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
        <title>Checkout</title>
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
                        <span class="breadcrumb-item active">Checkout</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Checkout Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-lg-8">
                    <form action="PaymentServlet" method="GET">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Billing Address</span></h5>
                    <div class="bg-light p-30 mb-5">
                                <div class="row">
                                    <form action="PaymentServlet" method="GET">
                                        <div class="col-md-6 form-group">
                                            <label>First Name</label>
                                            <input name="fname" class="form-control" type="text" placeholder="John">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Last Name</label>
                                            <input name="lname" class="form-control" type="text" placeholder="Doe">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>E-mail</label>
                                            <input name="email" class="form-control" type="text" placeholder="example@email.com">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Mobile No</label>
                                            <input name="mobilenumber" class="form-control" type="text" placeholder="+63">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Address Line 1</label>
                                            <input name="addressline1" class="form-control" type="text" placeholder="123 Street">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Address Line 2</label>
                                            <input name="addressline2" class="form-control" type="text" placeholder="123 Street">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>Country</label>
                                            <select  name="country" class="custom-select">
                                                <option selected>Philippines</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>City</label>
                                            <input name="city" class="form-control" type="text" placeholder="Manila">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>State</label>
                                            <input name="state" class="form-control" type="text" placeholder="Manila">
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label>ZIP Code</label>
                                            <input name="zipcode" class="form-control" type="text" placeholder="0000">
                                        </div>
                                </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="border-bottom">
                            <h6 class="mb-3">Products</h6>
                            <% ArrayList<Order> cart = new ArrayList<Order>();
                                if (session.getAttribute("cart") != null) {
                                    cart = (ArrayList<Order>) session.getAttribute("cart");
                                }

                                int totalPrice = 0;
                                for (int i = 0; i < cart.size(); i++) {
                                    Order thisOrder = cart.get(i);
                                    String name = thisOrder.getOrderName();
                                    String imgLink = thisOrder.getImgLink();
                                    int variantId = thisOrder.getVariantId();
                                    int quantity = thisOrder.getOrderQuantity();
                                    int orderTotalPrice = thisOrder.getOrderPrice();
                                    int price = orderTotalPrice;
                                    totalPrice += orderTotalPrice;

                                    {%>  <div class="d-flex justify-content-between">
                                <p><%=name%></p>
                                <p>₱<%=orderTotalPrice%></p>
                            </div>
                            <%}
                            }%>
                            <div class="border-bottom pt-3 pb-2">
                                <div class="d-flex justify-content-between mb-3">
                                    <h6>Subtotal</h6>
                                    <h6>₱<%=totalPrice%></h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Shipping</h6>
                                    <h6 class="font-weight-medium">₱0</h6>
                                </div>
                            </div>
                            <div class="pt-2">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5>Total</h5>
                                    <h5>₱<%=totalPrice%></h5>
                                </div>
                            </div>
                        </div>
                        <div class="mb-5">
                            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Payment</span></h5>
                            <div class="bg-light p-30">
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" value="gcash" id="gcash">
                                        <label class="custom-control-label" for="gcash">Gcash</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" name="payment" value="paymaya" id="paymaya">
                                        <label class="custom-control-label" for="paymaya" >PayMaya</label>
                                    </div>
                                </div>

                                <button name="action" value="confirm" class="btn btn-block btn-primary font-weight-bold py-3">Confirm Order</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Checkout End -->

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
