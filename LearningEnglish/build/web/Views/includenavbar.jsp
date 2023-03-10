<%-- 
    Document   : includenavbar
    Created on : Mar 9, 2023, 11:28:07 AM
    Author     : datla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>EduHome</title>

        <!-- Favicon -->
        <link rel="shortcut icon" href="./Views/assets/img/favicon.ico" type="image/x-icon">

        <!-- Font awesome -->
        <link href="./Views/assets/css/font-awesome.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="./Views/assets/css/bootstrap.css" rel="stylesheet">
        <!-- Slick slider -->
        <link rel="stylesheet" type="text/css" href="./Views/assets/css/slick.css">
        <!-- Fancybox slider -->
        <link rel="stylesheet" href="./Views/assets/css/jquery.fancybox.css" type="text/css" media="screen" />
        <!-- Theme color -->
        <link id="switcher" href="./Views/assets/css/theme-color/default-theme.css" rel="stylesheet">

        <!-- Main style sheet -->
        <link href="./Views/assets/css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <!-- Google Fonts -->
        <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,300,300italic,500,700' rel='stylesheet'
              type='text/css'>

    </head>
    <style>

        .search-box{
            width: fit-content;
            height: fit-content;
            position: relative;
            margin-left: 250px;
            margin-top: 10px;
        }
        .input-search{
            height: 50px;
            width: 50px;
            border-style: none;
            padding: 10px;
            font-size: 18px;
            letter-spacing: 2px;
            outline: none;
            border-radius: 25px;
            transition: all .5s ease-in-out;
            background-color: #01BAFD;
            padding-right: 40px;
            color: black;
        }
        .input-search::placeholder{
            color: black;
            font-size: 18px;
            letter-spacing: 2px;
            font-weight: 100;
        }
        .btn-search{
            width: 50px;
            height: 50px;
            border-style: none;
            font-size: 20px;
            font-weight: bold;
            outline: none;
            cursor: pointer;
            border-radius: 50%;
            position: absolute;
            right: 0px;
            color: black;
            background-color:transparent;
            pointer-events: painted;
        }
        .btn-search:focus ~ .input-search{
            width: 300px;
            border-radius: 0px;
            background-color: transparent;
            border-bottom:1px solid black;
            transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
        }
        .input-search:focus{
            width: 300px;
            border-radius: 0px;
            background-color: transparent;
            border-bottom:1px solid black;
            transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
        }

    </style>
    <body>

        <!--START SCROLL TOP BUTTON -->
        <a class="scrollToTop" href="#">
            <i class="fa fa-angle-up"></i>
        </a>
        <!-- END SCROLL TOP BUTTON -->
        <!-- End header  -->
        <!-- Start menu -->
        <section id="mu-menu">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                                aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <!-- LOGO -->
                        <!-- TEXT BASED LOGO -->
                        <a class="navbar-brand" href="index.html"><i class="fa fa-university"></i><span>Varsity</span></a>
                        <!-- IMG BASED LOGO  -->
                        <form action="/LearningEnglish/search" method="post">
                            <div class="search-box">
                                <button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
                                <input type="text" name="search" class="input-search" placeholder="Type to Search...">
                            </div>
                        </form>
                        <!-- <a class="navbar-brand" href="index.html"><img src="./Views/assets/img/logo.png" alt="logo"></a> -->
                    </div>



                    <div id="navbar" class="navbar-collapse collapse">
                        <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
                            <li class="active"><a href="index.html">Home</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Course <span
                                        class="fa fa-angle-down"></span></a>


                                <ul class="dropdown-menu" role="menu">
                                    <c:if test="${account.role == 1}">
                                        <li><a href="/LearningEnglish/teacher/manageCourse">Manage Course</a></li>
                                        <li><a href="/LearningEnglish/teacher/manageClassOnline">Manage Class Online</a></li>
                                        <li><a href="/LearningEnglish/loadSchedule">View Schedule</a></li>
                                        </c:if>
                                        <c:if test="${account.role == 2}">
                                        <li>
                                            <a href="/LearningEnglish/student/course">My Course</a>
                                        </li>
                                        <li><a href="/LearningEnglish/loadSchedule">View Schedule</a></li>
                                    </c:if>    
                                    <li><a href="/LearningEnglish/search?categoryId=10">Grade 10 </a></li>
                                    <li><a href="/LearningEnglish/search?categoryId=11">Grade 11</a></li>
                                    <li><a href="/LearningEnglish/search?categoryId=12" >Grade 12</a></li>

                                </ul>
                            </li>
                            
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <span
                                        class="fa fa-angle-down"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="blog-archive.html">Blog Archive</a></li>
                                    <li><a href="blog-single.html">Blog Single</a></li>
                                </ul>
                            </li>
                            <li><a href="/LearningEnglish/manageTeacher">Manage Teacher</a></li>
                                <c:if test="${account.username != null}">
                                <li class="dropdown">

                                    <img src="${profile.avatar}" class="img-circle"
                                         style="width: 50px; height: 50px;margin-top: 10px;margin-left: 10px;position: absolute;"
                                         alt="Avatar" />
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-left: 50px;"> <span
                                            class="fa fa-angle-down"></span></a>
                                    <ul class="dropdown-menu" role="menu">

                                        <c:if test="${account.role == 1}">
                                            <li><a href="myExpertProfile"> <i style="margin-right: 10px;" class="fa-solid fa-user"></i>Profile ${account.fullname}</a>
                                            </li>
                                            <li><a href="editMyExpertPassword"><i style="margin-right: 10px;" class="fa-solid fa-key"></i>Change
                                                    password</a></li> 
                                                </c:if>
                                                <c:if test="${account.role == 2}">
                                            <li><a href="myStudentProfile"> <i style="margin-right: 10px;" class="fa-solid fa-user"></i>Profile ${account.fullname}</a>
                                            </li>
                                            <li><a href="editMyStudentPassword"><i style="margin-right: 10px;" class="fa-solid fa-key"></i>Change
                                                    password</a></li>
                                                </c:if>
                                        <li><a href="/LearningEnglish/logout"> <i style="margin-right: 10px;"
                                                                                  class="fa-solid fa-right-from-bracket"></i>Log out</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                            <c:if test="${account.username == null}">
                                <li><a href="/LearningEnglish/login">Login</a></li>
                                </c:if>    

                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </nav>
        </section>
        

        <!-- jQuery library -->
        <script src="./Views/assets/js/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="./Views/assets/js/bootstrap.js"></script>
        <!-- Slick slider -->
        <script type="text/javascript" src="./Views/assets/js/slick.js"></script>
        <!-- Counter -->
        <script type="text/javascript" src="./Views/assets/js/waypoints.js"></script>
        <script type="text/javascript" src="./Views/assets/js/jquery.counterup.js"></script>
        <!-- Mixit slider -->
        <script type="text/javascript" src="./Views/assets/js/jquery.mixitup.js"></script>
        <!-- Add fancyBox -->
        <script type="text/javascript" src="./Views/assets/js/jquery.fancybox.pack.js"></script>


        <!-- Custom js -->
        <script src="./Views/assets/js/custom.js"></script>

    </body>

</html>