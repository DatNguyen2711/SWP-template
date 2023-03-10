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
        *{
            font-size: 24px;
        }
        #content{
            margin: 40px 300px;
        }
        .question{
            width: 900px;
            /*height: 300px;*/
            margin-bottom: 20px;
            box-shadow: 0px 0px 5px #555;
            border-radius: 5px;
            padding: 40px 60px;
        }
        .question input{
            margin: 13px 30px;
            border: none;
            width: 600px;
            height: 50px;
            border-radius: 10px;
            box-shadow: 0px 0px 5px #555;
            padding-left: 15px;
        }
        .question textarea{
            width: 700px;
        }
        .question input:hover{
            box-shadow: 0px 0px 5px #21bf73;
        }
        #q{
            border: none;
            box-shadow: none;
            font-weight: bold;
        }
        .text{
            margin: 50px 300px;
        }
        video{
            display: none;
        }
        .input-field{
            position: absolute;
            top: 75px;
            left: 700px;
            box-shadow: 0px 0px 5px #555;
            border-radius: 5px;
            padding: 10px 30px;
            width: 700px;
            height: 800px;
        }
        .input-field textarea{
            width: 700px;
            height: 650px;
            border: none;
        }
        #w-content{
            position: relative;
        }
        #w.text{
            position: absolute;
            top: 30px;
            left: -240px;
            width: 600px;
            height: 800px;
        }
        #w textarea{
            width: 600px;
            height: 800px;
            box-sizing: border-box;
        }
    </style>
    <body>
        </div>    <a href="/LearningEnglish/home">Home</a>    
        <p>${aa}</p>
        <div>
            <input hidden="" id="duration" value="${quiz.duration}"/>
            <input id="quizId" value="${quiz.quizId}" hidden=""/>
            <span id="timer"></span><span id="view-duration">/ ${quiz.duration} minutes</span>
        </div>
        <c:if test="${audio!=null}">
            <video width="320" height="240" controls autoplay>
            <source src="${audio}" type="video/mp4">
            Your browser does not support the video tag.
          </video>
        </c:if>
        <c:if test="${topic!=null}">
            <div id="w-content">
                <div id="w" class="text">
                    <textarea id="text" style="font-weight: bold" class="question" disabled="disabled"  value="${topic}">${topic}</textarea>
                </div>
            <div class="input-field">
                <input value="write" hidden="" id="type"/>
                <textarea id="writting" placeholder="typing here..."></textarea>
                <button onclick="SubmitWritting(this)" class="btn btn-danger">Submit</button>
            </div>
            </div>
        </c:if>
        <c:if test="${text!=null}">
            <div class="text">
                <textarea disabled="disabled" style="font-weight: bold; border: none; width: 900px" id="text" rows="4" cols="50" class="question2" value="${text}">${text}</textarea>
            </div>
        </c:if>
        <c:if test="${topic==null}">
            <input value="mul" hidden="" id="type"/>
            <div id="content">
                <c:forEach items="${multiple}" var="q">
                    <div class="question" id="${q.questionId}">
                        <input value="${q.questionId}" hidden/>
                        <div>
                            <span style="position: absolute; left: 330px;">
                                <c:if test="${quiz.type=='reading'}">
                                    ${q.questionId-1}.
                                </c:if>
                                <c:if test="${quiz.type!='reading'}">
                                    ${q.questionId}.
                                </c:if>
                            </span> 
                            <textarea id="q" type="text" name="question" value="${q.question}" disabled="disabled">${q.question}</textarea> 
                        </div>
                        <c:forEach items="${q.answer}" var="a">
                            <div>
                                <input type="text" name="answer" onclick="SelectAns(${q.questionId}, this)" value="${a}" readonly/>
                            </div>
                        </c:forEach>
                            <p id="mess"></p>
                    </div>
                </c:forEach>
            </div>
            <button onclick="GetResult()">Submit</button>
        </c:if>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <script>
                
                
                function SubmitWritting(t){
                    
                    if(confirm("do you want to finish") === true){
                        clearInterval(count);
                        var text = document.getElementById("writting").value;
                        text += "///"+document.getElementById("quizId").value;
                        $.ajax({
                            type: "POST",
                            url: "/LearningEnglish/student/getResult",
                            data: {
                                content:text
                            },
                            success: function(data) {
                                document.getElementById("view-duration").style.display = "none";
                                document.getElementById("timer").innerHTML = data;
                                document.getElementById("writting").setAttribute("disabled", "disabled");
                                t.setAttribute("disabled", "disabled");
                            }
                        });
                    }
                    
                }
                
                
                function GetResult(){
                    clearInterval(count);
//                    var content = document.getElementById("content");
                    var parent = document.getElementsByClassName("question");
                    var result = "";

                    for(let i = 0; i < parent.length; i++){
                        var input = parent[i].getElementsByTagName("input");
                        for(let j = 1; j < input.length; j++){
                            if(input[j].style.backgroundColor === "green"){
                                result += input[0].value + input[j].value + "///";
                            }
                        }
                        
                    }
                    result += document.getElementById("quizId").value;
                    $.ajax({
                        type: "POST",
                        url: "/LearningEnglish/student/getResult",
                        data: {
                            content:result
                        },
                        success: function(data) {
                            document.getElementById("view-duration").style.display = "none";
                            document.getElementById("timer").innerHTML = data;
                            
                            document.body.scrollTop = 0;
                            document.documentElement.scrollTop = 0;
                        }
                        });
                }
                
                
                function SelectAns(questionId, t){
                    var parent = document.getElementById(questionId);
                    var input = parent.getElementsByTagName("input");
                    t.style.backgroundColor = "green";
                    for(let i = 1; i < input.length; i++){
                        if(input[i].style.backgroundColor === "green" && input[i] !== t)
                        {
                            input[i].style.backgroundColor = "white";
                        }
                    }
                }
                
                var minutes = 0, seconds = 0, time;
                function Start(){
//                    time = duration;
                    var x = document.getElementById("duration").value;
                    if(minutes+"" === x){
                        var type = document.getElementById("type").value;
                        if(type === "mul")
                            GetResult();
                        else
                            SubmitWritting();
                        clearInterval(count);
                    }else{
                        seconds++;
                        if(seconds === 60){
                            minutes++;
                            seconds = 0;
                        }
                        document.getElementById("timer").innerHTML = minutes + " minutes : "+seconds +" seconds";
                    }
                   
                }
                var count = setInterval('Start()', 1000);   
    
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
                

            </script>            
    </body>
</html>
