<%-- 
    Document   : login
    Created on : Jan 27, 2023, 9:03:28 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./Views/css/style.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
        <title>Document</title>
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> Sign In </h2>
                <!-- <h2 class="inactive underlineHover" href="sign-up.html">Sign Up </h2> -->
                <a href="/TestFontend/register">sign-up</a>


                <!-- Login Form -->
                <form sction="/TestFontend/login" method="post">
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="username">
                    <input type="text" id="password" class="fadeIn third" name="password" placeholder="password">
                    <input type="submit" class="fadeIn fourth" value="Log In">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="/TestFontend/forgetPassword">Forgot Password?</a>
                </div>

            </div>
        </div>
    </body>
</html>

