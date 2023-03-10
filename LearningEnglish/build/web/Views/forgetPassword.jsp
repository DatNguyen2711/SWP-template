<%-- 
    Document   : forgetPassword
    Created on : Jan 28, 2023, 10:26:44 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./Views/css/styles.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
        <title>Document</title>
    </head>
    <body>
        <form action="/LearningEnglish/forgetPassword" method="post">
            <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <h2 class="active"> forgot password </h2>


                <!-- Login Form -->
                <form action="/TestFontend/forgetPassword" method="post">
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="username" required>
                    <p>${message}</p>
                    <input type="submit" class="fadeIn fourth" value="Send">
                </form>

                <!-- Remind Passowrd -->
                <div id="formFooter">
                    <a class="underlineHover"></a>
                </div>

            </div>
        </div>
        </form>
        
    </body>
</html>
