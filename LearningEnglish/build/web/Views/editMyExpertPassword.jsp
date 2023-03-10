<%-- 
    Document   : editMyStudentPassword
    Created on : Feb 16, 2023, 1:07:35 PM
    Author     : Trung Nguyễn Bá
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/styleeditprofile.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <title></title>
        <title>JSP Page</title>
    </head>
    <style>
        body {
            background: linear-gradient(to right, #4ca2cd, #67B26F);
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #01bafd
        }

        .profile-button {
            background: rgb(99, 39, 120);
            box-shadow: none;
            border: none
        }

        .profile-button:hover {
            background: #01bafd
        }

        .profile-button:focus {
            background: #01bafd;
            box-shadow: none
        }

        .profile-button:active {
            background: #01bafd;
            box-shadow: none
        }

        .back:hover {
            color: #01bafd;
            cursor: pointer
        }

        .labels {
            font-size: 11px
        }

        .add-experience:hover {
            background: #BA68C8;
            color: #fff;
            cursor: pointer;
            border: solid 1px #BA68C8
        }

        img {
            opacity:1;
            transition: opacity 0.3s ease-in-out;
        }

        img:hover {
            opacity: 0.7;
        }

        .image-container {
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
        }

        .overlay-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #fff;
            font-weight: bold;
            font-size: 18px;
        }
    </style>
    <body>
        <!--        <form action="changeMyExpertPassword" method="post">
                    <label for="fname">Old Password:</label>
                    <input type="password" name="oldPassword" required><br>
                    <label for="fname">New Password:</label>
                    <input type="password" name="newPassword" required><br>
                    <label for="fname">Confirm New Password:</label>
                    <input type="password" name="confirmPassword" required><br>
                    <button type="submit">Save</button>
                </form>
                <a href="myExpertProfile">Back</a>
                <h2>${error}</h2>-->

        <div class="container rounded bg-white mt-5 mb-5" style="width: 60%">
            <div class="row">
                <div class="col-md-4 border-right">
                    <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5"
                                                                                                 width="150px"
                                                                                                 height="150px"
                                                                                                 src="${expert.getAvatar()}"><span
                                                                                                 class="font-weight-bold">${account.getFullname()}</span><span
                                                                                                 class="text-black-50">${account.getEmail()}</span><span>
                        </span>
                        <button class="btn btn-primary mt-3" style="background-color: #0d6efd;">Change avatar</button>
                    </div>
                </div>
                <div class="col-md-8 border-right">
                    <form action="changeMyExpertPassword" method="post">
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Password Settings</h4>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Old Password</label><input type="password"
                                                                                                        class="form-control" name="oldPassword" required></div>
                                <div class="col-md-12"><label class="labels">New Password</label><input type="password"
                                                                                                        class="form-control" name="newPassword" required></div>
                                <div class="col-md-12"><label class="labels">Confirm Password</label><input type="password"
                                                                                                            class="form-control" name="confirmPassword" required></div>
                            </div>
                            <div class="mt-5 text-center"><button class="btn btn-primary profile-button" type="submit">Save
                                    Password</button></div>
                            <!--<div><p style="color: green">${bell}</p></div>-->
                        </div>
                </div>
                </form>
            </div>  
        </div>
        <a href="myExpertProfile">Back</a>
        <h2>${error}</h2>

    </body>
</html>
