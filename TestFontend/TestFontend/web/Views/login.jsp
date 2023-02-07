

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
                <a href="/TestFontend/register">sign-up</a>

                <!-- Login Form -->
                <form action="/TestFontend/login" method="post">
                    <div id="alert"  style="color:red; margin: 5px">
                        ${message}
                    </div>
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
        <script>
            const myDiv = document.getElementById("alert");

            myDiv.style.display = "block";

            setTimeout(function () {
                myDiv.style.transition = "opacity 3s";
                myDiv.style.opacity = 0;
            }, 3000);

            setTimeout(function () {
                myDiv.style.display = "none";
            }, 4000);
        </script>

    </body>


</html>

