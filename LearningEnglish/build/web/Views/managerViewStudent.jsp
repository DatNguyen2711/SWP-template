<%-- 
    Document   : ./Views/managerViewStudent
    Created on : Feb 20, 2023, 10:48:00 AM
    Author     : Trung Nguyễn Bá
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Dreamchat - Dashboard</title>

        <link rel="shortcut icon" type="image/x-icon" href="./Views/manage/img/favicon.png">

        <link rel="stylesheet" href="./Views/manage/css/bootstrap.min.css">

        <link rel="stylesheet" href="./Views/manage/css/font-awesome.min.css">

        <link rel="stylesheet" href="./Views/manage/css/feathericon.min.css">

        <link rel="stylesheet" href="./Views/manage/plugins/morris/morris.css">

        <link rel="stylesheet" href="./Views/manage/css/style.css">
    </head>

    <body>

        <div class="main-wrapper">

            <div class="header">

                <div class="header-left">
                    <a href="index.html" class="logo">
                        <img src="./Views/manage/img/logo.png" alt="Logo">
                    </a>
                    <a href="index.html" class="logo logo-small">
                        <img src="./Views/manage/img/logo-small.png" alt="Logo" width="30" height="30">
                    </a>
                </div>

                <a href="javascript:void(0);" id="toggle_btn">
                    <i class="fe fe-text-align-left"></i>
                </a>
                <div class="top-nav-search">
                    <form>
                        <input type="text" class="form-control" placeholder="Search here">
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

                <a class="mobile_btn" id="mobile_btn">
                    <i class="fa fa-bars"></i>
                </a>


                <ul class="nav user-menu">



                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                            <span class="user-img"><img class="rounded-circle" src="https://www.dovercourt.org/wp-content/uploads/2019/11/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.jpg"
                                                        width="31" alt="Seema Sisty"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="https://www.dovercourt.org/wp-content/uploads/2019/11/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.jpg" alt="User Image"
                                         class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>${account.fullname}</h6>
                                    <p class="text-muted mb-0">Manage Students</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="general.html">My Profile</a>
                            <a class="dropdown-item" href="general.html">Account Settings</a>
                            <a class="dropdown-item" href="login">Logout</a>
                        </div>
                    </li>

                </ul>

            </div>

            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">
                            </li>
                            <li>
                                <a href="#"><i class="fe fe-home"></i> <span>List Students</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fe fe-users"></i> <span> Users</span> <span
                                        class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="manageStudents">Users</a></li>
                                    <li><a href="#" class="active">View</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>


            <div class="page-wrapper">
                <div class="content container-fluid">
                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Profile of Student</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">List Students</a></li>
                                    <li class="breadcrumb-item active">View</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row settings-tab">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header all-center">
                                    <a href="general.html" class="avatar avatar-sm me-2"><img
                                            class="avatar-img rounded-circle" src="${studentProfile.avatar}"
                                            alt="User Image">
                                    </a>
                                    <h6>${student.fullname}</h6>
                                    <p>Student</p>
                                </div>
                                <div class="card-body p-0">
                                    <div class="profile-list">
                                        <a href="#"><i class="fe fe-user"></i></a>
                                        <a href="#">Age</a>
                                        <a href="#" class="float-end">
                                            <h6>${student.age}</h6>
                                        </a>
                                    </div>
                                    <div class="profile-list">
                                        <a href="#"><i class="fe fe-phone"></i></a>
                                        <a href="#">Phone</a>
                                        <a href="#" class="float-end">
                                            <h6>${student.phone}</h6>
                                        </a>
                                    </div>
                                    <c:if test="${student.role != 2}">
                                        <div class="profile-list">
                                            <a href="#"><i class="fe fe-disabled"></i></a>
                                            <a href="#">Status</a>
                                            <a href="#" class="float-end">
                                                <h6>Locked</h6>
                                            </a>
                                        </div>
                                        <!--                                        <div class="profile-list">
                                                                                    <a onclick="managerUnlockStudent()"><button type="button"
                                                                                                                                                        class="btn btn-block btn-outline-light">Unlock</button></a>
                                                                                </div>-->
                                    </c:if>
                                    <c:if test="${student.role == 2}">
                                        <div class="profile-list">
                                            <a href="#"><i class="fe fe-check"></i></a>
                                            <a href="#">Status</a>
                                            <a href="#" class="float-end">
                                                <h6>Normal</h6>
                                            </a>
                                        </div>
                                        <!--                                        <div class="profile-list">
                                                                                    <a onclick="managerLockStudent()"><button type="button"
                                                                                                                                                      class="btn btn-block btn-outline-light">Lock</button></a>
                                                                                </div>-->
                                    </c:if>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">General Settings</h4>
                                </div>
                                <div class="card-body">
                                    <form action="#">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" class="form-control" value="${student.username}">
                                        </div>
                                        <div class="form-group">
                                            <label>Fullname</label>
                                            <input type="text" class="form-control" value="${student.fullname}">
                                        </div>
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" class="form-control" value="${student.address}">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" value="${student.email}">
                                        </div>
                                        <c:if test="${listCourses.size() == 0}">
                                            <p>${student.username} has no enrolled any courses!</p>
                                        </c:if>
                                        <c:if test="${listCourses.size() != 0}">
                                            <p>List Course ${student.username} enrolled</p>
                                            <div class="comment">
                                                <c:forEach items="${listCourses}" var="i">
                                                    <a style="cursor: pointer" onclick="loadComment('${i.courseId}')">${i.nameCourse}</a><br>
                                                    <div id="eachComment">
                                                        <c:forEach items="${ratingServices.getListRatingsByStudentNameAndCourseId(student.username, i.courseId)}" var="j">

                                                        </c:forEach>
                                                    </div>
                                                </c:forEach>
                                            </div>  
                                        </c:if>
                                        <div class="text-end">
                                            <a href="manageStudents" class="btn btn-primary">Back to Manage</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>
            function managerLockStudent() {
                var s = confirm("Do you want to lock ${student.fullname}");
                if (s === true)
                    window.location.href = "managerLockStudent?username=${student.username}";
            }

            function managerUnlockStudent() {
                var s = confirm("Do you want to unlock ${student.fullname}");
                if (s === true)
                    window.location.href = "managerUnlockStudent?username=${student.username}";
            }


            var count = 0;
            function loadComment(courseId) {
                $.ajax({
                    url: "loadCommentForManager?courseId=" + courseId,
                    type: "get",
                    success: function (data) {
                        var row = document.getElementById("eachComment");
                        var rowAfter = row.innerHTML + data;
                        if (count < 1) {
                            row.innerHTML = rowAfter;
                            count++;
                        } else if (count === 1) {
                            row.innerHTML = null;
                            count = 0;
                        }
                    }
                });
            }
        </script>

        <script src="./Views/manage/js/jquery-3.6.0.min.js"></script>

        <script src="./Views/manage/js/bootstrap.bundle.min.js"></script>

        <script src="./Views/manage/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="./Views/manage/js/script.js"></script>
    </body>

</html>