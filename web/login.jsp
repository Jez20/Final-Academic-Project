<%-- 
    Document   : login
    Created on : May 7, 2022, 9:28:07 PM
    Author     : Joseph
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The Store - Login</title>
        <link rel"stylesheet" type="text/css" href="CSS/loginstyle.css">
        
<!--        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>-->
    </head>
    <body>
        <div class="loginbox">
            <h1>The Store - Login</h1>
            <p>Enter Email</p>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="abc@email.com" required>
            <p>Enter Password</p>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
            <p>Prove that you are not a robot</p>
            <!--enter captcha code here -->
            <input type="text" class="form-control" placeholder="Enter phrase" required>
            <center><button type="button" >Log in</button></center><br><br>
            <u><a href="#">Don't have an account? Sign up for free!</a></u><br>
            <u><a href="#">Go back to Homepage</a></u>
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
.loginbox button[type="button"]{
    border: none;
    outline: none;
    height: 40px;
    width: 200px;
    background: yellow;
    color: black;
    font-size: 20px;
    border-radius: 10px;
}
.loginbox button[type="button"]:hover{
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