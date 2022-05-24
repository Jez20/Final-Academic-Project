<%-- 
    Document   : index
    Created on : Apr 23, 2022, 11:09:24 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%>
<%
    String servlet2 = "";
    if (session.getAttribute("userid") == null && session.getAttribute("role") == null) {
        servlet2 = "GuestServlet";
    }
    if (session.getAttribute("userid") != null && session.getAttribute("role") == null) {
        servlet2 = "LoggedInServlet";
    }
    if (session.getAttribute("userid") != null && session.getAttribute("role") != null) {
        servlet2 = "AdminServlet";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    
    <header>
        <%@ include file="HeaderAndFooter/header.jsp"%>
    </header>
    
    <body>
        <!-- Carousel Start -->
    <div class="container-fluid mb-3">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#header-carousel" data-slide-to="1"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item position-relative active" style="height: 830px;">
                            <img class="position-absolute w-100 h-100" src="https://www.schoolbusclothing.com/wp-content/uploads/2019/03/UP-Oblation800x800.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 600px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Men Fashion</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Get the best clothes that you are yearning for with fashion for men here at theStore.</p>
                                    <button class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="<%out.print(servlet);%>?price=0-999999&action=filter&size=&gender=&university=">Shop Now</button>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 830px;">
                            <img class="position-absolute w-100 h-100" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-clothing_NU_SBC-E-101_Model_2.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 600px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Women Fashion</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Find the best and latest apparel you're craving for with top local and trend women's clothing on theStore!</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="<%out.print(servlet);%>?price=0-999999&action=filter&size=&gender=&university=">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="product-offer mb-30" style="height: 400px;">
                    <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-clothing_DLSU_SBC-B-109-GN-Never-Shall-Front_Model4.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white ">Green, white, go, fight!</h6>
                        <h3 class="text-white mb-3">Rektikano, keena keena!</h3>
                        <a href="<%out.print(servlet);%>?price=0-999999&action=filter&size=&gender=&university=" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
                <div class="product-offer mb-30" style="height: 400px;">
                    <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/4-3.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white ">Black Gold, Black White</h6>
                        <h3 class="text-white mb-3">Go USTe! Go USTe! Go USTe!</h3>
                        <a href="<%out.print(servlet);%>?price=0-999999&action=filter&size=&gender=&university=" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->


    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Categories</span></h2>
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=ADAMSON"">
                    <div class="cat-item d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://i.ibb.co/jZy0HZS/Adu.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>Adamson Soaring Falcons</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=ATENEO"">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/2-quick-view-IMG_1299-1.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>Ateneo Blue Eagles</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=LA SALLE"">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-clothing_DLSU_SBC-B-109-GN-Never-Shall-Front_Model4.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>De Lasalle Green Archers</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=FEU">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-cothing_FEU_SBC-C-108-Y-FEU-Future-Front_Model1.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>FEU Tamaraws</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=NU">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-clothing_NU_SBC-E-101_Model_2.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>NU Bulldogs</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=UE">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://i.ibb.co/Cn9vmG8/UE.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>UE Red Warriors</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=UP">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2019/03/UP-Oblation800x800.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>UP Fighting Maroons</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="<%out.print(servlet);%>?action=UST">
                    <div class="cat-item img-zoom d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/4-3.jpg" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>UST Growling Tigers</h6>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!-- Categories End -->

    <!-- Offer Start -->
    <div class="container-fluid pt-5 pb-3">
        <div class="row px-xl-5">
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 800px;">
                    <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/2-quick-view-IMG_1299-1.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white ">One Big One Fight</h6>
                        <h3 class="text-white mb-3">Go Ateneo!</h3>
                        <a href="<%out.print(servlet);%>?price=0-999999&action=filter&size=&gender=&university=" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="product-offer mb-30" style="height: 800px;">
                    <img class="img-fluid" src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-cothing_FEU_SBC-C-108-Y-FEU-Future-Front_Model1.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white ">Go Fight Green and Gold!</h6>
                        <h3 class="text-white mb-3">Let's Go Tamaraws!</h3>
                        <a href="<%out.print(servlet);%>?price=0-999999&action=filter&size=&gender=&university=" class="btn btn-primary">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="bg-light p-4" >
                        <img src="https://i.ibb.co/5FKwRTn/resized-image-Promo-removebg-preview.png" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="https://www.schoolbusclothing.com/wp-content/uploads/2018/10/schoolbus-clothing-ateneo-logo-262x262.png" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-clothing-dlsu-logo.png" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="https://www.schoolbusclothing.com/wp-content/uploads/2018/09/schoolbus-clothing-feu-logo.png" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="https://www.schoolbusclothing.com/wp-content/uploads/2018/10/schoolbus-clothing-nu-logo-262x262.png" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="https://i.ibb.co/1vZ3cL9/UE-Red-Warriors-Logo-svg-1.png" alt="UE-Red-Warriors-Logo-svg-1" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="https://www.schoolbusclothing.com/wp-content/uploads/2019/03/schoolbus-clothing-up-logo-262x262.png" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="https://www.schoolbusclothing.com/wp-content/uploads/2018/10/schoolbus-clothing-ust-logo-262x262.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->
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
