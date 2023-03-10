<%-- 
    Document   : manageQuiz
    Created on : Feb 8, 2023, 2:26:05 PM
    Author     : 84877
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        #content{
            margin-top: 100px;
            margin-left: 300px;
        }
        .item{
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 0px 5px #555;
            width: 850px;
            padding-left: 20px;
        }
        .item:hover{
            box-shadow: 0px 0px 5px #C133FF;
        }
        .question{
            border: none;
            font-family: "Jost";
            width: 600px;
            height: 170px;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }
        .answer{
            border: none;
            width: 400px;
            height: 50px;
            margin-left: 30px;
            margin-bottom: 10px;
            
        }
        .footer{
            width: 600px;
            border-top: 1px solid grey;
            border-top-width: 3px;
        }
        .co-answer{
            border: none;
            width: 400px;
            height: 50px;
            margin-left: 30px;
            margin-top: 10px;
        }
        .text{
            width: 870px;
            height: 200px;
            box-shadow: 0px 0px 5px #555;
            border-radius: 5px; 
            padding: 20px 30px;
            margin-bottom: 30px;
            font-size: 20px;
            margin-top: 50px;
            margin-left: 300px;
        }
        .text:hover{
            box-shadow: 0px 0px 5px #C133FF;
        }
    </style>
    <body>
        <div><a href="/LearningEnglish/teacher/manageLession?lessionId=${sessionScope.lessionId}">Manage Lession</a></div>
        <c:if test="${topic!=null}">
            <div class="text">
                <textarea id="text" class="question" disabled="disabled" value="${topic}">${topic}</textarea>
                <button style="position: absolute; top: 100px; left: 1000px" onclick="ChangeQuestion()">Modify</button>
                <span id="message"></span>
            </div>
        </c:if>
        <c:if test="${text!=null}">
            <div class="text">
                <textarea disabled="disabled" id="text" rows="4" cols="50" class="question" value="${text}">${text}</textarea>
                <button style="position: absolute; top: 100px; left: 1000px" onclick="ChangeQuestion()">Modify</button>
                <span id="message"></span>
            </div>
        </c:if>
        <c:if test="${topic==null}">
            <div id="content">    
            <c:forEach items="${multiple}" var="q">
                <div class="item" id="${q.questionId}">
                    <input value="${q.questionId}" hidden/>
                    <div>
                        <c:if test="${text!=null}">
                            ${q.questionId-1}.
                        </c:if> 
                        <c:if test="${text==null}">
                            ${q.questionId}.
                        </c:if>    
                        <input class="question" type="text" name="question" value="${q.question}" disabled="disabled"/> 
                        <button value="aa" onclick="Change(${q.questionId})">Modify</button> <span></span>
                    </div>
                    <c:forEach items="${q.answer}" var="a">
                        <div>
                            <input class="answer" type="text" name="answer" oninput="Check(${q.questionId})" value="${a}" disabled="disabled"/>
                        </div>
                    </c:forEach>
                    <div class="footer">
                        Correct Answer: <input class="co-answer" name="correctAnswer" oninput="Check(${q.questionId})" onchange="Check(${q.questionId})" value="${q.correctAnswer}" disabled="disabled"/>
                        <p id="mess"></p>
                    </div>
                </div>
            </c:forEach>
            </div>
            <button onclick="AddNew(${multiple.size()})" id="add">Add new question</button>
        </c:if>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <script>
                function ChangeQuestion(){
                    var text = document.getElementById("text");
                    var value = text.value;
                    if(text.getAttribute("disabled") === "disabled")
                        text.removeAttribute("disabled");
                    else{
                        text.setAttribute("disabled", "disabled");
                        $.ajax({
                        type: "POST",
                        url: "/LearningEnglish/teacher/manageQuiz",
                        data: {
                            content:value
                        },
                        //if received a response from the server
                        success: function(data) {
                            document.getElementById("message").innerHTML = "modify successfully.";
                        }
                        });
                
                    }
                }
                
                var no = 1;
                function AddNew(s){
                    var parent = document.getElementById("content");
                    parent.innerHTML += "<div id=\""+(s+no)+"\">\n" +
"                <input value=\""+(s+no)+"\" hidden=\"\">\n" +
"                <div>"+(s+no)+". <input type=\"text\" name=\"question\" disabled=\"disabled\"> \n" +
"                    <button value=\"aa\" onclick=\"Add("+(s+no)+")\">Add</button> <span></span>\n" +
"                </div>\n" +
"                \n" +
"                    <div>\n" +
"                        <input type=\"text\" name=\"answer\" oninput=\"Check("+(s+no)+")\" disabled=\"disabled\">\n" +
"                    </div>\n" +
"                \n" +
"                    <div>\n" +
"                        <input type=\"text\" name=\"answer\" oninput=\"Check("+(s+no)+")\" disabled=\"disabled\">\n" +
"                    </div>\n" +
"                \n" +
"                    <div>\n" +
"                        <input type=\"text\" name=\"answer\" oninput=\"Check("+(s+no)+")\" disabled=\"disabled\">\n" +
"                    </div>\n" +
"                \n" +
"                    <div>\n" +
"                        <input type=\"text\" name=\"answer\" oninput=\"Check("+(s+no)+")\" disabled=\"disabled\">\n" +
"                    </div>\n" +
"                \n" +
"                    Correct Answer: <input name=\"correctAnswer\" oninput=\"Check("+(s+no)+")\" onchange=\"Check("+(s+no)+")\" disabled=\"disabled\">\n" +
"                    <p id=\"mess\"></p>\n" +
"            </div>";
//                document.getElementById(an).appendChild(node);
//                    parent.appendChild(node);
//                    document.getElementById("add").innerHTML += no+s;
                    no++;
                }
                
                function Add(row){
                    var parent = document.getElementById(row);
                    var input = parent.getElementsByTagName("input");
                    var check = parent.getElementsByTagName("input")[1];
                    let text = check.getAttribute("disabled");
                    var content = "", insertOrUpdate = 1;
                    if(text === "disabled"){
                        for(let i = 1; i < input.length; i++){
                            input[i].removeAttribute("disabled");
                        }
                        var button = parent.getElementsByTagName("button");
                        
                        button[0].innerHTML = "Save";
                    }else{
                        for(let i = 1; i < input.length; i++){
                            if(i < input.length-1)
                                content += input[i].value+"///";
                            else
                                content += input[i].value;
                            input[i].setAttribute("disabled", "disabled");
                        }
                        content += "///"+row+"///"+insertOrUpdate;
                        var button = parent.getElementsByTagName("button");
                        button[0].innerHTML = "Modify";
                        
                        $.ajax({
                            type: "POST",
                            url: "/LearningEnglish/teacher/manageQuiz",
                            data: {
                                content:content
                            },
                            //if received a response from the server
                            success: function(data) {
                                parent.getElementsByTagName("span")[0].innerHTML = "modify successfully.";
                            }
                            }); 
                    }
                }
                
                function Change(s){
                    var parent = document.getElementById(s);
                    var input = parent.getElementsByTagName("input");
                    var check = parent.getElementsByTagName("input")[1];
                    let text = check.getAttribute("disabled");
                    var content = "", rowNum = input[0].value, insertOrUpdate = false;
                    if(text === "disabled"){
                        for(let i = 1; i < input.length; i++){
                            input[i].removeAttribute("disabled");
                        }
                        var button = parent.getElementsByTagName("button");
                        
                        button[0].innerHTML = "Save change";
                    }
                    else{
                        for(let i = 1; i < input.length; i++){
                            if(i < input.length-1)
                                content += input[i].value+"///";
                            else
                                content += input[i].value;
                            input[i].setAttribute("disabled", "disabled");
                        }
                        content += "///"+rowNum+"///"+insertOrUpdate;
                        var button = parent.getElementsByTagName("button");
                        button[0].innerHTML = "Modify";
                        
                        $.ajax({
                            type: "POST",
                            url: "/LearningEnglish/teacher/manageQuiz",
                            data: {
                                content:content
                                //rowNum:rowNum,
                                //check:insertOrUpdate
                            },
                            //if received a response from the server
                            success: function(data) {
                                parent.getElementsByTagName("span")[0].innerHTML = "modify successfully.";
                            }
                            }); 
                    }
                }
                
                function Check(s){
                    var parent = document.getElementById(s);
                    var input = parent.getElementsByTagName("input");
                    var check = false;
                    var text = "";
                    var text1 = input[input.length-1].value;
                    for(let i = 0; i < input.length-1; i++){
                        text += input[i].value;
                        if(input[i].value === text1){
                            text1 += input[i].value +", "+ input[input.length-1].value;
                            check = true;
                            break;
                        }
                    }
                    if(check === false){
                        parent.getElementsByTagName("p")[0].innerHTML = "the correct answer must be is of these answer above.";
                        parent.getElementsByTagName("button")[0].setAttribute("disabled", "disabled");
                    }
                    else{
                        parent.getElementsByTagName("p")[0].innerHTML = "";
                        parent.getElementsByTagName("button")[0].removeAttribute("disabled");
                    }
                }
            </script>            
    </body>
</html>
