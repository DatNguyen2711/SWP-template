<%-- 
    Document   : register
    Created on : Jan 28, 2023, 9:55:51 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./Views/css/style.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <!-- Tabs Titles -->
                <!-- <h2 class="inactive underlineHover"> Sign In </h2> -->
                <h2 class="active" >Sign Up </h2>
                <a href="/TestFontend/login">sign-in</a>



                <!-- Login Form -->
                <form class ="signup-form" method="/TestFontend/register" method="post">
                    <label id="icon" for="name"><i class="icon-user"></i></label>
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="username" required><br>
                    <label id="icon" for="name"><i class="icon-shield"></i></label>
                    <input type="text" id="password" class="fadeIn third" name="password" placeholder="password" required><br>
                    <label id="icon" for="name"><i class="icon-shield"></i></label>
                    <input type="text" id="confirm-pass" class="fadeIn third" name="confirm-password" placeholder="Confirm password" required><br>
                    <label id="icon" for="name"><i class="icon-user"></i></label>
                    <input type="text" id="fullname" class="fadeIn third" name="fullname" placeholder="Fullname" required><br>
                    <label id="icon" for="name"><i class="icon-calendar"></i></label>
                    <input type="text" id="age" class="fadeIn third" name="age" placeholder="Age" required><br>
                    <label id="icon" for="name"><i class="icon-home"></i></label>
                    <input type="text" id="address" class="fadeIn third" name="address" placeholder="Address">

                    <label class="container">Female
                        <input type="radio" checked="checked" name="radio">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">Male
                        <input type="radio" name="radio">
                        <span class="checkmark"></span>
                    </label>

                    </label><br>

                    <label id="icon" for="name"><i class="icon-envelope"></i></label>
                    <input type="text" name="email" id="name"  placeholder="Email" required/><br>
                    <label id="icon" for="name"><i class="icon-phone"></i></label>
                    <input type="text" id="password" class="fadeIn third" name="phone" placeholder="Phone"><br>

                    <form >
                        <h2>Role :</h2>
                        <select name="role" id="lang" size="1">
                            <option value="teacher">Teacher</option>
                            <option value="student">Student</option>

                        </select>
                    </form>




                    <input type="submit" class="fadeIn fourth" value="Sign Up">
                </form>



            </div>
        </div>
    </body>
</html>
