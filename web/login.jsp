<%-- 
    Document   : login
    Created on : May 7, 2022, 9:28:07 PM
    Author     : Joseph
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Login</title>
        <link rel"stylesheet" type="text/css" href="CSS/loginstyle.css">
    </head>
    <body>
        <div class="loginbox">
            <form action="LogInSignInServlet" method="GET">
                <h1>The Store - Login</h1>
                <p>Enter Email</p>
                <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="abc@email.com" required>
                <p>Enter Password</p>
                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                <p>Prove that you are not a robot</p><br>

                <img src="<c:url value="Captcha.png" />">

                <input type="text" name="captcha" class="form-control" placeholder="Enter phrase" required>
                <center><button type="SUBMIT" name="action" value="login">Log in</button></center><br><br>
                <form>
                    <u><a href="signup.jsp">Don't have an account? Sign up for free!</a></u><br>
                    <u><a href="index.jsp">Go back to Homepage</a></u>
                    </div>
                    </body>
                    </html>
                    <style>
                        body{
                            margin: 0;
                            padding: 0;
                            background-image: url("https://upload.wikimedia.org/wikipedia/commons/b/b8/UAAP_Season_82_Ateneo_v._UST_Basketball_Finals_Game_2.jpg");
                            background-size: cover;
                            background-position: center;
                            background-repeat: no-repeat;
                            background-attachment: fixed;
                            font-family: sans-serif;
                        }
                        .loginbox{
                            width: 320px;
                            height: 470px;
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
                    </style>