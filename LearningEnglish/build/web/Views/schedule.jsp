<%-- 
    Document   : timeTable
    Created on : Feb 28, 2023, 1:14:16 PM
    Author     : 84877
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="UTF-8">

        <link rel="apple-touch-icon" type="image/png"
              href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">

        <meta name="apple-mobile-web-app-title" content="CodePen">

        <link rel="shortcut icon" type="image/x-icon"
              href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico">

        <link rel="mask-icon" type="image/x-icon"
              href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-b4b4269c16397ad2f0f7a01bcdf513a1994f4c94b8af2f191c09eb0d601762b1.svg"
              color="#111">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 

        <script src="https://cdn.tailwindcss.com"></script>

        <title> Timetable</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karla">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bttn.css/0.2.4/bttn.min.css" integrity="sha512-/2285SnGiTHjSKBkJzedsJ8wwSP0j74ZQyusMQ9j5Z1RtyKqZ3XtfS8hVp8OadLs2uq+8V6/n+CyqUNTO/UpYg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            html,
            body {
                margin: 0;
                font-family: "Karla";
                color: #333;
            }

            * {
                box-sizing: border-box;
            }

            .timetable {
                display: grid;
                grid-template-areas: ". week" "time content";
                grid-template-columns: 120px;
                grid-template-rows: 60px;
                width: 100vw;
                height: 100vh;
            }

            .timetable .accent-pink-gradient {
                display: flex;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #ee8ebc, #eea08e);
                transition: 0.2s ease box-shadow, 0.2s ease transform;
            }

            .timetable .accent-pink-gradient:hover {
                box-shadow: 0 20px 30px 0 rgba(238, 142, 188, 0.3);
                transform: scale(1.05);
            }

            .timetable .accent-orange-gradient {
                display: flex;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #eec08e, #dcee8e);
                transition: 0.2s ease box-shadow, 0.2s ease transform;
            }

            .timetable .accent-orange-gradient:hover {
                box-shadow: 0 20px 30px 0 rgba(238, 192, 142, 0.3);
                transform: scale(1.05);
            }

            .timetable .accent-green-gradient {
                display: flex;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #bcee8e, #8eeea0);
                transition: 0.2s ease box-shadow, 0.2s ease transform;
            }

            .timetable .accent-green-gradient:hover {
                box-shadow: 0 20px 30px 0 rgba(188, 238, 142, 0.3);
                transform: scale(1.05);
            }

            .timetable .accent-cyan-gradient {
                display: flex;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #8eeec0, #8edcee);
                transition: 0.2s ease box-shadow, 0.2s ease transform;
            }

            .timetable .accent-cyan-gradient:hover {
                box-shadow: 0 20px 30px 0 rgba(142, 238, 192, 0.3);
                transform: scale(1.05);
            }

            .timetable .accent-blue-gradient {
                display: flex;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #8ebcee, #a08eee);
                transition: 0.2s ease box-shadow, 0.2s ease transform;
            }

            .timetable .accent-blue-gradient:hover {
                box-shadow: 0 20px 30px 0 rgba(142, 188, 238, 0.3);
                transform: scale(1.05);
            }

            .timetable .accent-purple-gradient {
                /*display: flex;*/
                padding-left: 8px;
                width: 100%;
                height: 100%;
                background: linear-gradient(135deg, #c08eee, #ee8edc);
                transition: 0.2s ease box-shadow, 0.2s ease transform;
            }

            .timetable .accent-purple-gradient:hover {
                box-shadow: 0 20px 30px 0 rgba(192, 142, 238, 0.3);
                transform: scale(1.05);
            }

            .timetable .weekend {
                background: #fbfbfc;
                color: #87a1ad;
            }

            .timetable .week-names {
                grid-area: week;
                display: grid;
                grid-template-columns: repeat(7, 1fr);
                text-transform: uppercase;
                font-size: 12px;
            }

            .timetable .week-names>div {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                height: 100%;
                box-shadow: inset 1px 0 0 #ECEFF1;
            }

            .timetable .time-interval {
                grid-area: time;
                display: grid;
                grid-template-rows: repeat(6, 1fr);
                font-size: 14px;
            }

            .timetable .time-interval>div {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                height: 100%;
                box-shadow: inset 0 1px 0 0 #ECEFF1;
            }

            .timetable .content {
                grid-area: content;
                display: grid;
                grid-template-rows: repeat(6, 1fr);
                grid-template-columns: repeat(7, 1fr);
            }
            .timetable{
                width: 1000px;
                height: 600px;
                margin: 20px 200px;
                border: 1px solid #87a1ad;
                margin-bottom: 100px;
            }
            .timetable .content>div {
                box-shadow: inset 1px 0 0 #ECEFF1, inset 0 1px 0 0 #ECEFF1;
            }
            .back-to-home{
                text-decoration: none;
                margin-left: 72%;
            }

            .selectdiv {
                position: relative;
                /*Don't really need this just for demo styling*/
                float: left;
                min-width: 200px;
                /*margin: 50px 33%;*/
                /*margin-top: 80px;*/
            }

            /* IE11 hide native button (thanks Matt!) */
            select::-ms-expand {
                display: none;
            }

            .selectdiv:after {
                content: '<>';
                font: 17px "Consolas", monospace;
                color: #333;
                -webkit-transform: rotate(90deg);
                -moz-transform: rotate(90deg);
                -ms-transform: rotate(90deg);
                transform: rotate(90deg);
                right: 11px;
                /*Adjust for position however you want*/

                top: 18px;
                padding: 0 0 2px;
                border-bottom: 1px solid #999;
                /*left line */

                position: absolute;
                pointer-events: none;
            }

            .selectdiv select {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                /* Add some styling */

                display: block;
                width: 100%;
                max-width: 320px;
                height: 50px;
                float: right;
                margin: 5px 0px;
                padding: 0px 24px;
                font-size: 16px;
                line-height: 1.75;
                color: #333;
                background-color: #ffffff;
                background-image: none;
                border: 1px solid #cccccc;
                -ms-word-break: normal;
                word-break: normal;
                border-radius:  9px;
            }
            select option:hover{
                background: #4338ca;
            }
            .schedule-title{
                text-align: center;
                align-items: center;
                font-weight: 600;
                color: #ffff;
                font-size: 40px;
                margin-top: 0px;
                background: #324960;
                margin-bottom: 80px;
            }
            option:hover{
                background-color:  red;
                color: blue;
            }
            .breadcrumb >h4> a:hover{
                color: #8ebcee;
            }
            .back-to-home:hover{
                color:#8ebcee;
            }
        </style>

        <script>
            window.console = window.console || function (t) { };
        </script>



        <script>
            if (document.location.search.match(/type=embed/gi)) {
                window.parent.postMessage("resize", "*");
            }
        </script>


    </head>

    <body onload="GetTimeTable()" translate="no">

        <div style="background: #324960;">
            <h2 style="text-align: center;padding:35px 0px;margin-top: 0px;color: #ffffff;font-size: 40px;font-weight: 600;">My Schedule </h2>
            <div class="breadcrumb">
                <h4 style="text-align: center;color: #ffffff;padding-bottom: 30px"><i class="fa-solid fa-house"></i> 
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';" style="color: #ffffff" href="/LearningEnglish/home">Home</a>  <i class="fa-solid fa-angle-right"></i>
                    <a onmouseover="this.style.color = '#8ebcee';" onmouseout="this.style.color = '#ffffff';"style="color: #ffffff" href="/LearningEnglish/loadSchedule">My Schedule</a> </h4>


            </div>
        </div>
        <h1 class="schedule-title" style="padding-bottom: 0px"></h1>



        <!--<button class="bttn-simple bttn-md bttn-primary" href="/LearningEnglish/home">Back To Home</button>-->
        <div style="display: inline">
            <p style="margin-left: 200px;margin-bottom:-41px">Year:</p>
            <div> 

                <div class="selectdiv" style="margin-left: 250px;margin-right: 50px">
                    <select id="year" class="select-options">
                    </select>
                </div>
            </div>
            <p style="margin-left: 400px;margin-bottom:-38px;margin-top: 20px">Date & Months:</p>

            <div style="">
                <div class="selectdiv" style="margin-left: 130px;" >
                    <label>
                        <select onchange="GetTimeTable()" id="week" class="select-options">
                            <c:forEach items="${week}" var="w">
                                <option selected value="${w}">${w}</option>
                            </c:forEach>
                        </select>
                    </label>
                </div>
            </div>

        </div>





        <a class="back-to-home"href="/LearningEnglish/home" style="top:2%">Back To Home</a>
        <div class="timetable">
            <div class="week-names">
                <div>monday</div>
                <div>tuesday</div>
                <div>wednesday</div>
                <div>thursday</div>
                <div>friday</div>
                <div class="weekend">saturday</div>
                <div class="weekend">sunday</div>
            </div>
            <div class="time-interval">
                <div>8:00 - 10:00</div>
                <div>10:00 - 12:00</div>
                <div>12:00 - 14:00</div>
                <div>14:00 - 16:00</div>
                <div>16:00 - 18:00</div>
                <div>18:00 - 20:00</div>
            </div>
            <div id="content" class="content">

            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
                            var count = 0;
                            function GetTimeTable() {
                                if (count === 0) {
                                    var year = new Date().getFullYear();
                                    document.getElementById("year").innerHTML = "<option value='" + year + "'>" + (year) + "</option>" + "<option value='" + (year + 1) + "'>" + (year + 1) + "</option>";
                                    count++;
                                }

                                var week = document.getElementById("week").value;
                                var year = document.getElementById("year").value;
                                var result = week + "///" + year;
                                $.ajax({
                                    type: "POST",
                                    url: "/LearningEnglish/loadSchedule",
                                    data: {
                                        result: result
                                    },
                                    //if received a response from the server
                                    success: function (data) {
                                        document.getElementById("content").innerHTML = data;
                                    }
                                });
                            }
        </script>
    </body>

</html>
