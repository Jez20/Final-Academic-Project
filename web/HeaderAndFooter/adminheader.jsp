<%-- 
    Document   : adminheader
    Created on : May 22, 2022, 9:20:07 PM
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
                                        out.print((String) session.getAttribute("email"));
                                    } else {
                                        out.print("My Account");
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
                            <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">0</span>
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
                                <a href="Reports.jsp" class="nav-item nav-link">Reports</a>
                                <a href="AdminServlet?action=viewproducts" class="nav-item nav-link">Product List</a>
                                <a href="AdminAddProduct.jsp" class="nav-item nav-link">Add Product</a>
                                <a href="AdminServlet?action=orderlist" class="nav-item nav-link">Customer Order List</a>
                            </div> 
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->
    </body>
</html>
