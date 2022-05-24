<%-- 
    Document   : header
    Created on : Apr 23, 2022, 11:14:33 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">  

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="CSS/style.css" rel="stylesheet">

    </head>
    <body>
        <!-- Topbar Start -->
        <div class="container-fluid">
            <div class="row bg-primary py-1 px-xl-5">
                <div class="col-lg-6 d-none d-lg-block">
                    <div class="d-inline-flex align-items-center h-100">
                        <a class="text-body mr-3" href="https://www.adamson.edu.ph/ustore/?page=categories&cat=apparel" target="_blank">ADU</a>
                        <a class="text-body mr-3" href="https://www.prepsportswear.com/college/us/florida/sarasota/ateneo-de-manila-university-blue-eagles?schoolid=1783077" target="_blank">ADMU</a>
                        <a class="text-body mr-3" href="https://animonation.com/collections/all" target="_blank">DLSU</a>
                        <a class="text-body mr-3" href="https://feualumnistore.com/collections/all#MainContent" target="_blank">FEU</a>
                        <a class="text-body mr-3" href="https://www.prepsportswear.com/college/us/california/san-diego/national-university-university?schoolid=2064476&ca_pid=12026390&gclid=Cj0KCQjw06OTBhC_ARIsAAU1yOXE1xvHguoII3_oTazWm1aOQvdXtAX7W6672EPr2YmJaQC5Z4Usk1IaArEyEALw_wcB" target="_blank">NU</a>
                        <a class="text-body mr-3" href="https://shopee.ph/upbeat.ph/" target="_blank">UP</a>
                        <a class="text-body mr-3" href="https://www.ue.edu.ph/mla/souvenir-shop/" target="_blank">UE</a>
                        <a class="text-body mr-3" href="https://campusthreadph.com/product-tag/ust/" target="_blank">UST</a>
                        <%
                            String servlet = "";
                            if (session.getAttribute("email") == null && session.getAttribute("role") == null) {
                                servlet = "GuestServlet";
                            }
                            if (session.getAttribute("email") != null && session.getAttribute("role") == null) {
                                servlet = "LoggedInServlet";
                            }
                            if (session.getAttribute("email") != null && session.getAttribute("role") != null) {
                                servlet = "LoggedInServlet";
                            }
                        %>
                    </div>
                </div>
                <div class="col-lg-6 text-center text-lg-right">
                    <div class="d-inline-flex align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">
                                <%
                                    if (session.getAttribute("email") != null) {
                                        {%>
                                <%=(String) session.getAttribute("email")%>
                                <%}
                                } else {
                                    {%>
                                My Account
                                <%}
                                    }
                                %>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <%                                    if (session.getAttribute("userid") != null) {
                                        {%>
                                <form action="LoggedInServlet" method="GET">
                                    <button name="action" value="logout" class="dropdown-item" type="submit">Log out</button>
                                </form>
                                <%}
                                } else {
                                    {%>
                                <a href="login.jsp">
                                    <button class="dropdown-item" type="button">Log in</button>
                                </a>
                                <a href="signup.jsp">
                                    <button class="dropdown-item" type="button">Sign Up</button>
                                </a>
                                <%}
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <div class="d-inline-flex align-items-center d-block d-lg-none">
                        <a href="" class="btn px-0 ml-2">
                            <i class="fas fa-shopping-cart text-dark"></i>
                            <%
                                int cartNumber = 0;
                                if (session.getAttribute("counter") != null) {
                                    cartNumber = (Integer) session.getAttribute("counter");
                                }
                            %>
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;"><%=cartNumber%></span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="row align-items-center bg-dark py-3 px-xl-5 d-none d-lg-flex">
                <div class="col-lg-4">
                    <a href="" class="text-decoration-none">
                        <a class="navbar-brand"><img src ="img/logo.png" class="img-responsive logo" alt="Logo" ></a>
                    </a>
                </div>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <div class="container-fluid bg-dark mb-30">
            <div class="row px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                        <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <%
                    %>
                   <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                        <div class="navbar-nav w-100">
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=ADAMSON" class="nav-link dropdown-toggle">ADU Apparel</a>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=ATENEO" class="nav-link dropdown-toggle">ADMU Apparel</a>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=LA SALLE" class="nav-link dropdown-toggle">DLSU Apparel</a>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=FEU" class="nav-link dropdown-toggle">FEU Apparel</a>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=NU" class="nav-link dropdown-toggle">NU Apparel</a>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=UE" class="nav-link dropdown-toggle">UE Apparel</a>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=UP" class="nav-link dropdown-toggle">UP Apparel</a>
                            </div>
                            <div class="nav-item dropdown dropright">
                                <a href="<%out.print(servlet);%>?action=UST" class="nav-link dropdown-toggle">UST Apparel</a>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <span class="h1 text-uppercase text-dark bg-light px-2" style="color: #FFB340 !important">The</span>
                            <span class="h1 text-uppercase text-dark bg-warning px-2 ml-n1" style="color: #004AAB !important">Store</span>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="index.jsp" class="nav-item nav-link">Home</a>
                                <a href="<%out.print(servlet);%>?price=0-999999&action=filter&size=&gender=&university=" class="nav-item nav-link">Shop</a>
                                <a href="cart.jsp" class="nav-item nav-link">Cart</a>
                            </div>
                            <div class="navbar-nav ml-auto py-0 d-none d-lg-block">
                                <a href="" class="btn px-0 ml-3">
                                    <i class="fas fa-shopping-cart text-primary"></i>
                                    <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px;"><%=cartNumber%></span>
                                </a>
                            </div>   
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->
    </body>
</html>
