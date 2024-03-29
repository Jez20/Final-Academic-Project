<%-- 
    Document   : signup
    Created on : May 5, 2022, 4:30:14 PM
    Author     : Joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    session.removeAttribute("email");
    session.removeAttribute("userid");
    session.removeAttribute("cart");
    session.removeAttribute("counter");
    session.removeAttribute("role");
%>
<html>
    <head>
        <% //template
            if (false) {
                {%>
    <h1>hello<h1>
            <%}
                }

            %>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>The Store: Sign - Up</title>
            </head>
            <body>
                <div class="loginbox">
                    <form action="LogInSignInServlet" method="GET">
                        <h1>The Store - Sign Up</h1>
                        <p>Enter Email</p>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="example@email.com" required>
                        <small id="emailHelp" class="form-text text-muted">Your email will serve as your username when you login.</small><br><br>
                        <p>Enter Password</p>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                        <p>Confirm Password</p>
                        <input type="password" name="confirm_password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                        <p>Role</p><br>
                        <select class="select" name="role">
                            <option value="customer">Customer </option>
                            <option value="administrator">Administrator </option>
                        </select><br><br>
                        <p>Prove that you are not a robot</p><br>

                        <img src="<c:url value="Captcha.png" />">

                        <input type="text" name="captcha" class="form-control" placeholder="Enter phrase" required>
                        <center><button type="submit" name="action" value="signup" >Sign Up</button></center><br><br>
                        <form>
                            <u><a href="login.jsp">I already have an account</a></u><br>
                            <u><a href="index.jsp">Go back to Homepage</a></u>
                            </div>
                            </body>

                            </html>
                            <style>
                                body{
                                    margin: 0;
                                    padding: 0;
                                    background-image: url("https://ptvnews.ph/wp-content/uploads/2022/03/COVER.jpg");
                                    background-size: cover;
                                    background-position: center;
                                    background-repeat: no-repeat;
                                    background-attachment: fixed;
                                    font-family: sans-serif;
                                }
                                .loginbox{
                                    width: 420px;
                                    height: 670px;
                                    background: black;
                                    color: #fff;
                                    top: 50%;
                                    left: 50%;
                                    position: absolute;
                                    transform: translate(-50%, -50%);
                                    boxing-size: border-box;
                                    padding: 60px 30px;
                                    border-radius: 15px;
                                }
                                .radio{
                                    position: relative;
                                    display: inline-flex;
                                    align-items: center;
                                    cursor: pointer;
                                    margin-right: 10px;
                                }
                                h1{
                                    margin: 0;
                                    padding: 0 0 20px;
                                    text-align: center;
                                    font-size: 22px;
                                }
                                .loginbox p{
                                    margin: 0;
                                    padding: 0;
                                    font-weight: bold;
                                }
                                .loginbox input {
                                    width: 100%;
                                    margin-bottom: 20px;
                                }
                                .loginbox input[type="email"], input[type="password"], input[type="text"]{
                                    border: none;
                                    border-bottom: 1px solid #fff;
                                    background: transparent;
                                    outline: none;
                                    height: 40px;
                                    color: white;
                                    font-size: 16px;
                                }
                                .loginbox button[type="submit"]{
                                    border: none;
                                    outline: none;
                                    height: 40px;
                                    width: 200px;
                                    background: yellow;
                                    color: black;
                                    font-size: 20px;
                                    border-radius: 10px;
                                }
                                .loginbox button[type="submit"]:hover{
                                    cursor: pointer;
                                    background: yellowgreen;
                                    color: black;
                                }
                                .loginbox a{
                                    text-decoration: none;
                                    font-size: 14px;
                                    line-height: 20px;
                                    color: white;
                                }
                                .loginbox a:hover{
                                    color: yellowgreen;
                                }
                                .select {
                                    padding: 8px;
                                    width: 150px;
                                    font-size:16px;
                                    border: 0;
                                    border-bottom: 3px solid teal;
                                }
                                .p {
                                    margin-top: 10px;
                                }
                            </style>