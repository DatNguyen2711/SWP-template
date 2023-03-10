<%-- 
    Document   : manageTeacher
    Created on : Mar 2, 2023, 8:36:23 PM
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
    </head>
    <style>
        .modal{
            display: none;
        }
    </style>
    <body>
        <a href="/LearningEnglish/home">Home</a>
        <c:if test="${list.size()>0}">
            <table>
                <thead>
                <th>Class ID</th>
                <th>Teacher Name</th>
                <th>Class Name</th>
                <th>Time Start</th>
                <th>Time End</th>
                <th>Confirm</th>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="l">
                    <tr>
                        <td>${l.id}</td>
                        <c:forEach items="${expert}" var="e">
                            <c:if test="${l.username==e.username}">
                                <td>${e.fullname}</td>
                            </c:if>
                        </c:forEach>
                        <td>${l.nameClass}</td>
                        <td>${l.timeStart}</td>
                        <td>${l.timeEnd}</td>
                        <td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" onclick="GetClassId(${l.id})" >Confirm</button></td>
                    </tr>
                </c:forEach>   
            </tbody>
        </table>
    </c:if>
    <c:if test="${request.size()>0}">
        <table border="1">
            <thead>
            <th>ID</th>
            <th>Class ID</th>
            <th>Day Of Week/ Date</th>
            <th>Slot</th>
            <th>State</th>
            <th>Confirm</th>
        </thead>
        <tbody>
            <c:forEach items="${request}" var="r">
                <tr>
                    <td>${r.id}</td>
                    <td>${r.classId}</td>
                    <c:choose>
                        <c:when test="${r.dayOfWeek=='2'}">
                            <td>Mondays</td>
                        </c:when>
                        <c:when test="${r.dayOfWeek=='3'}">
                            <td>Tuesday</td>
                        </c:when>
                        <c:when test="${r.dayOfWeek=='4'}">
                            <td>Wednesday</td>
                        </c:when>
                        <c:when test="${r.dayOfWeek=='5'}">
                            <td>Thursday</td>
                        </c:when>
                        <c:when test="${r.dayOfWeek=='6'}">
                            <td>Friday</td>
                        </c:when>
                        <c:when test="${r.dayOfWeek=='7'}">
                            <td>Saturday</td>
                        </c:when>
                        <c:when test="${r.dayOfWeek=='1'}">
                            <td>Sunday</td>
                        </c:when>
                        <c:otherwise>
                            <!--<td>${r.dayOfWeek}</td>-->
                        </c:otherwise>
                    </c:choose>

                    <td>${r.slot}</td>
                    <c:choose>
                        <c:when test="${r.isUpdate}">
                            <td>Update a slot</td>
                        </c:when>
                        <c:otherwise>
                            <td>Set a schedule</td>
                        </c:otherwise>
                    </c:choose>
                    <td>
                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#check" onclick="CheckExist(${r.classId})" class="btn btn-info btn-sm">Check Exist</button>
                        <form action="/LearningEnglish/confirmSetUpSchedule" method="post">
                            <input name="id" value="${r.id}" hidden=""/>
                            <input name="dayOfWeek" value="${r.dayOfWeek}" hidden=""/>
                            <input name="classId" value="${r.classId}" hidden=""/>
                            <input name="slot" value="${r.slot}" hidden=""/>
                            <button type="submit" class="btn btn-info btn-sm" >Confirm</button>
                        </form>
                        <a href="/LearningEnglish/deleteRequest?rId=${r.id}">Delete</a>    
                    </td>
                </tr>
            </c:forEach> 
        </tbody>
    </table>
</c:if>
<c:if test="${requestUpdate.size()>0}">
    <table border="2">
        <thead>
        <th>ID</th>
        <th>From</th>
        <th>To</th>
        <th>Class ID</th>
        <th>Confirm</th>
    </thead>
    <tbody>
        <c:forEach items="${requestUpdate}" var="ru">
            <tr>
                <td>${ru.id}</td>
                <c:forEach items="${timeTables}" var="t">
                    <c:if test="${ru.id==t.id}">
                        <td>Date: ${t.dateStudy} Slot: ${t.slot}</td>
                    </c:if>
                </c:forEach>
                <td>Date: ${ru.newDate} Slot: ${ru.newSlot}</td>
                <td>${ru.classId}</td>
                <td id="${ru.id}">
                    <form action="/LearningEnglish/confirmRequestUpdate" method="post">
                        <input id="ruId" name="id" value="${ru.id}" hidden=""/>
                        <input id="ruDate" name="newDate" value="${ru.newDate}" hidden=""/>
                        <input id="ruSlot" name="newSlot" value="${ru.newSlot}" hidden=""/>
                        <input name="classId" value="${ru.classId}" hidden=""/>
                        <input type="submit" value="confirm"/>
                    </form>
                    <a href="/LearningEnglish/deleteRequest?ruId=${ru.id}">Delete</a> 
                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#checkStudent" onclick="CheckStudentExist(${ru.id})" class="btn btn-info btn-sm">Check Exist</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</c:if>
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
                <form action="/LearningEnglish/confirmClassOnline" method="post">
                    <input name="id" id="id" hidden="" />
                    <div class="form-group">
                        Create Link: <input name="link" type="text"/>
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


<!-- Modal -->
<div class="modal fade" id="check" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Check Schedule Class Online</h4>
            </div>
            <div class="modal-body">
                <p id="message"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>


<div class="modal fade" id="checkStudent" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Check Schedule Class Online</h4>
            </div>
            <div class="modal-body">
                <p id="message1"></p>
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
                            document.getElementById("id").value = id;
                        }

                        function CheckExist(classId) {
                            $.ajax({
                                type: "POST",
                                url: "/LearningEnglish/manageTeacher",
                                data: {
                                    classId: classId
                                },
                                //if received a response from the server
                                success: function (data) {
                                    document.getElementById("message").innerHTML = data;
                                }
                            });
                        }
                        
                        function CheckStudentExist(id){
                            var parent = document.getElementById(id);
                            var input = parent.getElementsByTagName("input");
//                            alert(input.length);
                            var result = input[1].value+"///"+input[2].value+"///"+input[3].value;
                            $.ajax({
                                type: "POST",
                                url: "/LearningEnglish/manageTeacher",
                                data: {
                                    result: result
                                },
                                //if received a response from the server
                                success: function (data) {
                                    document.getElementById("message1").innerHTML = data;
                                }
                            });
                        }
</script>
</body>
</html>
