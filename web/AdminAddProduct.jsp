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
        <title>The Store - Add Product</title>
    </head>
    <header>
        <%@ include file="HeaderAndFooter/header.jsp"%>
    </header>
    <body>
        <div class="container-fluid">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Administrator - Add Product</span></h2>
            <div class="row px-xl-5">
                <div class="col-lg-7 mb-5">
                    <div class="contact-form bg-light p-30">
                        <div id="success"></div>
                        <form name="sentMessage" id="contactForm" novalidate="novalidate">
                            <div class="control-group">
                                <input type="text" class="form-control" id="name" placeholder="Product Name"
                                       required="required" data-validation-required-message="Please enter the product name" />
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <input type="email" class="form-control" id="email" placeholder="Product Description"
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
                            <div class="form-group row">
                                <div class="col-sm-2">Choose Gender/s:</div>
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="gridCheck1" value="U">
                                        <label class="form-check-label" for="gridCheck1">
                                            Unisex
                                        </label>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-2">Choose Size/s:</div>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="XS">
                                                <label class="form-check-label" for="gridCheck1">XS</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="S">
                                                <label class="form-check-label" for="gridCheck1">S</label>
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="M">
                                                <label class="form-check-label" for="gridCheck1">M</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="L">
                                                <label class="form-check-label" for="gridCheck1">L</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="XL">
                                                <label class="form-check-label" for="gridCheck1">XL</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <p class="help-block text-danger"></p>
                                        </div>
                                    </div>
                                    <p class="help-block text-danger"></p>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck1" value="M">
                                    <label class="form-check-label" for="gridCheck1">
                                        Male
                                    </label>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-2">Choose Size/s:</div>
                                    <div class="col-sm-10">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck1" value="XS">
                                            <label class="form-check-label" for="gridCheck1">XS</label> 
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck1" value="S">
                                            <label class="form-check-label" for="gridCheck1">S</label>
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck1" value="M">
                                            <label class="form-check-label" for="gridCheck1">M</label> 
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck1" value="L">
                                            <label class="form-check-label" for="gridCheck1">L</label> 
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck1" value="XL">
                                            <label class="form-check-label" for="gridCheck1">XL</label> 
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                            <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                        </div>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="gridCheck1" value="F">
                                    <label class="form-check-label" for="gridCheck1">
                                        Female
                                    </label>
                                    <div class="form-group row">
                                        <div class="col-sm-2">Choose Size/s:</div>
                                        <div class="col-sm-10">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="XS">
                                                <label class="form-check-label" for="gridCheck1">XS</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="S">
                                                <label class="form-check-label" for="gridCheck1">S</label>
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="M">
                                                <label class="form-check-label" for="gridCheck1">M</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="L">
                                                <label class="form-check-label" for="gridCheck1">L</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="gridCheck1" value="XL">
                                                <label class="form-check-label" for="gridCheck1">XL</label> 
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Price">
                                                <input type="text" class="form-check-text" id="colFormLabelSm" placeholder="Stock/s">
                                            </div>
                                            <p class="help-block text-danger"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Add Product</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
<!--        <h1> Administrator - Add Product</h1>
        <input type="text" name="Product Name" class="form-control" placeholder="Product Name" required>
        <input type="text" name="Product Description" class="form-control" placeholder="Product Description" required>
        <select name="school" id="school">
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
        <select name="Category" id="Category">
            <option selected value="No category selected">Choose apparel catergory...</option>
            <option value="Caps">Caps</option>
            <option value="Classic Shirts">Classic Shirts</option>
            <option value="Polo Shirts">Polo Shirts</option>
            <option value="Jackets">Jackets</option>
            <option value="Bottoms">Bottoms</option>
            <option value="Sweat Shirt">Sweat Shirt</option>
            <option value="Pocket Tees">Pocket Tees</option>
        </select>
        <p>Product Variations</p>
        
        <input type="text" name="img link" class="form-control" placeholder="image link" required>-->
    </body>
    <footer>
        <%@ include file="HeaderAndFooter/footer.jsp"%>
    </footer>
</html>
