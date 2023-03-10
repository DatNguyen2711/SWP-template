<%-- 
    Document   : resetPassword
    Created on : Jan 28, 2023, 10:57:59 AM
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
    <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="active"> Change Password </h2>

   
    <!-- Login Form -->
    <form action="/LearningEnglish/resetPassword" method="post">
      <input type="password" id="password" class="fadeIn second" name="new-password" onchange="Check()" placeholder="New Passowrd" required>
      <input type="password" id="confirm-pass" class="fadeIn third" name="confirm-password" oninput="Check()" placeholder="Confirm Passowrd" required>
      <p id="mess"></p>
      <input id="btnSubmit" type="submit" class="fadeIn fourth" value="Submit">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#"></a>
    </div>

  </div>
</div>
    <script>
            function Check(){
                var password = document.getElementById("password").value;
                var confirmPassword = document.getElementById("confirm-pass").value;
                if(password !== confirmPassword){
                    document.getElementById("mess").innerHTML = "password must be equal to confirm-password";
                    document.getElementById("btnSubmit").setAttribute("disabled", "disabled");
                }else{
                    document.getElementById("mess").innerHTML = "";
                    document.getElementById("btnSubmit").removeAttribute("disabled");
                }
            }
        </script>
</body>
</html>
