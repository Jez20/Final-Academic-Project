<%-- 
    Document   : cart
    Created on : Apr 23, 2022, 11:51:29 AM
    Author     : USER
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
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
        <title>Cart</title>
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
                        <span class="breadcrumb-item active">Cart</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Cart Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-light table-borderless table-hover text-center mb-0">
                        <thead class="thead-dark">
                            <tr>
                                <th>Products</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody class="align-middle">
                            <%
                                ArrayList<Order> cart = new ArrayList<Order>();
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
                                    {%>
                            <tr>
                                <td class="align-middle"><img src="<%=imgLink%>" alt="" style="width: 50px;"><%=name%></td>
                                <td class="align-middle"><%=price%></td>
                                <td class="align-middle">
                                    1
                                </td>
                                <td class="align-middle"><%=orderTotalPrice%></td>
                                <td class="align-middle">
                                    <form action="PaymentServlet" method="POST">
                                        <button name="action" value="deletesample" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button>
                                        <input name="cartindex" type="hidden" value="<%=i%>">
                                    </form>
                                </td>
                            </tr>
                            <%}
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">
                    <!--                <form class="mb-30" action="">
                                        <div class="input-group">
                                            <input type="text" class="form-control border-0 p-4" placeholder="Coupon Code">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary">Apply Coupon</button>
                                            </div>
                                        </div>
                                    </form>-->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Cart Summary</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <div class="border-bottom pb-2">
                            <div class="d-flex justify-content-between mb-3">
                                <h6>Subtotal</h6>
                                <h6><%=totalPrice%></h6>
                            </div>
                            <div class="d-flex justify-content-between">
                                <h6 class="font-weight-medium">Shipping</h6>
                                <h6 class="font-weight-medium">0</h6>
                            </div>
                        </div>
                        <div class="pt-2">
                            <div class="d-flex justify-content-between mt-2">
                                <h5>Total</h5>
                                <h5><%=totalPrice%></h5>
                            </div>
                            <form action="PaymentServlet" method="GET">
                                <button name="action" value="checkout" class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed To Checkout</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->

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
