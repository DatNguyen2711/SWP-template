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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" 
              integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
            />
        <script src="https://unpkg.com/animatestyle"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>
        .content{
            margin: 100px 200px;
        }

        .lession{
            position: relative;
            margin-bottom: 30px;
            width: 700px;
            height: 80px;
            background-color: #fff;
            box-shadow: 0px 0px 20px #ccc;
            padding-top: 10px;
            border-radius: 10px;
        }
        .lession:hover{
            transform: scale(1.1);
            border-bottom: 5px solid #ccc;
        }
        .lession > h4{
            position: relative;
            font-size: 24px;
            padding-left: 50px;
            width: 600px;
            cursor: pointer;
            margin-right: 20px;
        }
        #more{
            color: gray;
            position: absolute;
            top: -5px;
            left: 660px;
            cursor: pointer;
        }
        #options{
            display: none;
            position: absolute;
            width: 150px;
            height: 190px;
            top: 18px;
            left: 700px;
            font-size: 15px;
            background-color: #ccc;
            box-shadow: 0px 0px 5px gray;
            cursor: pointer;
            border-radius: 6px;
        }
        #options > p{
            border-bottom: 1px solid #0A092D;
            margin-bottom: 0px;
            padding: 10px 0px;
        }
        #options > p:hover{
            text-decoration: #fff;
            background-color: white;
        }
        #options > p>a:hover{
            text-decoration: none;
            /*background-color: white;*/
        }
        #create{
            position: absolute;
            top: 100px;
            left: 500px;
        }
        #edit{
            position: absolute;
            top: 100px;
            left: 500px;
        }
        #view{
            position: absolute;
            top: 100px;
            left: 500px;
        }
        #createQuiz{
            position: absolute;
            top: 100px;
            left: 500px;
        }
        .quiz{
            display: none;
            /*            margin-left: 70px;
                        padding-bottom: 10px;*/
        }
        .mycourse-title{
            font-size: 40px;
            text-align: center;
            align-items: center;
            padding: 40px 0px;
            background: #ccc;

        }
        .mycourse-title a{
            font-weight: 600;
            text-decoration: none;
            color: #fff;
        }
        .mycourse-title a::before{
            content: "";
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: black;
            transition: width 0.3s ease-out;
        }
        .mycourse-title a:hover::before {
            width: 100%;

        }
        .total-lession p{
            font-size: 35px;
        }
        .btn-add-back{
            margin-left: 79%;
        }
        .btn-add-back button{
            margin-top: 20px;
            margin-left: 13%;

        }
        .content{
            margin-top: 20px;
        }
        .options p a{
            width: 100%;
            margin: 0px;
            padding-top: 5px;

        }
        .quiz{
            display: block;
            margin: 20px 0px;
            background-color: #01bafd;
            border-radius: 7px;
            border: 2px solid #fff;
            padding: 10px 0px;
            width: 400px;
        }
        .quiz:hover{
            /*border-bottom: 5px solid yellow;*/
            opacity: 0.8;
        }
        .quiz a{
            width: 60%;
            margin-left: 20px;
        }
        .quiz-content{
            color: white;
            font-size: 15px;
            margin: 7px 0px;
            margin-left: 12px;
        }
    </style>
    <body>
        <div class="mycourse-title"style="background: #324960;">
            <a href="/LearningEnglish/teacher/manageCourse">My Lession</a>
            <div>
                <h4 style="text-align: center;color: #ffffff;padding-bottom: 10px"><i class="fa-solid fa-house"></i> 
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff;font-weight: unset" href="/LearningEnglish/home">Home</a>  <i class="fa-solid fa-angle-right"></i>
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff;font-weight: unset" href="/LearningEnglish/teacher/manageCourse">Manage course</a>  <i class="fa-solid fa-angle-right"></i>
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff;font-weight: unset" href="/LearningEnglish/teacher/manageLession?courseId=${courseId}">Manage lession</a></h4>


            </div>
        </div>

        <div class="btn-add-back">

            <button onclick="Display(0)" class="btn btn-sm btn-primary"><i class="fa-sharp fa-solid fa-plus"></i> Create New Lession</button></br>
            <a href="/LearningEnglish/teacher/manageCourse"><button style="color: white;padding: 5px 50px;margin-top: 12px" class="btn btn-sm btn-primary"><i class="fa-solid fa-backward"></i> Back </button></a> 
        </div>


        <div class="content"onclick="showQuiz()">
            <c:forEach items="${lession}" var="l">
                <div class="lession" id="${l.lessionId}">
                    <h4 onclick="ViewQuiz(${l.lessionId})">${l.nameLession}<input value="${l.nameLession}" hidden=""/>
                        <span style="margin: 30px"><input value="${l.stt}" hidden=""/></span>
                        <span onclick="Show(${l.lessionId})" id="more">...</span>
                        <input value="${l.path}" hidden=""/>
                    </h4>
                    <div id="options">
                        <p><i style="color: #2a6496;margin-left: 10px" class="fa-solid fa-pen-to-square"></i><a style="font-size: 18px;margin-left: 10px" onclick="GetLession(${l.lessionId})"> Edit</a></p>
                        <p><i  style="color: #2a6496;margin-left: 10px"class="fa-solid fa-trash"></i><a style="font-size: 18px;margin-left: 10px"onclick="showMess(${l.lessionId})"> Delete</a></p>
                        <p><i  style="color: #2a6496;margin-left: 10px"class="fa-solid fa-eye"></i><a style="font-size: 18px;margin-left: 10px" onclick="ShowView(${l.lessionId})"> View</a></p>
                        <p><i  style="color: #2a6496;margin-left: 10px"class="fa-sharp fa-solid fa-circle-plus"></i><a style="font-size: 18px;margin-left: 10px"onclick="ShowForm(${l.lessionId})"> Create Quiz</a></p>
                    </div>
                </div>
                <c:forEach items="${quiz}" var="q">
                    <c:if test="${q.lessionId==l.lessionId}">
                        <div class="quiz ${l.lessionId}">
                            <a class="quiz-content" href="/LearningEnglish/teacher/manageQuiz?quizId=${q.quizId}"> <i class="fa-solid fa-file-lines"></i>  ${q.nameQuiz}</a>
                            <p style="color: #fff;margin-left: 18px;"><i style="color: #fff" class="fa-solid fa-clock"></i>    duration: ${q.duration} minutes</p> 
                            <c:if test="${q.type == 'Writing'}">
                                <a style="color: #fff;border-top:2px solid #fff;padding-right: 294px;" href="/LearningEnglish/teacher/markWritting?quizId=${q.quizId}">Mark Writting</a>
                            </c:if>
                        </div>
                    </c:if> 
                </c:forEach>
            </c:forEach>
        </div>


        <div class="modal fade"  id="view" tabindex="1" role="dialog" aria-labelledby="edit">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <p onclick="Hide(2)" class="close" data-dismiss="modal" aria-hidden="true">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </p>
                        <h4 class="modal-title custom_align" id="Heading">View Lession</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <h3></h3>
                        </div>
                        <div class="form-group">

                        </div>
                        <div id="video" class="form-group">
                            <!--                                <video width="320" height="240" controls>
                                                                <source type="video/mp4">
                                                                Your browser does not support the video tag.
                                                            </video>-->
                        </div>
                    </div>
                    <!--                        <div class="modal-footer ">
                                                <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Create</button>
                                            </div>-->
                </div>
            </div>
        </div>


        <div class="modal fade"  id="create" tabindex="1" role="dialog" aria-labelledby="edit">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/LearningEnglish/teacher/createLession" method="post" enctype="multipart/form-data">
                        <div class="modal-header">
                            <p onclick="Hide(0)" class="close" data-dismiss="modal" aria-hidden="true">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </p>
                            <h4 class="modal-title custom_align" id="Heading">Create new Lession</h4>
                        </div>
                        <div class="modal-body">


                            <div class="form-group">
                                <input class="form-control" name="nameLession" type="text" placeholder="name...">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="stt" pattern="[0-9]*" type="text" placeholder="stt">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="file"  type="file" >
                            </div>
                        </div>
                        <div class="modal-footer ">
                            <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade"  id="edit" tabindex="1" role="dialog" aria-labelledby="edit">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/LearningEnglish/teacher/editLession" method="post" enctype="multipart/form-data">
                        <input name="lessionId" hidden=""/>
                        <div class="modal-header">
                            <p onclick="Hide(1)" class="close" data-dismiss="modal" aria-hidden="true">
                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            </p>
                            <h4 class="modal-title custom_align" id="Heading">Edit Lession</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input class="form-control" name="nameLession" type="text" placeholder="name...">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="stt" pattern="[0-9]*" type="text" placeholder="stt">
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="file"  type="file" >
                            </div>
                        </div>
                        <div class="modal-footer ">
                            <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Edit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div  class="modal fade" id="createQuiz" tabindex="1" role="dialog" aria-labelledby="edit">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <p onclick="Hide(3)" class="close" data-dismiss="modal" aria-hidden="true">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </p>
                        <h4 class="modal-title custom_align" id="Heading">Create Quiz</h4>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="/LearningEnglish/teacher/createQuiz" enctype="multipart/form-data">
                            <input id="lessionIdOfQuiz" name="lessionId" hidden/>
                            <div class="form-group">
                                Type of quiz: <select id="mySelect" onchange="checkType()" name="type">
                                    <option value="multiple choice" selected="">multiple choice</option>
                                    <option value="listen">Listen</option>
                                    <option value="reading">Reading</option>
                                    <option value="Writing">Writing</option>
                                </select>
                            </div>


                            <div class="form-group" style="display: flex">
                                <p style="margin-top: 5px;margin-right: 20px"> Name:</p> <input type="text" class="form-control" name="nameQuiz"/>  
                            </div>
                            <div class="form-group" style="display: flex">
                                <p style="margin-top: 5px;margin-right: 6px">Duration:</p>  <input type="number" name="duration" class="form-control"/>
                            </div>
                            <div id="excel" class="form-group" style="display: flex">
                                <p style="margin-right: 25px">Excel:</p>  <input type="file" name="file" />
                            </div>
                            <div id="audio" class="form-group">
                            </div>
                            <div class="modal-footer ">
                                <button type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Create Quiz</button>
                            </div>
                        </form>
                    </div>

                </div>

            </div>

            <script>
                function showMess(id) {
                    var s = confirm("Do you want to delete this course");
                    if (s === true)
                        window.location.href = "/LearningEnglish/teacher/delete?lessionId=" + id;
                    Show(id);
                }

                function checkType() {
                    var x = document.getElementById("mySelect").value;
                    if (x === 'listen') {
                        document.getElementById("audio").innerHTML = "Audio: <input type='file' name='audio'/>";
                        document.getElementById("excel").innerHTML = "Excel: <input type='file' name='file'/>";
                    } else if (x === 'Writing') {
                        document.getElementById("excel").innerHTML = "";
                        document.getElementById("audio").innerHTML = "<textarea rows='10' cols='45' name='question' placeholder='question...'></textarea>";
                    } else {
                        document.getElementById("excel").innerHTML = "Excel: <input type='file' name='file'/>";
                        document.getElementById("audio").innerHTML = "";
                    }

                }

                function ViewQuiz(id) {
                    var quiz = document.getElementsByClassName("quiz " + id);
                    var display = "";
                    if (quiz[0].style.display === "none") {
                        display = "block";
                    } else {
                        display = "none";
                    }
                    for (let i = 0; i < quiz.length; i++) {
                        quiz[i].style.display = display;
                    }
                }

                function ShowView(id) {
                    Display(2);
                    Show(id);
                    var parent = document.getElementById(id);
                    var input = parent.getElementsByTagName("input");
                    var s = document.getElementById("view").getElementsByTagName("h3");
                    s[0].innerHTML = input[0].value;
                    document.getElementById("video").innerHTML = "<video width=\"320\" height=\"240\" controls>\n" +
                            "                                <source src=\"" + input[2].value + "\" type=\"video/mp4\">\n" +
                            "                                Your browser does not support the video tag.\n" +
                            "                            </video>";

                }
                function showQuiz() {
                    const quizzes = document.querySelectorAll('.quiz');
                    quizzes.forEach((quiz) => {
                        quiz.animate(
                                [
                                    {opacity: '0', transform: 'translateY(-20px)'},
                                    {opacity: '1', transform: 'translateY(0)'},
                                ],
                                {duration: 500, easing: 'ease-in-out'}
                        );
                    });
                }


                function ShowForm(id) {
                    Display(3);
                    document.getElementById("lessionIdOfQuiz").value = id;
                }

                function GetLession(id) {
                    Display(1);
                    var parent = document.getElementById(id);
                    var input = parent.getElementsByTagName("input");
                    var data = document.getElementById("edit").getElementsByTagName("input");
                    data[0].value = id;
                    data[1].value = input[0].value;
                    data[2].value = input[1].value;
                    Show(id);
                }

                function Show(t) {
                    var parent = document.getElementById(t);
                    var c = parent.getElementsByTagName("div");
                    if (c[0].style.display === "block")
                        c[0].style.display = "none";
                    else
                        c[0].style.display = "block";

                }

                function Display(t) {
                    if (t === 1)
                        document.getElementById("edit").removeAttribute("class");
                    else if (t === 0)
                        document.getElementById("create").removeAttribute("class");
                    else if (t === 2)
                        document.getElementById("view").removeAttribute("class");
                    else
                        document.getElementById("createQuiz").removeAttribute("class");
                }

                function Hide(t) {
                    if (t === 1)
                        document.getElementById("edit").setAttribute("class", "modal fade");
                    else if (t === 0)
                        document.getElementById("create").setAttribute("class", "modal fade");
                    else if (t === 2)
                        document.getElementById("view").setAttribute("class", "modal fade");
                    else
                        document.getElementById("createQuiz").setAttribute("class", "modal fade");

                }

            </script>
    </body>
</html>