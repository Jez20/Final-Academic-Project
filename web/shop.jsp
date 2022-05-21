<%-- 
    Document   : shop
    Created on : Apr 23, 2022, 11:52:24 AM
    Author     : USER
--%>

<%@page import="Model.Security"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop</title>
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
                        <span class="breadcrumb-item active">Shop</span>
                        <span class="breadcrumb-item active">Store Items</span>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->


        <!-- Shop Start -->
        <div class="container-fluid">
            <div class="row px-xl-5">
                <!-- Shop Sidebar Start -->
                <div class="col-lg-3 col-md-4">
                    <!-- Price Start -->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price</span></h5>
                    <div class="bg-light p-4 mb-30">
                        <form>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-1" name="price" checked>
                                <label class="custom-control-label" for="price-1">All Price</label>
                                <span class="badge border font-weight-normal">500</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-2" name="price">
                                <label class="custom-control-label" for="price-2">₱100-300</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-3" name="price">
                                <label class="custom-control-label" for="price-3">₱300-600</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-4" name="price">
                                <label class="custom-control-label" for="price-4">₱600-900</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-5" name="price">
                                <label class="custom-control-label" for="price-5">₱900-1200</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-6" name="price">
                                <label class="custom-control-label" for="price-6">₱1200-1500+</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                        </form>
                    </div>
                    <!-- Price End -->

                    <!-- Color Start -->
                    <!--                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by color</span></h5>
                                    <div class="bg-light p-4 mb-30">
                                        <form>
                                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                                <input type="radio" class="custom-control-input" checked id="color-all">
                                                <label class="custom-control-label" for="price-all">All Color</label>
                                                <span class="badge border font-weight-normal">1000</span>
                                            </div>
                                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                                <input type="radio" class="custom-control-input" id="color-1">
                                                <label class="custom-control-label" for="color-1">Black</label>
                                                <span class="badge border font-weight-normal">150</span>
                                            </div>
                                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                                <input type="radio" class="custom-control-input" id="color-2">
                                                <label class="custom-control-label" for="color-2">White</label>
                                                <span class="badge border font-weight-normal">295</span>
                                            </div>
                                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                                <input type="radio" class="custom-control-input" id="color-3">
                                                <label class="custom-control-label" for="color-3">Red</label>
                                                <span class="badge border font-weight-normal">246</span>
                                            </div>
                                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                                <input type="radio" class="custom-control-input" id="color-4">
                                                <label class="custom-control-label" for="color-4">Blue</label>
                                                <span class="badge border font-weight-normal">145</span>
                                            </div>
                                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between">
                                                <input type="radio" class="custom-control-input" id="color-5">
                                                <label class="custom-control-label" for="color-5">Green</label>
                                                <span class="badge border font-weight-normal">168</span>
                                            </div>
                                        </form>
                                    </div>-->
                    <!-- Color End -->

                    <!-- Size Start -->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by size</span></h5>
                    <div class="bg-light p-4 mb-30">
                        <form>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-1" name="size" checked>
                                <label class="custom-control-label" for="size-1">All Size</label>
                                <span class="badge border font-weight-normal">500</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-2" name="size">
                                <label class="custom-control-label" for="size-2">XS</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-3" name="size">
                                <label class="custom-control-label" for="size-3">S</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-4" name="size">
                                <label class="custom-control-label" for="size-4">M</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-5" name="size">
                                <label class="custom-control-label" for="size-5">L</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-6" name="size">
                                <label class="custom-control-label" for="size-6">XL</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                        </form>
                    </div>
                    <!-- Size End -->

                    <!-- Gender Start -->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by Gender</span></h5>
                    <div class="bg-light p-4 mb-30">
                        <form>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="gender-1" name="gender" checked>
                                <label class="custom-control-label" for="gender-1">All Gender</label>
                                <span class="badge border font-weight-normal">300</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="gender-2" name="gender">
                                <label class="custom-control-label" for="gender-2">Male</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="gender-3" name="gender">
                                <label class="custom-control-label" for="gender-3">Female</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="gender-4" name="gender">
                                <label class="custom-control-label" for="gender-4">Unisex</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                        </form>
                    </div>
                    <!-- Gender End -->

                    <!-- University Start -->
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by University</span></h5>
                    <div class="bg-light p-4 mb-30">
                        <form>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-1" name="university" checked>
                                <label class="custom-control-label" for="university-1">All Universities</label>
                                <span class="badge border font-weight-normal">800</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-2" name="university">
                                <label class="custom-control-label" for="university-2">Adamson Soaring Falcons</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-3" name="university">
                                <label class="custom-control-label" for="university-3">Ateneo Blue Eagles</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-4" name="university">
                                <label class="custom-control-label" for="university-4">De Lasalle Green Archers</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-5" name="university">
                                <label class="custom-control-label" for="university-5">FEU Tamaraws</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-6" name="university">
                                <label class="custom-control-label" for="university-6">NU Bulldogs</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-7" name="university">
                                <label class="custom-control-label" for="university-7">UE Red Warriors</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-8" name="university">
                                <label class="custom-control-label" for="university-8">UP Fighting Maroons</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-9" name="university">
                                <label class="custom-control-label" for="university-9">UST Growling Tigers</label>
                                <span class="badge border font-weight-normal">100</span>
                            </div>
                        </form>
                    </div>
                    <!-- University End -->

                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-8">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <!--                            <div>
                                                                <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
                                                                <button class="btn btn-sm btn-light ml-2"><i class="fa fa-bars"></i></button>
                                                            </div>-->
                                <div class="ml-2">
                                    <div class="btn-group">
                                        <!--                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Sorting</button>
                                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                                <a class="dropdown-item" href="#">Latest</a>
                                                                                <a class="dropdown-item" href="#">Popularity</a>
                                                                                <a class="dropdown-item" href="#">Best Rating</a>
                                                                            </div>-->
                                    </div>
                                    <div class="btn-group ml-2">
                                        <!--                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Showing</button>
                                                                            <div class="dropdown-menu dropdown-menu-right">
                                                                                <a class="dropdown-item" href="#">10</a>
                                                                                <a class="dropdown-item" href="#">20</a>
                                                                                <a class="dropdown-item" href="#">30</a>
                                                                            </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%                            
                            ResultSet rs = (ResultSet) request.getAttribute("rs");
                            Security security = (Security) request.getAttribute("encrypt");
                            if (rs != null) {
                                String previousName = "";
                                while (rs.next()) {
                                    String id = security.encrypt(rs.getString(1));
                                    String name = rs.getString(2);
                                    String desc = rs.getString(3);
                                    String school = rs.getString(4);
                                    String link = rs.getString(5);
                                    String price = rs.getString(8);
                                    if (!previousName.equals(name)) {
                                        {%>
                        <div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" id="ADU" src=<%}
                                        out.print(link);
                                        {%> alt="">
                                    <div class="product-action">
                                        <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                                        <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none text-truncate" href=""><%}
                                        out.print(name);
                                        {%></a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5>₱ <%}
                                            out.print(price);
                                            {%></h5>
                                        <input type="hidden" name="id" value=<%}
                                            out.print(id);
                                            {%>/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}
                                    }
                                    previousName = name;
                                }
                            }
                        %>

                        <!--                    <div class="col-12">
                                                <nav>
                                                  <ul class="pagination justify-content-center">
                                                    <li class="page-item disabled"><a class="page-link" href="#">Previous</span></a></li>
                                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                  </ul>
                                                </nav>
                                            </div>-->
                    </div>
                </div>
                <!-- Shop Product End -->
            </div>
        </div>
        <!-- Shop End -->

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
