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
        <link rel="stylesheet" href="./Views/css/styles.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Document</title>
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <i style="color: #56baed;margin-top: 20px;font-size: 40px" class="fa-solid fa-building-columns"></i></br>
                <h2 class="active"> Sign In </h2>
                <a href="/LearningEnglish/register">sign-up</a>
                <p style="text-align: center;font-size: 22px">Welcomme Back !</p>

                <!-- Login Form -->
                <form sction="/LearningEnglish/login" method="post">
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="Username">
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password">
                    <input type="submit" class="fadeIn fourth" value="Log In">
                    <div>${message}</div>
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover" href="/LearningEnglish/forgetPassword">Forgot Password?</a>
                </div>

            </div>
        </div>
    </body>
</html>

