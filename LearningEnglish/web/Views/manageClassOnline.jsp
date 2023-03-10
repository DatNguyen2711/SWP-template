<%-- 
    Document   : manageClassOnline
    Created on : Feb 28, 2023, 8:51:07 PM
    Author     : 84877
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css" integrity="sha512-/2285SnGiTHjSKBkJzedsJ8wwSP0j74ZQyusMQ9j5Z1RtyKqZ3XtfS8hVp8OadLs2uq+8V6/n+CyqUNTO/UpYg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <style>

        body{
            font-family: Helvetica;
            -webkit-font-smoothing: antialiased;
            /*background: rgba( 71, 147, 227, 1);*/
            background: #f7f7f9
        }


        /* Table Styles */

        .table-wrapper{
            margin: 10px 70px 70px;
            box-shadow: 0px 35px 50px rgba( 0, 0, 0, 0.2 );
        }

        .fl-table {
            border-radius: 5px;
            font-size: 12px;
            font-weight: normal;
            border: none;
            border-collapse: collapse;
            width: 100%;
            max-width: 100%;
            white-space: nowrap;
            background-color: white;
        }

        .fl-table td, .fl-table th {
            text-align: center;
            padding: 8px;
        }

        .fl-table td {
            border-right: 1px solid #f8f8f8;
            font-size: 16px;
        }

        .fl-table thead th {
            color: #ffffff;
            background: #4FC3A1;
        }


        .fl-table thead th:nth-child(odd) {
            color: #ffffff;
            background: #324960;
        }

        .fl-table tr:nth-child(even) {
            background: #F8F8F8;
        }
        @import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro);

        body {
            background: #ffffff;
            color: #414141;
            font: 400 17px/2em 'Source Sans Pro', sans-serif;
        }

        .select-box {
            cursor: pointer;
            position : relative;
            max-width:  20em;
            margin: 5em auto;
            width: 100%;
        }

        .select,
        .label {
            color: #414141;
            display: block;
            font: 400 17px/2em 'Source Sans Pro', sans-serif;
        }

        .select {
            width: 100%;
            position: absolute;
            top: 0;
            padding: 5px 0;
            height: 40px;
            opacity: 0;
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            background: none transparent;
            border: 0 none;
        }
        .select-box1 {
            background: #ececec;
        }

        .label {
            position: relative;
            padding: 5px 10px;
            cursor: pointer;
        }
        .open .label::after {
            content: "▲";
        }
        .label::after {
            content: "▼";
            font-size: 12px;
            position: absolute;
            right: 0;
            top: 0;
            padding: 5px 15px;
            border-left: 5px solid #fff;
        }

        /* Responsive */

        @media (max-width: 767px) {
            .fl-table {
                display: block;
                width: 100%;
            }
            .table-wrapper:before{
                content: "Scroll horizontally >";
                display: block;
                text-align: right;
                font-size: 11px;
                color: white;
                padding: 0 0 10px;
            }
            .fl-table thead, .fl-table tbody, .fl-table thead th {
                display: block;
            }
            .fl-table thead th:last-child{
                border-bottom: none;
            }
            .fl-table thead {
                float: left;
            }
            .fl-table tbody {
                width: auto;
                position: relative;
                overflow-x: auto;
            }
            .fl-table td, .fl-table th {
                padding: 20px .625em .625em .625em;
                height: 60px;
                vertical-align: middle;
                box-sizing: border-box;
                overflow-x: hidden;
                overflow-y: auto;
                width: 120px;
                font-size: 13px;
                text-overflow: ellipsis;
            }
            .fl-table thead th {
                text-align: left;
                border-bottom: 1px solid #f7f7f9;
            }
            .fl-table tbody tr {
                display: table-cell;
            }
            .fl-table tbody tr:nth-child(odd) {
                background: none;
            }
            .fl-table tr:nth-child(even) {
                background: transparent;
            }
            .fl-table tr td:nth-child(odd) {
                background: #F8F8F8;
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tr td:nth-child(even) {
                border-right: 1px solid #E6E4E4;
            }
            .fl-table tbody td {
                display: block;
                text-align: center;
            }
        }
        .modal{
            display: none;
        }
        table td{
            font-size: 20px;
        }
        a{
            text-decoration: none;
        }
        .class-name {
            border-radius: 9px;
            border: 2px solid #ccc;
            padding: 5px;
            font-size: 16px;
            outline: none;
        }

        .class-name:focus {
            border-color: #4d90fe;
            box-shadow: 0 0 5px rgba(77, 144, 254, 0.8);
        }

        .class-name:valid {
            border-color: #000;
        }



    </style>
    <body>
        <div style="background: #324960;">
            <h2 style="text-align: center;padding:35px 0px;margin-top: 0px;color: #ffffff;font-size: 40px;font-weight: 600;">Schedule </h2>
            <div>
                <h4 style="text-align: center;color: #ffffff;padding-bottom: 30px"><i class="fa-solid fa-house"></i> 
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff" href="/LearningEnglish/home">Home</a>  <i class="fa-solid fa-angle-right"></i>
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff" href="/LearningEnglish/teacher/manageClassOnline">Manage class online</a> </h4>


            </div>
        </div>
        <a style="margin-left: 60px" href="/LearningEnglish/home"><button class="bttn-minimal bttn-md bttn-primary">Back To Home</button></a>

        <div class="table-wrapper">
            <table class="fl-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name class</th>
                        <th>Time Start</th>
                        <th>Time End</th>
                        <th>Link</th>
                        <th>Status</th>
                        <th>Set Schedule</th>
                        <th>View Timetable</th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${classOnline}" var="c">
                        <tr>
                            <td>${c.id}</td>
                            <td>${c.nameClass}</td>
                            <td>${c.timeStart}</td>
                            <td>${c.timeEnd}</td>
                            <td>
                                <a href="${c.link}">Go to link</a>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${c.status == 'on'}">
                                        <span style="color:green;font-size: 20px;font-weight: 600">${c.status}</span>
                                    </c:when>
                                    <c:when test="${c.status == 'off'}">
                                        <span style="color:red">${c.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        ${c.status}
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <button type="button" class="btn btn-info btn-lg" data-toggle="modal" onclick="GetClassId(${c.id})" data-target="#schedule"> <i class="fa-solid fa-hammer"></i>Set Schedule</button>
                            </td>
                            <td>
                                <i style="color: #337ab7" class="fa-solid fa-eye"></i>  <a href="/LearningEnglish/teacher/timeTable?classId=${c.id}">View Time Table</a>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>
        <button type="button" style="text-align: center;align-items: center;margin-left: 42%" class="bttn-material-flat bttn-md bttn-primary" data-toggle="modal" data-target="#myModal"><i class="fa-sharp fa-solid fa-plus"></i>Create New Class</button>

        <!-- Modal -->
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Create Class Online</h4>
                    </div>
                    <div class="modal-body">
                        <form action="/LearningEnglish/teacher/createClassOnline" method="post">
                            <div class="form-group">
                                Name Class: <input name="nameClass"class="class-name" type="text" style="border-radius: 9px;width: 350px;height: 39px;"/>
                            </div>
                            <div class="form-group">
                                Time Start: <input id="startDate" style="border-radius: 9px;margin-left:13px;width: 350px "name="timeStart" oninput="CheckStartDate(this)" type="date"/>
                                <p style="color: red;" id="mess1"></p>
                            </div>
                            <div class="form-group">
                                Time End: <input name="timeEnd"style="border-radius: 9px;margin-left:18px;width: 350px" oninput="CheckTimeEnd(this)" type="date"/>
                                <p style="color: red;" id="mess2"></p>
                            </div>

                            <div style="margin-top: 20px" class="form-group">
                                <button id="btnCreate" class="btn btn-lg btn-primary">Create</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>


        <div class="modal fade" id="schedule" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Set schedule</h4>
                    </div>
                    <div class="modal-body">

                        <div class="form-group">
                            <p> Class Id :</p> <input id="classId" name="classId" style="width: 350px;height: 39px;border-radius: 6px"readonly/>
                        </div>

                        <div id="dayOfWeek" class="form-group">
                            <p> Day Of Week:</p>
                            <select name="dayOfweek"style="width: 350px;height: 39px;border-radius: 6px">
                                <option value="2">Monday</option>
                                <option value="3">Tuesday</option>
                                <option value="4">Wednesday</option>
                                <option value="5">Thursday</option>
                                <option value="6">Friday</option>
                                <option value="7">Saturday</option>
                                <option value="1">Sunday</option>
                            </select>
                        </div>
                        <!--                        <div class="select-box" style="margin-top:-47px" >
                        
                                                    <label for="select-box1" class="label select-box1"><span class="label-desc">Choose date</span> </label>
                                                    <select id="select-box1" class="select">
                                                        <option value="2">Monday</option>
                                                        <option value="3">Tuesday</option>
                                                        <option value="4">Wednesday</option>
                                                        <option value="5">Thursday</option>
                                                        <option value="6">Friday</option>
                                                        <option value="7">Saturday</option>
                                                        <option value="1">Sunday</option>
                                                    </select>
                                                </div>-->

                        <div class="form-group">
                            <p>Number of Slot:</p>  <input id="numOfSlot" style="width: 350px;height: 39px;border-radius: 6px"oninput="GetNumOfSlot()" type="number"/>
                        </div>
                        <div id="slot" class="form-group">
                            <p> Slot:</p><select name="slot"style="width: 350px;height: 39px;border-radius: 6px">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                            </select>
                        </div>
                        <div style="margin-top: 20px" class="form-group">
                            <button class="btn btn-lg btn-primary">Create</button>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
                                    function GetClassId(id) {
                                        document.getElementById("classId").value = id;
                                    }

                                    function CheckStartDate(t) {
                                        var today = new Date();
                                        var year = today.getFullYear();
                                        var month = today.getMonth() + 1;
                                        if (month < 10)
                                            month = '0' + month;
                                        var day = today.getDate();
                                        if (day < 10)
                                            day = '0' + day;
                                        today = year + "-" + month + "-" + day;
                                        var start = t.value;
                                        if (today > start) {
                                            document.getElementById("mess1").innerHTML = "Start date must be today or in future!";
                                            document.getElementById("btnCreate").setAttribute("disabled", "disabled");
                                        } else {
                                            document.getElementById("mess1").innerHTML = "";
                                            document.getElementById("btnCreate").removeAttribute("disabled");
                                        }
                                    }


                                    function CheckTimeEnd(t) {
                                        var start = document.getElementById("startDate").value;
                                        var end = t.value;
                                        if (start >= end) {
                                            document.getElementById("mess2").innerHTML = "End time must be after start time!";
                                            document.getElementById("btnCreate").setAttribute("disabled", "disabled");
                                        } else {
                                            document.getElementById("mess2").innerHTML = "";
                                            document.getElementById("btnCreate").removeAttribute("disabled");
                                        }
                                    }

                                    function GetNum() {
                                        var num = document.getElementById("numOfDay").value;
                                        if (num > 7)
                                            num = 7;
                                        var s = document.getElementById("dayOfWeek");
                                        var select = "";
                                        for (let i = 0; i < num; i++) {
                                            select +=
                                                    "<select name=\"dayOfweek\">\n" +
                                                    "                        <option value=\"2\">Monday</option>\n" +
                                                    "                        <option value=\"3\">Tuesday</option>\n" +
                                                    "                        <option value=\"4\">Wednesday</option>\n" +
                                                    "                        <option value=\"5\">Thursday</option>\n" +
                                                    "                        <option value=\"6\">Friday</option>\n" +
                                                    "                        <option value=\"7\">Saturday</option>\n" +
                                                    "                        <option value=\"1\">Sunday</option>\n" +
                                                    "                    </select>";
                                        }
                                        s.innerHTML = select;
                                    }

                                    function GetNumOfSlot() {
                                        var num = document.getElementById("numOfSlot").value;
                                        if (num > 6)
                                            num = 6;
                                        var select = "Slot: ";
                                        for (let i = 0; i < num; i++) {
                                            select +=
                                                    "<select name=\"slot\">\n" +
                                                    "                        <option value=\"1\">1</option>\n" +
                                                    "                        <option value=\"2\">2</option>\n" +
                                                    "                        <option value=\"3\">3</option>\n" +
                                                    "                        <option value=\"4\">4</option>\n" +
                                                    "                        <option value=\"5\">5</option>\n" +
                                                    "                        <option value=\"6\">6</option>\n" +
                                                    "                    </select>";
                                        }
                                        document.getElementById("slot").innerHTML = select;
                                    }
                                    $("select").on("click", function () {

                                        $(this).parent(".select-box").toggleClass("open");

                                    });

                                    $(document).mouseup(function (e)
                                    {
                                        var container = $(".select-box");

                                        if (container.has(e.target).length === 0)
                                        {
                                            container.removeClass("open");
                                        }
                                    });


                                    $("select").on("change", function () {

                                        var selection = $(this).find("option:selected").text(),
                                                labelFor = $(this).attr("id"),
                                                label = $("[for='" + labelFor + "']");

                                        label.find(".label-desc").html(selection);

                                    });
        </script>
    </body>
</html>
