
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
        <!-- End menu -->
        <!-- Start search box -->

        <!-- End search box -->
        <!-- Start Slider -->
        <section id="mu-slider">

            <!-- Start single slider item -->
            <div class="mu-slider-single">
                <div class="mu-slider-img">
                    <figure>
                        <img src="./Views/assets/img/slider/2.jpg" alt="img">
                    </figure>
                </div>
                <div class="mu-slider-content">
                    <h4>Premiumu Quality Free Template</h4>
                    <span></span>
                    <h2>Best Education Template Ever</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor amet error eius reiciendis eum sint
                        unde
                        eveniet deserunt est debitis corporis temporibus recusandae accusamus.</p>
                    <a href="#" class="mu-read-more-btn">Read More</a>
                </div>
            </div>
            <!-- Start single slider item -->

            <!-- Start single slider item -->
        </section>
        <!-- End Slider -->
        <!-- Start service  -->
        <section id="mu-service">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="mu-service-area">
                            <!-- Start single service -->
                            <div class="mu-service-single">
                                <span class="fa fa-book"></span>
                                <h3>Learn Online</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima officiis, deleniti
                                    dolorem
                                    exercitationem praesentium, est!</p>
                            </div>
                            <!-- Start single service -->
                            <!-- Start single service -->
                            <div class="mu-service-single">
                                <span class="fa fa-users"></span>
                                <h3>Expert Teachers</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima officiis, deleniti
                                    dolorem
                                    exercitationem praesentium, est!</p>
                            </div>
                            <!-- Start single service -->
                            <!-- Start single service -->
                            <div class="mu-service-single">
                                <span class="fa fa-table"></span>
                                <h3>Best Classrooms</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima officiis, deleniti
                                    dolorem
                                    exercitationem praesentium, est!</p>
                            </div>
                            <!-- Start single service -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End service  -->
        <div class="container">
            <div class="search"></div>
        </div> <!-- Start about us -->
        <section id="mu-about-us">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-about-us-area">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="mu-about-us-left">
                                        <!-- Start Title -->
                                        <div class="mu-title">
                                            <h2>About Us</h2>
                                        </div>
                                        <!-- End Title -->
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum pariatur fuga
                                            eveniet soluta
                                            aspernatur rem, nam voluptatibus voluptate voluptates sapiente, inventore.
                                            Voluptatem, maiores esse
                                            molestiae.</p>
                                        <ul>
                                            <li>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</li>
                                            <li>Saepe a minima quod iste libero rerum dicta!</li>
                                            <li>Voluptas obcaecati, iste porro fugit soluta consequuntur. Veritatis?</li>
                                            <li>Ipsam deserunt numquam ad error rem unde, omnis.</li>
                                            <li>Repellat assumenda adipisci pariatur ipsam eos similique, explicabo.</li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis quaerat
                                            harum facilis
                                            excepturi et? Mollitia!</p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End about us -->

        <!-- Start about us counter -->
        <section id="mu-abtus-counter">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-abtus-counter-area">
                            <div class="row">
                                <!-- Start counter item -->
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <div class="mu-abtus-counter-single">
                                        <span class="fa fa-book"></span>
                                        <h4 class="counter">678</h4>
                                        <p>Subjects</p>
                                    </div>
                                </div>
                                <!-- End counter item -->
                                <!-- Start counter item -->
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <div class="mu-abtus-counter-single">
                                        <span class="fa fa-users"></span>
                                        <h4 class="counter">3500</h4>
                                        <p>Students</p>
                                    </div>
                                </div>
                                <!-- End counter item -->
                                <!-- Start counter item -->
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <div class="mu-abtus-counter-single">
                                        <span class="fa fa-flask"></span>
                                        <h4 class="counter">65</h4>
                                        <p>Modern Lab</p>
                                    </div>
                                </div>
                                <!-- End counter item -->
                                <!-- Start counter item -->
                                <div class="col-lg-3 col-md-3 col-sm-3">
                                    <div class="mu-abtus-counter-single no-border">
                                        <span class="fa fa-user-secret"></span>
                                        <h4 class="counter">250</h4>
                                        <p>Teachers</p>
                                    </div>
                                </div>
                                <!-- End counter item -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End about us counter -->

        <!-- Start features section -->
        <section id="mu-features">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="mu-features-area">
                            <!-- Start Title -->
                            <div class="mu-title">
                                <h2>Our Features</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio ipsa ea maxime
                                    mollitia, vitae
                                    voluptates, quod at, saepe reprehenderit totam aliquam architecto fugiat sunt animi!</p>
                            </div>
                            <!-- End Title -->
                            <!-- Start features content -->
                            <div class="mu-features-content">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4  col-sm-6">
                                        <div class="mu-single-feature">
                                            <span class="fa fa-book"></span>
                                            <h4>Professional Courses</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus non
                                                dolorem excepturi libero
                                                itaque sint labore similique maxime natus eum.</p>
                                            <a href="#">Read More</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6">
                                        <div class="mu-single-feature">
                                            <span class="fa fa-users"></span>
                                            <h4>Expert Teachers</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus non
                                                dolorem excepturi libero
                                                itaque sint labore similique maxime natus eum.</p>
                                            <a href="#">Read More</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6">
                                        <div class="mu-single-feature">
                                            <span class="fa fa-laptop"></span>
                                            <h4>Online Learning</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus non
                                                dolorem excepturi libero
                                                itaque sint labore similique maxime natus eum.</p>
                                            <a href="#">Read More</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6">
                                        <div class="mu-single-feature">
                                            <span class="fa fa-microphone"></span>
                                            <h4>Audio Lessons</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus non
                                                dolorem excepturi libero
                                                itaque sint labore similique maxime natus eum.</p>
                                            <a href="#">Read More</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6">
                                        <div class="mu-single-feature">
                                            <span class="fa fa-film"></span>
                                            <h4>Video Lessons</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus non
                                                dolorem excepturi libero
                                                itaque sint labore similique maxime natus eum.</p>
                                            <a href="#">Read More</a>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-6">
                                        <div class="mu-single-feature">
                                            <span class="fa fa-certificate"></span>
                                            <h4>Professional Certificate</h4>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus non
                                                dolorem excepturi libero
                                                itaque sint labore similique maxime natus eum.</p>
                                            <a href="#">Read More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End features content -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End features section -->

        <!-- Start latest course section -->
        <section id="mu-latest-courses">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="mu-latest-courses-area">
                            <!-- Start Title -->
                            <div class="mu-title">
                                <h2>Latest Courses</h2>
                            </div>
                            <!-- End Title -->
                            <!-- Start latest course content -->
                            <div id="mu-latest-course-slide" class="mu-latest-courses-content">
                                <c:forEach items="${course}" var="c">
                                    <div class="col-lg-4 col-md-4 col-xs-12">
                                        <div class="mu-latest-course-single">
                                            <figure class="mu-latest-course-img">
                                                <a href="#"><img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg" alt="img"></a>
                                                <figcaption class="mu-latest-course-imgcaption">
                                                    <a href="#">Academic</a>
                                                    <span><i class="fa fa-clock-o"></i>45Days</span>
                                                </figcaption>
                                            </figure>
                                            <div class="mu-latest-course-single-content">
                                                <h4><a href="/LearningEnglish/courseDetail?courseId=${c.courseId}">${c.nameCourse}</a></h4>
                                                <p>${c.title}</p>
                                                <div class="mu-latest-course-single-contbottom">
                                                    <a class="mu-course-details" href="#">Details</a>
                                                    <span class="mu-course-price" href="#">$165.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- End our teacher -->
        <section id="mu-our-teacher">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-our-teacher-area">
                            <!-- begain title -->
                            <div class="mu-title">
                                <h2>Grade 12</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa, repudiandae, suscipit
                                    repellat minus
                                    molestiae ea.</p>
                            </div>
                            <!-- end title -->
                            <!-- begain our teacher content -->
                            <div class="mu-our-teacher-content">
                                <div class="row">
                                    <c:forEach items="${classOnlines}" var="c">
                                    <div class="col-lg-3 col-md-3 col-sm-6">
                                        <div class="mu-latest-course-single">
                                            <figure class="mu-latest-course-img">
                                                <a href="#"><img src="./Views/assets/img/courses/1.jpg" alt="img"></a>
                                                <figcaption class="mu-latest-course-imgcaption">
                                                    <a href="#">Drawing</a>
                                                    <span><i class="fa fa-clock-o"></i>90Days</span>
                                                </figcaption>
                                            </figure>
                                            <div style="box-shadow: 2px 2px 5px rgba(0,0,0,0.1);"
                                                 class="mu-latest-course-single-content">
                                                <h4><a s href="/LearningEnglish/classOnlineDetail?id=${c.id}">${c.nameClass}</a></h4>
                                                <p>Teacher : </p>
                                                <div class="mu-latest-course-single-contbottom">
                                                    <a class="mu-course-details" href="#">Details</a>
                                                    <span class="mu-course-price" href="#">$165.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
