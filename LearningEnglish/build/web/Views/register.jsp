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
        <link rel="stylesheet" href="./Views/css/styles.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600' rel='stylesheet' type='text/css'>
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="wrapper fadeInDown">
            <div id="formContent" >

                <h2 class="active" >Sign Up </h2>
                <a href="/LearningEnglish/login">sign-in</a>

                <form class ="signup-form" action="/LearningEnglish/register" method="post">
                    <label id="icon" for="name"><i style="color: #56baed"class="icon-user"></i></label>
                    <input type="text" id="login" class="fadeIn second" name="username" placeholder="username" required><br>
                    <label id="icon" for="name"><i style="color: #56baed"class="icon-shield"></i></label>
                    <input type="password" id="password" class="fadeIn third" name="password" onchange="Check()" placeholder="password" required><br>
                    <label id="icon" for="name"><i style="color: #56baed"class="icon-shield"></i></label>
                    <input type="password" id="confirm-pass" class="fadeIn third" oninput="Check()" name="confirm-password" placeholder="Confirm password" required><br>
                    <div id="mess"></div>
                    <label id="icon" for="name"><i style="color: #56baed"class="icon-user"></i></label>
                    <input type="text" id="fullname" class="fadeIn third" name="fullname" placeholder="Fullname" required><br>
                    <label id="icon" for="name"><i style="color: #56baed"class="icon-calendar"></i></label>
                    <input type="number" id="age" class="fadeIn third" name="age" placeholder="Age" required><br>
                    <label id="icon" for="name"><i style="color: #56baed"class="icon-home"></i></label>
                    <input type="text" id="address" class="fadeIn third" name="address" placeholder="Address">

                    <label class="container">Female
                        <input type="radio" checked="checked" value="female" name="gender">
                        <span class="checkmark"></span>
                    </label>
                    <label class="container">Male
                        <input type="radio" name="gender" value="male">
                        <span class="checkmark"></span>
                    </label>

                    </label><br>

                    <label id="icon" for="name"><i style="color: #56baed"class="icon-envelope"></i></label>
                    <input type="text" name="email" id="name"  placeholder="Email" required/><br>
                    <label id="icon" for="name"><i style="color: #56baed"class="icon-phone"></i></label>
                    <input type="number" id="phone" class="fadeIn third" name="phone" placeholder="Phone"><br>

                    <!--<form >-->
                    <h2>Role :</h2>
                    <select name="role" id="lang" size="1">
                        <option value="1">Teacher</option>
                        <option value="2">Student</option>
                    </select>
                    <!--</form>-->
                    <div>${mess}</div>
                    <input id="btnSubmit" type="submit" class="fadeIn fourth" value="Sign Up"/>
                </form>



            </div>
        </div>
        <script>
            function Check() {
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirm-pass").value;
                if (password !== confirmPassword) {
                    document.getElementById("mess").innerHTML = "password must be equal to confirm-password";
                    document.getElementById("btnSubmit").setAttribute("disabled", "disabled");
                } else {
                    document.getElementById("mess").innerHTML = "";
                    document.getElementById("btnSubmit").removeAttribute("disabled");
                }
            }
        </script>
    </body>
</html>
