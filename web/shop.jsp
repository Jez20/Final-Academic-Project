<%-- 
    Document   : shop
    Created on : Apr 23, 2022, 11:52:24 AM
    Author     : USER
--%>

<%@page import="Model.Security"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>Store Items</title>
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
                    <%
                        String selectedPriceRange = "0-999999";
                        if (request.getParameter("price") != null) {
                            selectedPriceRange = request.getParameter("price");
                        }
                        String allPrice = "";
                        String oneHundred = "";
                        String threeHundred = "";
                        String sixHundred = "";
                        String nineHundred = "";
                        String onethousandTwoHundred = "";
                        if (selectedPriceRange.equals("0-999999")) {
                            allPrice = "checked";
                        }
                        if (selectedPriceRange.equals("100-300")) {
                            oneHundred = "checked";
                        }
                        if (selectedPriceRange.equals("300-600")) {
                            threeHundred = "checked";
                        }
                        if (selectedPriceRange.equals("600-900")) {
                            sixHundred = "checked";
                        }
                        if (selectedPriceRange.equals("900-1200")) {
                            nineHundred = "checked";
                        }
                        if (selectedPriceRange.equals("1200-1500")) {
                            onethousandTwoHundred = "checked";
                        }
                    %>
                    <form method="GET" action="<%=servlet2%>">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by price</span></h5>
                        <div class="bg-light p-4 mb-30">

                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-1" name="price" value="0-999999" checked>
                                <label class="custom-control-label" for="price-1">All Price</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-2" name="price" value="100-300">
                                <label class="custom-control-label" for="price-2">₱100-300</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-3" name="price" value="300-600">
                                <label class="custom-control-label" for="price-3">₱300-600</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-4" name="price" value="600-900">
                                <label class="custom-control-label" for="price-4">₱600-900</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-5" name="price" value="900-1200">
                                <label class="custom-control-label" for="price-5">₱900-1200</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="price-6" name="price" value="1200-1500">
                                <label class="custom-control-label" for="price-6">₱1200-1500+</label>

                            </div>
                            <button name="action" value="filter" type="submit" class="btn btn-primary px-3"><i class="fa fa-filter mr-1"></i>Apply Filter</button>

                        </div>
                        <!-- Price End -->

                        <!-- Size Start -->
                        <%
                            String selectedSize = "";
                            if (request.getParameter("size") != null) {
                                selectedSize = request.getParameter("size");
                            }
                            String allSize = "";
                            String XS = "";
                            String S = "";
                            String M = "";
                            String L = "";
                            String XL = "";
                            if (selectedSize.equals("")) {
                                allSize = "checked";
                            }
                            if (selectedSize.equals("XS")) {
                                XS = "checked";
                            }
                            if (selectedSize.equals("S")) {
                                S = "checked";
                            }
                            if (selectedSize.equals("M")) {
                                M = "checked";
                            }
                            if (selectedSize.equals("L")) {
                                L = "checked";
                            }
                            if (selectedSize.equals("XL")) {
                                XL = "checked";
                            }

                        %>
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by size</span></h5>
                        <div class="bg-light p-4 mb-30">

                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-1" name="size" value="" <%=allSize%>>
                                <label class="custom-control-label" for="size-1">All Size</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-2" name="size" value="XS" <%=XS%>>
                                <label class="custom-control-label" for="size-2">XS</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-3" name="size" value="S" <%=S%>>
                                <label class="custom-control-label" for="size-3">S</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-4" name="size" value="M" <%=M%>>
                                <label class="custom-control-label" for="size-4">M</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-5" name="size" value="L" <%=L%>>
                                <label class="custom-control-label" for="size-5">L</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="size-6" name="size" value="XL" <%=XL%>>
                                <label class="custom-control-label" for="size-6">XL</label>

                            </div>
                            <button name="action" value="filter" type="submit" class="btn btn-primary px-3"><i class="fa fa-filter mr-1"></i>Apply Filter</button>


                        </div>
                        <!-- Size End -->

                        <!-- Gender Start -->
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by Gender</span></h5>
                        <div class="bg-light p-4 mb-30">

                            <%
                                String selectedGender = "";
                                if (request.getParameter("gender") != null) {
                                    selectedGender = request.getParameter("gender");
                                }
                                String allGender = "";
                                String male = "";
                                String female = "";
                                String unisex = "";
                                if (selectedGender.equals("")) {
                                    allGender = "checked";
                                }
                                if (selectedGender.equals("M")) {
                                    male = "checked";
                                }
                                if (selectedGender.equals("F")) {
                                    female = "checked";
                                }
                                if (selectedGender.equals("U")) {
                                    unisex = "checked";
                                }


                            %>

                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="gender-1" name="gender" value="" <%=allGender%>>
                                <label class="custom-control-label" for="gender-1">All Gender</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="gender-2" name="gender" value="M" <%=male%>>
                                <label class="custom-control-label" for="gender-2">Male</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="gender-3" name="gender" value="F" <%=female%>>
                                <label class="custom-control-label" for="gender-3">Female</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3" <%=unisex%>>
                                <input type="radio" class="custom-control-input" id="gender-4" name="gender" value="U">
                                <label class="custom-control-label" for="gender-4">Unisex</label>

                            </div>
                            <button type="submit" value="filter" class="btn btn-primary px-3"><i class="fa fa-filter mr-1"></i>Apply Filter</button>

                        </div>
                        <!-- Gender End -->

                        <!-- University Start -->
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Filter by University</span></h5>
                        <div class="bg-light p-4 mb-30">

                            <%
                                String selectedUniversity = "";
                                if (request.getParameter("university") != null) {
                                    selectedUniversity = request.getParameter("gender");
                                }
                                String allUniv = "";
                                String adamson = "";
                                String ateneo = "";
                                String la_salle = "";
                                String feu = "";
                                String nu = "";
                                String ue = "";
                                String up = "";
                                String ust = "";
                                if (selectedUniversity.equals("")) {
                                    allUniv = "checked";
                                }
                                if (selectedUniversity.equals("ADAMSON")) {
                                    adamson = "checked";
                                }
                                if (selectedUniversity.equals("ATENEO")) {
                                    ateneo = "checked";
                                }
                                if (selectedUniversity.equals("LA SALLE")) {
                                    la_salle = "checked";
                                }
                                if (selectedUniversity.equals("FEU")) {
                                    feu = "checked";
                                }
                                if (selectedUniversity.equals("NU")) {
                                    nu = "checked";
                                }
                                if (selectedUniversity.equals("UE")) {
                                    ue = "checked";
                                }
                                if (selectedUniversity.equals("UP")) {
                                    up = "checked";
                                }
                                if (selectedUniversity.equals("UST")) {
                                    ust = "checked";
                                }
                            %>


                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-1" name="university" value="" <%=allUniv%>>
                                <label class="custom-control-label" for="university-1">All Universities</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-2" name="university" value="ADAMSON" <%=adamson%>>
                                <label class="custom-control-label" for="university-2">Adamson Soaring Falcons</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-3" name="university" value="ATENEO" <%=ateneo%>>
                                <label class="custom-control-label" for="university-3">Ateneo Blue Eagles</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-4" name="university" value="LA SALLE" <%=la_salle%>>
                                <label class="custom-control-label" for="university-4">De Lasalle Green Archers</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-5" name="university" value="FEU" <%=feu%>>
                                <label class="custom-control-label" for="university-5">FEU Tamaraws</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-6" name="university" value="NU" <%=nu%>>
                                <label class="custom-control-label" for="university-6">NU Bulldogs</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-7" name="university" value="UE" <%=ue%>>
                                <label class="custom-control-label" for="university-7">UE Red Warriors</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-8" name="university" value="UP" <%=up%>>
                                <label class="custom-control-label" for="university-8">UP Fighting Maroons</label>

                            </div>
                            <div class="custom-control custom-radio d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" id="university-9" name="university" value="UST" <%=ust%>>
                                <label class="custom-control-label" for="university-9">UST Growling Tigers</label>

                            </div>
                            <button name="action" value="filter" type="submit" class="btn btn-primary px-3"><i class="fa fa-filter mr-1"></i>Apply Filter</button>

                        </div>
                        <!-- University End -->
                    </form>
                </div>
                <!-- Shop Sidebar End -->


                <!-- Shop Product Start -->
                <div class="col-lg-9 col-md-8">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="ml-2">
                                    <div class="btn-group">
                                    </div>
                                    <div class="btn-group ml-2">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%                            
                            ResultSet rs = (ResultSet) request.getAttribute("rs");
                            if (rs != null) {
                                String previousName = "";
                                while (rs.next()) {
                                    String id = rs.getString(1);
                                    String name = rs.getString(2);
                                    String desc = rs.getString(3);
                                    String school = rs.getString(4);
                                    String link = rs.getString(5);
                                    String price = rs.getString(8);
                                    if (!name.equals(previousName)) {
                                        {%><div class="col-lg-4 col-md-6 col-sm-6 pb-1">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" id="ADU" src=<%=link%> alt="">
                                    <div class="product-action">
                                        <form action="GuestServlet" method="GET">
                                            <button name="action" value="detail" class="btn btn-outline-dark btn-square"><i class="fa fa-search"></i></button>
                                            <input type="hidden" name="productid" value="<%=id%>">
                                            <input type="hidden" name="productname" value="<%=name%>">
                                            <input type="hidden" name="productdesc" value="<%=desc%>">
                                            <input type="hidden" name="productschool" value="<%=school%>">
                                            <input type="hidden" name="productimglink" value="<%=link%>">
                                            <input type="hidden" name="productprice" value="<%=price%>">
                                        </form>
                                    </div>
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none text-truncate" href=""><%=name%></a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5>₱ <%=price%></h5>

                                    </div>
                                </div>
                            </div>
                        </div><%}
                                    }
                                    previousName = name;
                                }
                            }
                        %>
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