<!--                                    <div class="col-lg-3 col-md-3 col-sm-6">
                                        <div class="mu-latest-course-single">
                                            <figure class="mu-latest-course-img">
                                                <a href="#"><img src="./Views/assets/img/courses/1.jpg" alt="img"></a>
                                                <figcaption class="mu-latest-course-imgcaption">
                                                    <a href="#">Drawing</a>
                                                    <span><i class="fa fa-clock-o"></i>90Days</span>
                                                </figcaption>
                                            </figure>
                                            <div class="mu-latest-course-single-content">
                                                <h4><a href="#">Lorem ipsum dolor sit amet.</a></h4>
                                                <p>Teacher : </p>
                                                <div class="mu-latest-course-single-contbottom">
                                                    <a class="mu-course-details" href="#">Details</a>
                                                    <span class="mu-course-price" href="#">$165.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6">
                                        <div class="mu-latest-course-single">
                                            <figure class="mu-latest-course-img">
                                                <a href="#"><img src="./Views/assets/img/courses/1.jpg" alt="img"></a>
                                                <figcaption class="mu-latest-course-imgcaption">
                                                    <a href="#">Drawing</a>
                                                    <span><i class="fa fa-clock-o"></i>90Days</span>
                                                </figcaption>
                                            </figure>
                                            <div class="mu-latest-course-single-content">
                                                <h4><a href="#">Lorem ipsum dolor sit amet.</a></h4>
                                                <p>Teacher : </p>
                                                <div class="mu-latest-course-single-contbottom">
                                                    <a class="mu-course-details" href="#">Details</a>
                                                    <span class="mu-course-price" href="#">$165.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6">
                                        <div class="mu-latest-course-single">
                                            <figure class="mu-latest-course-img">
                                                <a href="#"><img src="./Views/assets/img/courses/1.jpg" alt="img"></a>
                                                <figcaption class="mu-latest-course-imgcaption">
                                                    <a href="#">Drawing</a>
                                                    <span><i class="fa fa-clock-o"></i>90Days</span>
                                                </figcaption>
                                            </figure>
                                            <div class="mu-latest-course-single-content">
                                                <h4><a href="#">Lorem ipsum dolor sit amet.</a></h4>
                                                <p>Teacher : </p>
                                                <div class="mu-latest-course-single-contbottom">
                                                    <a class="mu-course-details" href="#">Details</a>
                                                    <span class="mu-course-price" href="#">$165.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>-->
                                </div>
                            </div>
                            <!-- End our teacher content -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Start our teacher -->
        <section id="mu-our-teacher">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-our-teacher-area">
                            <!-- begain title -->
                            <div class="mu-title">
                                <h2>Our Teachers</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa, repudiandae, suscipit
                                    repellat minus
                                    molestiae ea.</p>
                            </div>
                            <!-- end title -->
                            <!-- begain our teacher content -->
                            <div class="mu-our-teacher-content">
                                <div class="row">
                                    <c:forEach items="${listProfileOfExperts}" var="i">
                                    <div class="col-lg-3 col-md-3 col-sm-6">
                                        <div class="mu-our-teacher-single">
                                            <figure class="mu-our-teacher-img">
                                                <img src="${i.avatar}" alt="teacher img">
                                                <div class="mu-our-teacher-social">
                                                    <a href="#"><span class="fa fa-facebook"></span></a>
                                                    <a href="#"><span class="fa fa-twitter"></span></a>
                                                    <a href="#"><span class="fa fa-linkedin"></span></a>
                                                    <a href="#"><span class="fa fa-google-plus"></span></a>
                                                </div>
                                            </figure>
                                            <div class="mu-ourteacher-single-content">
                                                <h4>${(expertServices.getExpertByUsername(i.username)).fullname}</h4>
                                                <span>English Teacher</span>
                                                <p>${i.title}</p>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- End our teacher content -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Start testimonial -->
        <section id="mu-testimonial">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-testimonial-area">
                            <div id="mu-testimonial-slide" class="mu-testimonial-content">
                                <!-- start testimonial single item -->
                                <div class="mu-testimonial-item">
                                    <div class="mu-testimonial-quote">
                                        <blockquote>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem rerum
                                                soluta aperiam
                                                blanditiis obcaecati eveniet aliquam consequatur nobis eaque id.</p>
                                        </blockquote>
                                    </div>
                                    <div class="mu-testimonial-img">
                                        <img src="./Views/assets/img/testimonial-1.png" alt="img">
                                    </div>
                                    <div class="mu-testimonial-info">
                                        <h4>John Doe</h4>
                                        <span>Happy Student</span>
                                    </div>
                                </div>
                                <!-- end testimonial single item -->
                                <!-- start testimonial single item -->
                                <div class="mu-testimonial-item">
                                    <div class="mu-testimonial-quote">
                                        <blockquote>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem rerum
                                                soluta aperiam
                                                blanditiis obcaecati eveniet aliquam consequatur nobis eaque id.</p>
                                        </blockquote>
                                    </div>
                                    <div class="mu-testimonial-img">
                                        <img src="./Views/assets/img/testimonial-3.png" alt="img">
                                    </div>
                                    <div class="mu-testimonial-info">
                                        <h4>Rebaca Michel</h4>
                                        <span>Happy Parent</span>
                                    </div>
                                </div>
                                <!-- end testimonial single item -->
                                <!-- start testimonial single item -->
                                <div class="mu-testimonial-item">
                                    <div class="mu-testimonial-quote">
                                        <blockquote>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptatem rerum
                                                soluta aperiam
                                                blanditiis obcaecati eveniet aliquam consequatur nobis eaque id.</p>
                                        </blockquote>
                                    </div>
                                    <div class="mu-testimonial-img">
                                        <img src="./Views/assets/img/testimonial-2.png" alt="img">
                                    </div>
                                    <div class="mu-testimonial-info">
                                        <h4>Stev Smith</h4>
                                        <span>Happy Student</span>
                                    </div>
                                </div>
                                <!-- end testimonial single item -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End testimonial -->

        <!-- Start footer -->
        <footer id="mu-footer">
            <!-- start footer top -->
            <div class="mu-footer-top">
                <div class="container">
                    <div class="mu-footer-top-area">
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>Information</h4>
                                    <ul>
                                        <li><a href="#">About Us</a></li>
                                        <li><a href="">Features</a></li>
                                        <li><a href="">Course</a></li>
                                        <li><a href="">Event</a></li>
                                        <li><a href="">Sitemap</a></li>
                                        <li><a href="">Term Of Use</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>Student Help</h4>
                                    <ul>
                                        <li><a href="">Get Started</a></li>
                                        <li><a href="#">My Questions</a></li>
                                        <li><a href="">Download Files</a></li>
                                        <li><a href="">Latest Course</a></li>
                                        <li><a href="">Academic News</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>News letter</h4>
                                    <p>Get latest update, news & academic offers</p>
                                    <form class="mu-subscribe-form">
                                        <input type="email" placeholder="Type your Email">
                                        <button class="mu-subscribe-btn" type="submit">Subscribe!</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3">
                                <div class="mu-footer-widget">
                                    <h4>Contact</h4>
                                    <address>
                                        <p>P.O. Box 320, Ross, California 9495, USA</p>
                                        <p>Phone: (415) 453-1568 </p>
                                        <p>Website: www.markups.io</p>
                                        <p>Email: info@markups.io</p>
                                    </address>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end footer top -->

        </footer>
        <!-- End footer -->

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