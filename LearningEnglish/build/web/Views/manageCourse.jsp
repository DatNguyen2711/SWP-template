<%-- 
    Document   : manageCourse
    Created on : Feb 6, 2023, 11:55:01 AM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>EduHome</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="../Views/assets/img/favicon.ico" type="image/x-icon">

    <!-- Font awesome -->
    <link href="../Views/assets/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="../Views/assets/css/bootstrap.css" rel="stylesheet">
    <!-- Slick slider -->
    <link rel="stylesheet" type="text/css" href="../Views/assets/css/slick.css">
    <!-- Fancybox slider -->
    <link rel="stylesheet" href="../Views/assets/css/jquery.fancybox.css" type="text/css" media="screen" />
    <!-- Theme color -->
    <link id="switcher" href="../Views/assets/css/theme-color/default-theme.css" rel="stylesheet">

    <!-- Main style sheet -->
    <link href="../Views/assets/css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
        integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,400italic,300,300italic,500,700' rel='stylesheet'
        type='text/css'>

    </head>
    <style>
        #edit{
            position: absolute;
            top: 50px;
            left: 500px;
        }
        #create{
            position: absolute;
            top: 50px;
            left: 500px;
        }
    </style>

    <body>
        <!--<div><a href="/LearningEnglish/home">Home</a></div>-->
        <section style="position: fixed; margin-top: -103px" id="mu-menu">
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
                    <a class="navbar-brand" href="/LearningEnglish/home"><i class="fa fa-university"></i><span>Varsity</span></a>
                </div>



                <div id="navbar" class="navbar-collapse collapse">
                    <ul id="top-menu" class="nav navbar-nav navbar-right main-nav">
                        <li class="active"><a href="/LearningEnglish/home">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Course <span
                                    class="fa fa-angle-down"></span></a>


                            <ul class="dropdown-menu" role="menu">
                                <c:if test="${account.role == 1}">
                                    <li><a href="/LearningEnglish/teacher/manageCourse">Manage Course</a></li>
                                </c:if>
                                <c:if test="${account.role == 2}">
                                    <li>
                                        <a href="/LearningEnglish/student/course">My Course</a>
                                    </li>
                                </c:if>    
                                <li><a href="">Score Writing</a></li>
                                <li><a href="course-detail.html">TOEIC</a></li>
                                <li><a href="course-detail.html">IELTS</a></li>
                                <li><a href="/LearningEnglish/search?categoryId=10">Grade 10 </a></li>
                                <li><a href="/LearningEnglish/search?categoryId=11">Grade 11</a></li>
                                <li><a href="/LearningEnglish/search?categoryId=12" >Grade 12</a></li>


                            </ul>
                        </li>
                        <li><a href="gallery.html">Gallery</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Blog <span
                                    class="fa fa-angle-down"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="blog-archive.html">Blog Archive</a></li>
                                <li><a href="blog-single.html">Blog Single</a></li>
                            </ul>
                        </li>
                        <li><a href="contact.html">Contact</a></li>
                        <c:if test="${account.username != null}">
                            <li class="dropdown">

                                <img src="https://mdbcdn.b-cdn.net/img/new/avatars/2.webp" class="img-circle"
                                    style="width: 50px;margin-top: 10px;margin-left: 10px;position: absolute;"
                                    alt="Avatar" />
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-left: 50px;"> <span
                                        class="fa fa-angle-down"></span></a>
                                <ul class="dropdown-menu" role="menu">

                                    <li><a href=""> <i style="margin-right: 10px;" class="fa-solid fa-user"></i>Profile ${account.username}</a>
                                    </li>
                                    <li><a href=""><i style="margin-right: 10px;" class="fa-solid fa-key"></i>Change
                                            password</a></li>
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
        <div style="margin-top: 100px;" class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table style="margin-top: 40px;" id="mytable" class="table table-bordred table-striped">
                            <thead>
                            <th>Course Id</th>
                            <th>Course Name</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Skill</th>
                            <th>Edit</th>
                            <th>Delete</th>
                            <!--<th><a href="/TestFontend/teacher/createCourse">Create Course</a></th>-->
                            <th><button onclick="Display(0)" class="btn btn-success btn-sm">Create Course</button></th>
                            </thead>
                            <tbody>
                                <c:forEach items="${course}" var="c">
                                    <tr id="${c.courseId}">
                                        <td>${c.courseId}<img width="50" height="50" src="${c.image}" alt="alt"/> <input value="${c.courseId}" hidden=""/></td>
                                        <td>${c.nameCourse}<input value="${c.nameCourse}" hidden=""/></td>
                                        <td>${c.title}<input value="${c.title}" hidden=""/></td>
                                        <td>${c.price}<input value="${c.price}" hidden=""/></td>
                                        <td>${c.description}<input value="${c.description}" hidden=""/></td>
                                        <c:forEach items="${category}" var="ca">
                                            <c:if test="${ca.categoryId==c.categoryId}">
                                                <td>${ca.categoryName}<input value="${c.categoryId}" hidden=""/></td>
                                            </c:if>
                                        </c:forEach>
                                        <td>${c.skill}<input value="${c.skill}" hidden=""/></td>   
                                        <td>
                                            <p data-placement="top" data-toggle="tooltip" title="Edit">
                                                <!--<a href="/TestFontend/teacher/editCourse?courseId=${c.courseId}" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" >-->
                                                <button class="btn btn-primary btn-xs" onclick="GetCourse(${c.courseId})" data-title="Edit">
                                                <span class="glyphicon glyphicon-pencil"></span></button>
                                            </p>
                                        </td>
                                        <td>
                                            <p data-placement="top" data-toggle="tooltip" title="Delete">
                                                <a onclick="showMess(${c.courseId})" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
                                                    <span class="glyphicon glyphicon-trash"></span></a>
                                            </p>
                                        </td>
                                        <td>
                                            <a href="/LearningEnglish/teacher/manageLession?courseId=${c.courseId}">Manage Lession</a>
                                        </td>
                                    </tr>
                                </c:forEach>


                            </tbody>

                        </table>

                        <div class="clearfix"></div>
                        <ul class="pagination pull-right">
                            <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>
        
        <div class="modal fade"  id="create" tabindex="1" role="dialog" aria-labelledby="edit">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                            <p onclick="Hide(0)" class="close" data-dismiss="modal" aria-hidden="true">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </p>
                            <h4 class="modal-title custom_align" id="Heading">Create new Course</h4>
                        </div>
                    <form method="post" action="/LearningEnglish/teacher/createCourse" enctype="multipart/form-data">
                        <div class="modal-body">
                            <div class="form-group">
                                <input class="form-control" name="nameCourse" type="text" placeholder="name...">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="title" type="text" placeholder="title">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="price" pattern="[0-9]*" type="text" placeholder="price">
                            </div>
                            
                            <div class="form-group">
                                <textarea name="description" row="2" class="form-control" placeholder="description..."></textarea>
                            </div>
                            <div class="form-group">
                                Category: 
                                <select name="categoryId">
                                    <c:forEach items="${category}" var="c">
                                        <option value="${c.categoryId}" >${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                Skill: 
                                <select name="skill">
                                    <option value="reading" >Reading</option>
                                    <option value="writing" >Writing</option>
                                    <option value="listening" >Listening</option>
                                    <option value="Grammar" >Grammar</option>
                                </select>
                            </div>
                            <div class="form-group">    
                                <input type="file" name="file" />
                            </div>
                            <div class="modal-footer ">
                                <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Create</button>
                            </div>
                        </div>
                    </form>
<!--                    <form method="post" action="/LearningEnglish/teacher/createCourse" enctype="multipart/form-data">
                        <input name="courseId" hidden=""/>
                        <div class="modal-header">
                            <p onclick="Hide(0)" class="close" data-dismiss="modal" aria-hidden="true">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </p>
                            <h4 class="modal-title custom_align" id="Heading">Create new Course</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input class="form-control" name="nameCourse" type="text" placeholder="name...">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="title" type="text" placeholder="title">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="price" pattern="[0-9]*" type="text" placeholder="price">
                            </div>
                            <div class="form-group">
                                <input type="file" name="file"/>
                            </div>
                            <div class="form-group">
                                <textarea name="description" rows="2" class="form-control" placeholder="description..."></textarea>
                            </div>
                            <div class="form-group">
                                Category: 
                                <select name="categoryId">
                                    <c:forEach items="${category}" var="c">
                                        <option value="${c.categoryId}" >${c.categoryName}</option>
                                    </c:forEach>
                             
                </div>
            </div>
        </div>
        
        
        <div class="modal fade"  id="edit" tabindex="1" role="dialog" aria-labelledby="edit">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/LearningEnglish/teacher/editCourse" method="post" enctype="multipart/form-data">
                        <input name="courseId" hidden=""/>
                        <div class="modal-header">
                            <p onclick="Hide(1)" class="close" data-dismiss="modal" aria-hidden="true">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </p>
                            <h4 class="modal-title custom_align" id="Heading">Edit Your Course</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input class="form-control" name="nameCourse" type="text" placeholder="name...">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="title" type="text" placeholder="title">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="price" pattern="[0-9]*" type="text" placeholder="price">
                            </div>
                            <div class="form-group">
                                <textarea name="description" id="myTextarea" rows="2" class="form-control" placeholder="description..."></textarea>
                            </div>
                            <div class="form-group">
                                Category: 
                                <select id="cat" name="categoryId">
                                    <c:forEach items="${category}" var="c">
                                        <option value="${c.categoryId}" >${c.categoryName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                Skill: 
                                <select id="skill" name="skill">
                                    <option value="reading" >Reading</option>
                                    <option value="writing" >Writing</option>
                                    <option value="listening" >Listening</option>
                                    <option value="Grammar" >Grammar</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="file" name="file"/>
                            </div>
                        </div>
                        <div class="modal-footer ">
                            <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            
            function GetCourse(c){
                Display(1);
                var parent = document.getElementById(c);
                var course = parent.getElementsByTagName("input");
                var input = document.getElementById("edit").getElementsByTagName("input");
                var cat = document.getElementById("cat");
                var op = cat.getElementsByTagName("option");
                var skill = document.getElementById("skill");
                var op1 = skill.getElementsByTagName("option");
                input[0].value = course[0].value;
                input[1].value = course[1].value;
                input[2].value = course[2].value;
                input[3].value = course[3].value;
                document.getElementById("myTextarea").value = course[4].value;
                
                for(let i = 0; i < op.length; i++){
                    if(course[5].value === op[i].value){
                        op[i].setAttribute("selected", "selected");
                        break;
                    }
                }
                
                for(let i = 0; i < op1.length; i++){
                    if(course[6].value === op1[i].value){
                        op1[i].setAttribute("selected", "selected");
                        break;
                    }
                }
            }
            
            function showMess(id) {
                var s = confirm("Do you want to delete this course");
                if (s === true)
                    window.location.href = "/LearningEnglish/teacher/delete?courseId=" + id;
            }
            
            function Display(t){
                if(t === 1)
                    document.getElementById("edit").removeAttribute("class");
                else
                    document.getElementById("create").removeAttribute("class");
            }
            
            function Hide(t){
                if(t === 1)
                    document.getElementById("edit").setAttribute("class", "modal fade");
                else
                    document.getElementById("create").setAttribute("class", "modal fade");
            }
        </script>
    </body>
</html>







<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
            </div>
            <div class="modal-body">

                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>

            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
            </div>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>