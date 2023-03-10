<%-- 
    Document   : ./Views/managerViewStudent
    Created on : Feb 19, 2023, 11:17:07 PM
    Author     : Trung Nguyễn Bá
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        table, th, td {
            border:1px solid black;
        }
    </style>
    <body>
        <table>
            <tr>
                <th>Username</th>
                <th>View</th>
                <th>Status</th>
                <th>Reset Password</th>
            </tr>
<c:forEach items="${listStudents}" var="i">
    <tr>
        <td><p>${i.username}</p></td>
        <td><a  href="managerViewStudent?username=${i.username}">View</a></td>
        <td><a  href="#">Status</a></td>
        <td><a  href="#">Reset Password</a></td>
    </tr>
</c:forEach>
</table>


</body>
</html>-->

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
                    <form action="searchStudents" method="post" style="display: flex">

                        <input type="text" name="nameSearch" value="${nameSearch}" class="form-control" placeholder="Search username">
                        <label>Course Id:</label>
                        <select name="courseId">
                            <c:if test="${courseId == null}">
                                <option value="0">--- Choose CourseId ---</option>
                            </c:if>
                            <c:if test="${courseId != null}">
                                <c:if test="${courseId == 0}">
                                    <option value="0">--- Choose CourseId ---</option>
                                </c:if>
                                <c:if test="${courseId != 0}">
                                    <option value="${courseId}">${courseId}</option>
                                    <option value="0">--- Choose CourseId ---</option>
                                </c:if>

                            </c:if>
                            <c:forEach items="${listCourses}" var="i">
                                <option value="${i.courseId}">${i.courseId}</option>
                            </c:forEach>
                        </select>

                        <!--                        <input type="text" class="form-control" placeholder="Search here">
                                                <input type="text" class="form-control" placeholder="Search here">-->
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </form>
                </div>

                <a class="mobile_btn" id="mobile_btn">
                    <i class="fa fa-bars"></i>
                </a>


                <ul class="nav user-menu">

                    <li class="nav-item dropdown noti-dropdown">
                        <!--                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                                                    <i class="fa fa-bell"></i> <span class="badge badge-pill">3</span>
                                                </a>-->
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header">
                                <span class="notification-title">Notifications</span>
                                <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                            </div>
                            <div class="topnav-dropdown-footer">
                                <a href="#">View all Notifications</a>
                            </div>
                        </div>
                    </li>


                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                            <span class="user-img"><img style="height: 40px" class="rounded-circle" src="https://www.dovercourt.org/wp-content/uploads/2019/11/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.jpg"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img style="height: 40px" src="https://www.dovercourt.org/wp-content/uploads/2019/11/610-6104451_image-placeholder-png-user-profile-placeholder-image-png.jpg" alt="User Image" class="avatar-img rounded-circle">
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
                                <a href="manageStudents"><i class="fe fe-home"></i> <span>List Students</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fe fe-users"></i> <span> Users</span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="manageStudents" class="active">Users</a></li>
                                    <li><a href="#">View</a></li>
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
                                <h3 class="page-title">Manage Students</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="manageStudents">Manage Students</a></li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="display" class="row">
                        <div class="col-md-12 d-flex">

                            <div class="card card-table flex-fill">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th>User</th>
                                                    <th>Role</th>
                                                    <th>Last Login</th>
                                                    <th>Schedule</th>
                                                    <th>Status</th>
                                                    <th class="text-end">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${listStudents}" var="i">
                                                    <tr>
                                                        <td>
                                                            <h2 class="table-avatar">
                                                                <a href="managerViewStudent?username=${i.username}" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="${studentServices.getAvatarStudentByUsername(i.username)}" alt="User Image"></a>
                                                                <a href="managerViewStudent?username=${i.username}">${i.fullname}<span>${i.username}</span></a>
                                                            </h2>
                                                        </td>
                                                        <td>Student</td>
                                                        <td>${i.lastAccess}</td>
                                                        <td><a href="managerViewStudentSchedule?username=${i.username}" class="btn btn-sm bg-success-light me-2" title="Normal">
                                                                <i class="fe fe-calendar"></i>
                                                            </a></td>
                                                        <td>
                                                            <div class="actions">
                                                                <c:if test="${i.role != 2}">
                                                                    <a onclick="managerUnlockStudent('${i.username}')" class="btn btn-sm bg-success-light me-2" title="Locked">
                                                                        <i class="fe fe-disabled"></i>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${i.role == 2}">
                                                                    <a onclick="managerLockStudent('${i.username}')" class="btn btn-sm bg-success-light me-2" title="Normal">
                                                                        <i class="fe fe-check"></i>
                                                                    </a>
                                                                </c:if>
                                                            </div>
                                                        </td>
                                                        <td class="text-end">
                                                            <div class="views" style="display: flex;justify-content: flex-end;"> 
                                                                <c:if test="${i.role != 2}">
                                                                    <a onclick="managerUnlockStudent('${i.username}')" class="btn btn-sm bg-success-light me-2" title="Edit">
                                                                        <i class="fe fe-edit"></i>
                                                                    </a>
                                                                </c:if>
                                                                <c:if test="${i.role == 2}">
                                                                    <a onclick="managerLockStudent('${i.username}')" class="btn btn-sm bg-success-light me-2" title="Edit">
                                                                        <i class="fe fe-edit"></i>
                                                                    </a>
                                                                </c:if>
                                                                <a href="managerViewStudent?username=${i.username}" class="btn btn-sm bg-success-light me-2" title="View">
                                                                    <i class="fe fe-eye"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>
            function managerLockStudent(username) {
                var s = confirm('Do you want to lock ' + username);
                if (s === true)
                    window.location.href = "/LearningEnglish/managerLockStudent?username=" + username;
            }

            function managerUnlockStudent(username) {
                var s = confirm("Do you want to unlock " + username);
                if (s === true)
                    window.location.href = "managerUnlockStudent?username=" + username;
            }

            function searchStudents() {
                $.ajax({
                    url: "searchStudents",
                    type: "post"
                });
            }

        </script>

        <script src="./Views/manage/js/jquery-3.6.0.min.js"></script>

        <script src="./Views/manage/js/bootstrap.bundle.min.js"></script>

        <script src="./Views/manage/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="./Views/manage/js/script.js"></script>
    </body>
</html>

